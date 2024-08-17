let alprEnabled = false;

let onMarkerUI = false;
let onSettingsUI = false;
let onEditingUI = false;

let characterId;
let currentMarkerId;
let currentAlertId;

let markerId = -1;
let alertId = 0;

let uiAlertScale = 1;
let uiReaderScale = 1;

let hasFrontAlert = false;
let hasRearAlert = false;

const plateHistory = [];
let markers = [];

/**
 * Object with the different available alert types
 */
const alertTypes = {
  danger: 0,
  warning: 1
};

/**
 * Contains a list of quick reference elements
 */
const elements = {
  alerts: {
    front: {
      text: $('#front-reader-text'),
      reason: $('#front-reader-reason')
    },
    rear: {
      text: $('#rear-reader-text'),
      reason: $('#rear-reader-reason')
    }
  },
  plates: {
    front: {
      plate: $('#front-plate'),
      text: $('#front-plate-text'),
      fill: $('#front-plate-text-fill'),
      lolite: $('#front-plate-text-lolite'),
      img: $('#front-plate-img'),
      lock: $('#front-plate-locked')
    },
    rear: {
      plate: $('#rear-plate'),
      text: $('#rear-plate-text'),
      fill: $('#rear-plate-text-fill'),
      lolite: $('#rear-plate-text-lolite'),
      img: $('#rear-plate-img'),
      lock: $('#rear-plate-locked')
    }
  }
};

// Sound Files
const sounds = {
  shutter: './sounds/shutter.mp3',
  cchord: './sounds/cchord.ogg',
  local: './sounds/local_alert.mp3',
  ncic: './sounds/ncic_alert.mp3'
};

const soundTypes = {
  shutter: 0,
  local: 1,
  ncic: 2,
  cchord: 3,
};

const shutterSound = new Audio(sounds.shutter);
const cchordSound = new Audio(sounds.cchord);
const localSound = new Audio(sounds.local);
const ncicSound = new Audio(sounds.ncic);

let shutterVol = 0.8;
let cchordVol = 0.8;
let localVol = 0.8;
let ncicVol = 0.8;

/**
 * Play correct sounds from the sound selection to match the various events
 * @param {Integer} soundType
 */
function playSound(soundType) {
  if (soundType === soundTypes.shutter && (hasFrontAlert || hasRearAlert)) {
    return;
  }

  shutterSound.pause(); shutterSound.currentTime = 0;
  cchordSound.pause(); cchordSound.currentTime = 0;
  localSound.pause(); localSound.currentTime = 0;
  ncicSound.pause(); ncicSound.currentTime = 0;

  if (soundType === soundTypes.shutter) {
    shutterSound.volume = shutterVol;
    shutterSound.play();
  } else {
    cchordSound.volume = cchordVol;
    cchordSound.play();

    // if (soundType === soundTypes.local) {
    //   localSound.volume = localVol;
    //   localSound.play();
    // } else {
    //   ncicSound.volume = ncicVol;
    //   ncicSound.play();
    // }
  }
}

/**
 * Calculations the directional component of an ALPR ping
 * @param {Object} payload
 */
function toAlprDirection(payload) {
  let directionString = '';

  directionString += (payload.IsFront ? 'F' : 'R');
  directionString += (payload.IsFront ? 'L' : 'R');

  return directionString;
}

/**
 * Updates a plate on the UI with the appropriate plate colors and plate information.
 * @param {Boolean} isFront
 * @param {String} licensePlate
 * @param {Number} plateIndex
 */
function setPlate(isFront, licensePlate, plateIndex) {
  const pl = elements.plates[(isFront ? 'front' : 'rear')];

  pl.img.attr('src', `images/plates/${plateIndex}.png`);

  if (plateIndex === 1 || plateIndex === 2) {
    pl.fill.removeClass('plate-blue').addClass('plate-yellow');
    pl.lolite.hide();
  } else {
    pl.fill.removeClass('plate-yellow').addClass('plate-blue');
    pl.lolite.show();
  }

  pl.text.find('p').each(function forEach() {
    $(this).html(licensePlate);
  });
}

/**
 * Updates the Alert UI element to show the correct size for active alerts
 */
