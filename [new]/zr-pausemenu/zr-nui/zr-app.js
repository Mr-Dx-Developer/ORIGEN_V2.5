var zr_resource = GetParentResourceName();
var zr_config = {};
var zr_data = {};
var zr_jobs = {};

window.addEventListener("message", function(event) {
    let data = event.data;

    if ( data.type == 'show' ) {
        $("#zr-container").show();
        zr_config = data.config;
        zr_data = data.data;
        zr_jobs = data.jobs;
        zr_setup_pausemenu();
    } 

    if ( data.type == 'hide' ) {
        $("#zr-container").hide();
    };
});

function zr_setup_pausemenu() {
    var translation = zr_config.zr_translation;
    var gender = translation.male;
    $('#zr-jobs').html('');
    $("#zr-back").html(translation.back);
    $("#zr-disconnect").html(translation.disconnect);
    $("#zr-rules-txt").html(translation.rulestitle);
    $("#zr-rules-rules").html(translation.rules);
    $("#zr-discord-txt").html(translation.discord);
    $('#zr-trans-maps').html(translation.maps);
    $("#zr-trans-tmaps").html(translation.mapstxt);
    $("#zr-trans-settings").html(translation.settings);
    $("#zr-trans-tsettings").html(translation.settingstxt);
    if (zr_data.zr_gender == 1) {
      gender = translation.female;
    }
    if (zr_data.zr_gender == 'm') {
      gender = translation.male;
    }
    if (zr_data.zr_gender == 'f') {
      gender = translation.female;
    }
    var charinfo = "\n    <div class=\"zr-infos-title\">1. <span class=\"zr-clr\">Character Information.</span></div>\n    <div class=\"zr-infos-infos\">\n        <div class=\"zr-infos-box\">\n            <div class=\"zr-box-ele\"></div>\n            <div class=\"zr-box-img\" style=\"background-image: url('./zr-assets/zr-icon-name.svg');\"></div>\n            <div class=\"zr-box-infos\">" + translation.fname + ": <span class=\"zr-clr\">" + zr_data.zr_firstName + "</span></div>\n        </div>\n        <div class=\"zr-infos-box\">\n            <div class=\"zr-box-ele\"></div>\n            <div class=\"zr-box-img\" style=\"background-image: url('./zr-assets/zr-icon-name.svg');\"></div>\n            <div class=\"zr-box-infos\">" + translation.lname + ': <span class="zr-clr">' + zr_data.zr_lastName + "</span></div>\n        </div>\n        <div class=\"zr-infos-box\">\n            <div class=\"zr-box-img\" style=\"background-image: url('./zr-assets/zr-icon-gender.svg');\"></div>\n            <div class=\"zr-box-infos\">" + translation.gender + ": <span class=\"zr-clr-sec\">" + gender + "</span></div>\n        </div>\n        <div class=\"zr-infos-box\">\n            <div class=\"zr-box-img\" style=\"background-image: url('./zr-assets/zr-icon-dob.svg');\"></div>\n            <div class=\"zr-box-infos\">" + translation.dob + ': <span class="zr-clr-sec">' + zr_data.zr_birthdate + "</span></div>\n        </div>\n        <div class=\"zr-infos-box\" style=\"width: 100%;\">\n            <div class=\"zr-box-ele\"></div>\n            <div class=\"zr-box-img\" style=\"background-image: url('./zr-assets/zr-icon-job.svg');\"></div>\n            <div class=\"zr-box-infos\">" + translation.job + ": <span class=\"zr-clr\">" + zr_data.zr_job + "</span> - <span class=\"zr-clr\">" + zr_data.zr_grade + "</span></div>\n        </div>\n        <div class=\"zr-infos-box\">\n            <div class=\"zr-box-img\" style=\"background-image: url('./zr-assets/zr-icon-cash.svg');\"></div>\n            <div class=\"zr-box-infos\">" + translation.cash + ": <span class=\"zr-clr\">" + zr_data.zr_cash + "</span> " + translation.currency + "</div>\n        </div>\n        <div class=\"zr-infos-box\">\n            <div class=\"zr-box-img\" style=\"background-image: url('./zr-assets/zr-icon-bank.svg');\"></div>\n            <div class=\"zr-box-infos\">" + translation.bank + ": <span class=\"zr-clr\">" + zr_data.zr_bank + "</span> " + translation.currency + "</div>\n        </div>\n    </div>\n    <div class=\"zr-triple\" style=\"right: 1.563vw;\"><div class=\"zr-triple-ele\"></div><div class=\"zr-triple-ele\"></div><div class=\"zr-triple-ele\"></div></div>\n    <div class=\"zr-line\" style=\"top: 1.563vw;\"></div>\n    ";
    $("#zr-multi-infos").html(charinfo);
    $.each(zr_jobs, function (_, job) {
      var jobdata = "<div class=\"zr-job\" style=\"border-color: " + job.color + ";\"><span style=\"color: " + job.color + ";\">" + job.name + ":&nbsp</span>" + job.count + ' ' + job.suivname + "</div>";
      $('#zr-jobs').append(jobdata);
    });
  }

  $('#zr-maps').click(function () {
    $.post("https://" + zr_resource + "/show-maps");
  });
  $("#zr-settings-main").click(function () {
    $.post("https://" + zr_resource + "/show-settings");
  });
  $("#zr-back").click(function () {
    $.post("https://" + zr_resource + "/hide");
  });
  $("#zr-disconnect").click(function () {
    $.post("https://" + zr_resource + "/disconnect");
  });
  $("#zr-discord").click(function () {
    window.invokeNative("openUrl", zr_config.discord);
  });

  window.addEventListener("keydown", (event) => {
    if ( event.keyCode == 27 || event.keyCode == 8 ) {
      $.post("https://" + zr_resource + "/hide");
    }
  })