function updateAlertUI() {
  if (hasFrontAlert && hasRearAlert) {
    $('#rear-reader').show();
    $('#front-reader').show();
    $('#alpr-alert-frame').removeClass('alert-single').addClass('alert-both').show();
  } else if (hasFrontAlert && !hasRearAlert) {
    $('#rear-reader').hide();
    $('#front-reader').show();
    $('#alpr-alert-frame').addClass('alert-single').removeClass('alert-both').show();
  } else if (!hasFrontAlert && hasRearAlert) {
    $('#rear-reader').show();
    $('#front-reader').hide();
    $('#alpr-alert-frame').addClass('alert-single').removeClass('alert-both').show();
  } else {
    $('#alpr-alert-frame').hide();
  }
}

/**
 * Update the Alert UI to show a vehicle alert
 * @param {Boolean} isFront
 * @param {Boolean} isLeft
 * @param {String} vehInfo
 * @param {Integer} alertType
 * @param {String} alertInfo
 */
function setAlert(isFront, isLeft, vehInfo, alertType, alertInfo) {
  const alertElement = elements.alerts[(isFront ? 'front' : 'rear')];
  alertElement.text.text(vehInfo.toUpperCase());
  alertElement.reason.text(alertInfo.toUpperCase());

  // if (alertType === alertType.warning) {
    alertElement.reason.addClass('alert-orange').removeClass('alert-red');
  // } else {
  //   alertElement.reason.addClass('alert-red').removeClass('alert-orange');
  // }

  updateAlertUI();
}

/**
 * Converts a date value to a scanned time format
 * @param {Date} scanDate
 */
function formatTime(scanDate) {
  return `${scanDate.getUTCHours()}:${scanDate.getUTCMinutes()}Z`;
}

/**
 * Converts a date value to a scanned date format
 * @param {Date} scanDate
 */
function formatDate(scanDate) {
  return `${(scanDate.getUTCMonth() + 1).toString().padStart(2, '0')}/${scanDate.getUTCDate().toString().padStart(2, '0')}/${scanDate.getUTCFullYear()}`;
}

/**
 * Updates the ALPR interface with information from the provided alertId
 * @param {Integer} scanAlertId
 */
function setScanInformation(scanAlertId) {
  let scanString = '<code>';

  const pInfo = plateHistory.find(p => p.alertId === parseInt(scanAlertId, 10));

  if (pInfo) {
    scanString += `${pInfo.RequestedAtTime} ${pInfo.RequestedAtDate} ${pInfo.alertId.toString().padStart(5, '0')} ${pInfo.LicensePlate}<br/><br/>`;
    scanString += 'TXT<br/><br/>';
    scanString += 'IDENT: NCIC / LOCAL VEHICLE CHECK<br/><br/>';

    if (pInfo.Vehicle) {
      let expiryDate = pInfo.Vehicle.ExpiryDate;

      if (!expiryDate) {
        const dateNow = new Date();
        expiryDate = new Date(dateNow.getFullYear() + 2, dateNow.getMonth(), dateNow.getDate());
      }
      const dateNow2 = new Date();

      scanString += `REG VALID FROM: ${pInfo.RegisteredOn} TO ${formatDate(new Date((expiryDate)))}<br/>`;
      scanString += `LIC#: ${pInfo.LicensePlate.toUpperCase()} // MAKE: ${pInfo.Vehicle.Model.toUpperCase()} // COLOR: ${pInfo.Vehicle.Color.toUpperCase()}<br/>`;

      if (pInfo.Vehicle.MatchingBolo) {
        scanString += `<span class="alert-orange alert-bold">BOLO MATCH: ${pInfo.Vehicle.MatchingBolo.DisplayNumber} - ${pInfo.LicensePlate}</span><br/>`;
      }

      if (pInfo.Vehicle.IsStolen) {
        scanString += '<span class="alert-red alert-bold">REPORTED STOLEN!</span><br/>';
      }

      scanString += '<br/>';

      if (pInfo.License) {
        scanString += `R/O: ${pInfo.License.FirstName} ${pInfo.License.LastName}<br/>`;
        scanString += `LIC VALID FROM: ${pInfo.License.IssueDate} TO ${pInfo.License.ExpiryDate}<br/>`;

        const licenseOffences = [];

        if (pInfo.License.IssueDate > new Date(Date.UTC())) {
          licenseOffences.push('<span class="alert-red alert-bold">INVALID</span>');
        }

        if (pInfo.License.ExpiryDate < new Date(Date.UTC())) {
          licenseOffences.push('<span class="alert-red alert-bold">EXPIRED</span>');
        }

        if (pInfo.License.IsSuspended) {
          licenseOffences.push('<span class="alert-red alert-bold">SUSPENDED</span>');
        }

        if (pInfo.License.IsRevoked) {
          licenseOffences.push('<span class="alert-red alert-bold">REVOKED</span>');
        }

        if (licenseOffences.length) {
          scanString += `${licenseOffences.join(' ')}<br/>`;
        }

        if (pInfo.License.MatchingBolo) {
          scanString += `<span class="alert-orange alert-bold">POTENTIAL BOLO MATCH: ${pInfo.License.MatchingBolo.DisplayNumber} - ${pInfo.License.FirstName} ${pInfo.License.LastName}</span><br/>`;
        }

        scanString += '<br/>';
      } else {
        scanString += 'REG VALID FROM: <span class="alert-red alert-bold">NO LICENSE</span><br/>';
      }
    } else if (pInfo.IsEmergencyVehicle) {
      scanString += 'EMERGENCY RESPONSE VEHICLE // NO DATA PROVIDED<br/>';
    } else {
      scanString += 'REG VALID FROM: <span class="alert-red alert-bold">NOT REGISTERED</span><br/>';
    }

    scanString += 'END';
  }

  scanString += '</code>';

  $('#alpr-info-text').html(scanString);
}

/**
 * Creates and sends a marker to the client with the provided information.
 * @param {Object} markerInfo
 * @param {Boolean} isUpdate
 */
function createMarker(markerInfo, isUpdate = false) {
  const markerIndex = markers.findIndex(m => m.markerId === currentMarkerId);

  if (isUpdate && markerIndex > -1) {
    const markerPayload = {
      ...markers[markerIndex],
      ...markerInfo
    };

    markers[markerIndex] = markerPayload;

    $.post('https://alpr/updateMarker', JSON.stringify(markerPayload));
  } else {
    const markerPayload = {
      ...markerInfo,
      markerId: markerId += 1,
      createdAt: new Date(),
      characterId
    };
    markers.push(markerPayload);

    $('#alpr-active-markers').append(`<div class="col s12"><button class="waves-effect waves-light btn btn-block blue-grey alpr-marker-button" marker-id="${markerPayload.markerId}">${markerPayload.characterId.toString().padStart(5, '0')}-${markerPayload.markerId}</button></div>`);

    $.post('https://alpr/createMarker', JSON.stringify(markerPayload));
  }
}

/**
 * Updates a user's preferences for their new volume settings.
 * @param {Object} volumes
 */
function saveAlertVolumes(volumes) {
  shutterVol = parseFloat(volumes.shutterVol);
  cchordVol = parseFloat(volumes.cchordVol);
  localVol = parseFloat(volumes.localVol);
  ncicVol = parseFloat(volumes.ncicVol);

  $.post('https://alpr/setuivol', JSON.stringify(volumes));
}

/**
 * Hides all other UI elements, then fades in the new display;
 * @param {String} toDisplay
 */
function renderDisplay(toDisplay = 'alpr-output') {
  $('#alpr-output').hide();
  $('#alpr-settings').hide();
  $('#alpr-markers').hide();
  $('#alpr-ui-movement').hide('#alpr-ui-movement');

  if (onSettingsUI && onMarkerUI) {
    $(this).text(onMarkerUI ? 'Return to main menu' : 'Manage ALPR Markers');
  }

  $(`#${toDisplay}`).fadeIn(50, () => {
    $('#alpr-output').hide();
    $('#alpr-settings').hide();
    $('#alpr-markers').hide();
    $('#alpr-ui-movement').hide();
    $(`#${toDisplay}`).show();
  });
}

/**
 * Clears the active marker and redraws the create marker screen
 */
function clearMarker() {
  $('#alpr-manage-markers h5').text('CREATE MARKER');

  $('#alpr-marker-delete').hide();
  $('#alpr-marker-submit').addClass('s12').removeClass('s6');

  $('#alpr-markers-form').find('input').val('');
  M.updateTextFields();

  currentMarkerId = -1;
}

/**
 * Transforms one of the transform scale elements via the UI
 * @param {String} elementName
 * @param {Integer} elementSize
 */
function transformElement(elementName, elementSize) {
  $(`#${elementName}`).css('transform', `scale( calc( 0.6 * ${elementSize} ) )`);
}

/**
 * Resets the UI settings for the ALPR script
 */
function resetUiSettings() {
  $('#alpr-alert-frame').css('top', 'calc( 64% - ( 320px * 0.6 ) )');
  $('#alpr-alert-frame').css('left', 'calc( 99% - ( 500px * 0.6 ) )');

  $('#alpr-plate-reader-frame').css('top', 'calc( 76% - ( 200px / 2 ) )');
  $('#alpr-plate-reader-frame').css('left', 'calc( 99% - ( 500px * 0.6 ) )');

  uiAlertScale = 1;
  uiReaderScale = 1;

  transformElement('alpr-alert-frame', uiAlertScale);
  transformElement('alpr-plate-reader-frame', uiReaderScale);

  $.post('https://alpr/setuiscale', JSON.stringify({ element: 'alert', scale: 1 }));
  $.post('https://alpr/setuiscale', JSON.stringify({ element: 'reader', scale: 1 }));
}

/**
 * Gets the amount of minutes between two dates
 * @param {Date} startDate
 * @param {Date} endDate
 */
function minutesBetweenDates(startDate, endDate) {
  const diff = endDate.getTime() - startDate.getTime();
  return (diff / 60000);
}

// Dragable Element Support
$(() => {
  $('#alpr-alert-frame').draggable({
    containment: [0, 0, $('body').width() - 300, $('body').height() - 211],
    stop(event, ui) {
      $.post('https://alpr/setuipos', JSON.stringify({ element: 'alert', pos: JSON.stringify(ui.position) }));
    }
  });

  $('#alpr-plate-reader-frame').draggable({
    containment: [0, 0, $('body').width() - 300, $('body').height() - 121],
    stop(event, ui) {
      $.post('https://alpr/setuipos', JSON.stringify({ element: 'reader', pos: JSON.stringify(ui.position) }));
    }
  });

  $('#alpr-alert-frame').draggable('option', 'disabled', true);
  $('#alpr-plate-reader-frame').draggable('option', 'disabled', true);

  $(window).resize(() => {
    $('#alpr-alert-frame').draggable('option', 'containment', 'parent');
    $('#alpr-plate-reader-frame').draggable('option', 'containment', 'parent');
  });
});

// UI Quick Escape
document.addEventListener('keydown', (event) => {
  const { key } = event;
  if (key === 'Escape' && !onEditingUI) {
    window.postMessage({ type: 'ALPR_GUI_HIDE' });
    $.post('https://alpr/exit');
  }
});

// Active Alert UI
$('#alpr-history').on('click', 'button', function onClick() {
  const selectedAlertId = $(this).parent().attr('alert-id');

  currentAlertId = selectedAlertId;

  $('#alpr-ui-clear-alert').show();
  setScanInformation(currentAlertId);
});

$('#alpr-ui-clear-alert').click(function onClick() {
  $(this).hide();

  const currentAlert = $(`[alert-id="${currentAlertId}"] button`);

  if (currentAlert) {
    currentAlert.removeClass('orange red accent-3').addClass('blue-grey');
  }

  currentAlertId = false;
  $('#alpr-ui-clear-alert').hide();
  $('#front-plate-locked').removeClass('locked-red');
  $('#rear-plate-locked').removeClass('locked-red');
  hasFrontAlert = false;
  hasRearAlert = false;
  updateAlertUI();
});

// Settings Management
$(() => {
  $('#alpr-settings-button').click(function onClick() {
    onSettingsUI = !onSettingsUI;

    if (onMarkerUI) {
      onMarkerUI = false;
      $('#alpr-markers-button').text('Manage ALPR Markers');
    }

    renderDisplay(onSettingsUI ? 'alpr-settings' : 'alpr-output');
    $(this).text(onSettingsUI ? 'Return to main menu' : 'Settings');
  });
});

$('#alpr-settings-form').submit(function onSubmit(e) {
  e.preventDefault();

  const submitButton = $(':focus', this);
  const isUiEdit = submitButton[0].id === 'alpr-edit-ui-button';

  if (isUiEdit) {
    onEditingUI = true;
    $('#alpr-controller').hide();
    $('#alpr-alert-frame').show();
    $('#alpr-plate-reader-frame').show();

    $('#alpr-alert-frame').draggable('option', 'disabled', false);
    $('#alpr-plate-reader-frame').draggable('option', 'disabled', false);

    $('#alpr-alert-frame').removeClass('alert-single').addClass('alert-both').show();

    renderDisplay('alpr-ui-movement');
  } else {
    saveAlertVolumes({
      shutterVol: (parseInt($('#shutter_vol').val(), 10) / 100).toString(),
      cchordVol: (parseInt($('#cchord_vol').val(), 10) / 100).toString(),
      localVol: (parseInt($('#local_vol').val(), 10) / 100).toString(),
      ncicVol: (parseInt($('#ncic_vol').val(), 10) / 100).toString()
    });
  }
});

// UI Editor Management
$('#alpr-exit-ui-editor').click(() => {
  onEditingUI = false;

  $('#alpr-controller').show();

  $('#alpr-alert-frame').draggable('option', 'disabled', true);
  $('#alpr-plate-reader-frame').draggable('option', 'disabled', true);

  if (!alprEnabled) {
    $('#alpr-plate-reader-frame').hide();
  }

  updateAlertUI();
  renderDisplay('alpr-settings');
});

$('#alpr-ui-reset').click(() => {
  resetUiSettings();
});

$('#alpr-ui-alert-decrease').click(() => {
  if (uiAlertScale.toFixed(1) > 0.1) {
    uiAlertScale -= 0.1;
  }

  transformElement('alpr-alert-frame', uiAlertScale);
  $.post('https://alpr/setuiscale', JSON.stringify({ element: 'alert', scale: uiAlertScale.toFixed(1) }));
});

$('#alpr-ui-alert-increase').click(() => {
  uiAlertScale += 0.1;

  transformElement('alpr-alert-frame', uiAlertScale);
  $.post('https://alpr/setuiscale', JSON.stringify({ element: 'alert', scale: uiAlertScale.toFixed(1) }));
});

$('#alpr-ui-reader-decrease').click(() => {
  if (uiReaderScale.toFixed(1) > 0.1) {
    uiReaderScale -= 0.1;
  }

  transformElement('alpr-plate-reader-frame', uiReaderScale);
  $.post('https://alpr/setuiscale', JSON.stringify({ element: 'reader', scale: uiReaderScale.toFixed(1).toString() }));
});

$('#alpr-ui-reader-increase').click(() => {
  uiReaderScale += 0.1;

  transformElement('alpr-plate-reader-frame', uiReaderScale);
  $.post('https://alpr/setuiscale', JSON.stringify({ element: 'reader', scale: uiReaderScale.toFixed(1).toString() }));
});

// Marker Management
$('#alpr-markers-button').click(function onClick() {
  onMarkerUI = !onMarkerUI;

  if (onMarkerUI) {
    clearMarker();
  }

  if (onSettingsUI) {
    onSettingsUI = false;
    $('#alpr-settings-button').text('Settings');
  }

  renderDisplay(onMarkerUI ? 'alpr-markers' : 'alpr-output');
  $(this).text(onMarkerUI ? 'Return to main menu' : 'Manage ALPR Markers');
});

$('#alpr-markers-form').submit(function onSubmit(e) {
  e.preventDefault();

  const markerPayload = {
    firstName: $('#markerFirst').val(),
    lastName: $('#markerLast').val(),
    licensePlate: $('#markerPlate').val(),
    reason: $('#markerReason').val()
  };

  if (!markerPayload.firstName && !markerPayload.lastName && !markerPayload.licensePlate) {
    return;
  }
  if(markerPayload.licensePlate == ''){
    return;
  };
  if(markerPayload.firstName == ''){
    return;
  };
  if(markerPayload.lastName == ''){
    return;
  };

  const submitButton = $(':focus', this);
  const isDeletion = submitButton[0].id === 'alpr-marker-delete-button';

  if (isDeletion) {
    const deletionIndex = markers.find(m => m.markerId === currentMarkerId);

    if (deletionIndex) {
      markers = markers.filter(m => m.markerId !== currentMarkerId);
      $(`[marker-id=${deletionIndex.markerId}]`).remove();
    }
    $.post('https://alpr/deleteMarker', JSON.stringify({ markerId: currentMarkerId, plate: markerPayload.licensePlate }));
  } else {
    createMarker(markerPayload, currentMarkerId > -1);
  }

  clearMarker();
});

$('body').on('click', 'button.alpr-marker-button', function onClick() {
  $('#alpr-manage-markers h5').text('UPDATE MARKER');

  const targetMarkerId = parseInt($(this).attr('marker-id'), 10);
  const marker = markers.find(m => m.markerId === targetMarkerId);
  if (!marker) return;

  currentMarkerId = targetMarkerId;

  $('#markerFirst').val(marker.firstName);
  $('#markerLast').val(marker.lastName);
  $('#markerPlate').val(marker.licensePlate);
  $('#markerReason').val(marker.reason);
  M.updateTextFields();

  $('#alpr-marker-delete').show();
  $('#alpr-marker-submit').removeClass('s12').addClass('s6');
});

// Exit and toggle buttons
$('#alpr-exit-button').click(() => {
  window.postMessage({ type: 'ALPR_GUI_HIDE' });
  $.post('https://alpr/exit');
});

$('#alpr-enable-checkbox').change(() => {
  alprEnabled = !alprEnabled;

  $('#alpr-enable-label').toggleClass('black-text').toggleClass('white-text');

  if (alprEnabled) {
    $('#alpr-enable-toggle-div .switch').addClass('green lighten-1').removeClass('red accent-2');
    $('#alpr-plate-reader-frame').show();
  } else {
    $('#alpr-enable-toggle-div .switch').addClass('red accent-2').removeClass('green lighten-1');
    $('#alpr-plate-reader-frame').hide();
  }

  $.post(`https://alpr/${alprEnabled ? 'enable' : 'disable'}`);
});

// NUI Message Handler
$(() => {
  window.addEventListener('message', (event) => {
    if (!event.data.type) return;

    switch (event.data.type) {
      case 'ALPR_GUI_DISPLAY': {
        $('#alpr-controller').fadeIn(300, () => {
          $('#alpr-controller').show();
        });

        break;
      }
      case 'ALPR_GUI_HIDE': {
        $('#alpr-controller').fadeOut(300, () => {
          $('#alpr-controller').hide();
        });

        break;
      }
      case 'ALPR_UI_DISPLAY': {
        if (!$('#alpr-display').is(':visible')) {
          $('#alpr-display').fadeIn(300, () => {
            $('#alpr-display').show();
          });
        }

        break;
      }
      case 'ALPR_UI_HIDE': {
        if ($('#alpr-display').is(':visible')) {
          $('#alpr-display').fadeOut(300, () => {
            $('#alpr-display').hide();
          });
        }

        break;
      }
      case 'ALPR_UI_RESET': {
        resetUiSettings();

        break;
      }
      case 'ALPR_FORCE_DISABLE': {
        alprEnabled = false;

        $('#alpr-enable-checkbox').prop('checked', false);

        $('#alpr-enable-label').toggleClass('black-text').toggleClass('white-text');
        $('#alpr-enable-toggle-div .switch').addClass('red accent-2').removeClass('green lighten-1');
        $('#alpr-plate-reader-frame').hide();

        break;
      }
      case 'ALPR_UPDATE_CHARACTER': {
        if (event.data.characterId) {
          ({ characterId } = event.data);
        }

        break;
      }
      case 'ALPR_ALERT_CLEAR': {
        if (!event.data.camera) return;

        if (event.data.camera === 'front') {
          hasFrontAlert = false;
          $('#front-plate-locked').removeClass('locked-red');
        } else if (event.data.camera === 'rear') {
          hasRearAlert = false;
          $('#rear-plate-locked').removeClass('locked-red');
        } else {
          $('#front-plate-locked').removeClass('locked-red');
          $('#rear-plate-locked').removeClass('locked-red');
          hasFrontAlert = false;
          hasRearAlert = false;
        }

        //$(event.data.camera === 'front' ? '#front-plate-locked' : '#rear-plate-locked').removeClass('locked-red');

        updateAlertUI();

        break;
      }
      case 'ALPR_UI_SETTINGS': {
        if (!event.data.payload) return;
        if (event.data.payload.alertPos) {

          const alertPosData = JSON.parse(event.data.payload.alertPos);
          $('#alpr-alert-frame').css('top', alertPosData.top);
          $('#alpr-alert-frame').css('left', alertPosData.left);
        }

        if (event.data.payload.readerPos) {
          const readerPosData = JSON.parse(event.data.payload.readerPos);

          $('#alpr-plate-reader-frame.alert-both').css('top', readerPosData.top);
          $('#alpr-plate-reader-frame').css('left', readerPosData.left);
        }

        if (event.data.payload.shutterVol) {
          shutterVol = parseFloat(event.data.payload.shutterVol);
          $('#shutter_vol').val(parseFloat(shutterVol) * 100);
        }

        if (event.data.payload.cchordVol) {
          cchordVol = parseFloat(event.data.payload.cchordVol);
          $('#cchord_vol').val(parseFloat(cchordVol) * 100);
        }

        if (event.data.payload.localVol) {
          localVol = parseFloat(event.data.payload.localVol);
          $('#local_vol').val(parseFloat(localVol) * 100);
        }

        if (event.data.payload.ncicVol) {
          ncicVol = parseFloat(event.data.payload.ncicVol);
          $('#ncic_vol').val(parseFloat(ncicVol) * 100);
        }

        if (event.data.payload.alertScale) {
          uiAlertScale = parseFloat(event.data.payload.alertScale);
          transformElement('alpr-alert-frame', uiAlertScale);
        }

        if (event.data.payload.readerScale) {
          uiReaderScale = parseFloat(event.data.payload.readerScale);
          transformElement('alpr-plate-reader-frame', uiReaderScale);
        }

        break;
      }
      case 'ALPR_GUI_PLATE_READ': {
        const alertPayload = JSON.parse(event.data.payload);

        const plIndex = plateHistory.findIndex(p => p.LicensePlate === alertPayload.LicensePlate);

        if (plIndex > -1) {
          if (plateHistory[plIndex]) {
            $(`[alert-id="${plateHistory[plIndex].alertId}"]`).remove();
          }

          plateHistory.splice(plIndex, 1);
        }

        if (plateHistory.length >= 100) {
          const alertToRemove = plateHistory.findIndex(p => p.alertId !== currentAlertId);

          if (alertToRemove > -1 && plateHistory[alertToRemove]) {
            $(`[alert-id="${plateHistory[alertToRemove].alertId}"]`).remove();

            plateHistory.splice(alertToRemove, 1);
          }
        }

        const newAlert = { ...alertPayload, alertId: alertId += 1 };

        plateHistory.push(newAlert);

        const targetDiv = $('#alpr-history div :not(.orange,.red):first');

        if (targetDiv.length) {
          targetDiv.parent().before(`<div class="col s12" alert-id="${newAlert.alertId}" plate-text="${alertPayload.LicensePlate}"><button class="waves-effect waves-light btn btn-block blue-grey alpr-marker-button">${newAlert.LicensePlate} (${toAlprDirection(newAlert)})</button></div>`);
        } else {
          $('#alpr-history').append(`<div class="col s12" alert-id="${newAlert.alertId}" plate-text="${alertPayload.LicensePlate}"><button class="waves-effect waves-light btn btn-block blue-grey alpr-marker-button">${newAlert.LicensePlate} (${toAlprDirection(newAlert)})</button></div>`);
        }

        // Don't update the reader if we're locked on something
        if ((alertPayload.IsFront && hasFrontAlert) || (!alertPayload.IsFront && hasRearAlert)) {
          return;
        }

        // Update plate reader UI
        setPlate(alertPayload.IsFront, alertPayload.LicensePlate, alertPayload.PlateIndex);
        playSound(soundTypes.shutter);

        if (!currentAlertId) {
          setScanInformation(newAlert.alertId);
        }

        break;
      }
      case 'ALPR_GUI_ALERT': {
        const { payload: alert } = event.data;
        if (!alert) return;
        $(alert.isFront ? '#front-plate-locked' : '#rear-plate-locked').addClass('locked-red');

        if (alert.isFront) {
          hasFrontAlert = alert.licensePlate;

          $('#front-reader-header').addClass('locked-red');
          setTimeout(() => {
            $('#front-reader-header').removeClass('locked-red');
          }, 3006);
        } else {
          hasRearAlert = alert.licensePlate;

          $('#rear-reader-header').addClass('locked-red');
          setTimeout(() => {
            $('#rear-reader-header').removeClass('locked-red');
          }, 3006);
        }

        const matchingPlate = $(`[plate-text="${alert.licensePlate}"] button`);
        if (matchingPlate.length) {
          matchingPlate.removeClass('blue-grey').addClass((alert.alertType === alertTypes.warning ? 'orange accent-3' : 'red accent-3'));
        }

        setAlert(alert.isFront, alert.isLeft, alert.details, alert.alertType, alert.message);
        playSound(soundTypes.cchord);
        //playSound(alert.alertType === alertTypes.danger ? soundTypes.ncic : soundTypes.local);

        break;
      }
      default: {
        break;
      }
    }
  });
});
