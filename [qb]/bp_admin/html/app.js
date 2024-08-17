
const vehicledata = {
  "vehiclemodel": null,
  "vehicleplate": null,
  "vehiclecolor": "blue",
  "vehiclefull": true

}

var devmodeaktif = false
var playeticketstatus = false;
var adminticketmodaktif = false;
var playerticketmodaktif = false;
var rconaktif = false;
var playerperm = 0;
var notifyold = false;

window.addEventListener("message", function (event) {    
    if(event.data.action == "open") {
      // $('body').fadeIn(0);

        $('.adminmain').fadeIn(500);
 
        $('#playerrightlist').fadeIn(0);
        $('#playerrightbanlist').fadeIn(0);
        $('.playerlist').fadeIn(0);
        
        $('.leftmenu-items').removeClass('addhover');

        $('#playerlistimiz').addClass('addhover');

        $('.rightmenu-item').removeClass('addhover2');

        $('#playerrightlist').addClass('addhover2');
        playerinfos = event.data.players;
        playerbans = event.data.bans;
        logsbeya = event.data.logs;
        insertplayerlist(event.data.players);
        insertplayerbanlist(event.data.bans);
        inservehiclelist(event.data.vehiclelist);
        insertobjectlist(event.data.objectlist);
        insertticketlist(event.data.tickets);
        insertloglist(event.data.logs)

        currenttickets = event.data.tickets;
        playeridisi = event.data.playeridsi;

        adminticketmodaktif = true;

        playerperm = event.data.playerclientperm;

        configmainperms = event.data.configmainperms;

        configextraperms = event.data.configextraperms;
  
    }

    if (event.data.action == "showvehiclespawnkey") {
      // $('body').fadeIn(0);
      $(".vehicletopspawntext").css({top: event.data.tops + "%", left: event.data.lefts - 3.5 + "%", position:'absolute' , display :'flex'});

    }
    if (event.data.action == "showobjectspawnkey") {
      // $('body').fadeIn(0);
      $(".objecttopspawntext").css({top: event.data.tops  + "%", left: event.data.lefts - 10 + "%", position:'absolute' , display :'flex'});

    }

    

    if(event.data.action == "closevehiclespawnkey"){
      // $('body').fadeOut(0);
      $('.vehicletopspawntext').fadeOut(0);

      
    }


    if (event.data.action == "savequestion"){
      // $('body').fadeIn(0);
      $('.savequestion').fadeIn(500);
      
    }

    if( event.data.action == "closequestionand"){
      // $('body').fadeOut(0);
      $('.savequestion').fadeOut(500);
      $('.objecttopspawntext').fadeOut(100);
    }


    if(event.data.action == "reloadcheat"){
      currenttickets = event.data.newplayertickets;
      reloadchatmessage2(event.data.kacinkod);
      reloadchatmessageforother(event.data.kacinkod);

      
    }

    if (event.data.action == "rewriteban"){
      playerbans = event.data.newbans;
      insertplayerbanlist(event.data.newbans);
    }

    if (event.data.action == "devmodeac"){
      if (event.data.devmode == true){
            closemainadmin();
            devmodeaktif = true
            $('#developermenuid').fadeIn(0);
            $('.developermenu').css('opacity', "1.0") 

            var left = $('#developermenuid').offset().left;  // Get the calculated left position

             $("#developermenuid").css({left:left})  // Set the left to its calculated position
             .animate({"left":"0px"}, "slow");


             insertdevmode(playerinfos);
             $('#developermenuspecid').fadeIn(0);
             $('.developermenuspec').css('opacity', "1.0") 

             $('.onlineplayerlistsys').fadeIn(0);
             $('.onlineplayerlistsecond').fadeOut(0);


 
             var right = $('#developermenuspecid').offset().right;  // Get the calculated left position
 
              $("#developermenuspecid").css({right:right})  // Set the left to its calculated position
              .animate({"right":"0px"}, "slow");

             
             $.post('https://bp_admin/opendevmodnui', JSON.stringify({ }));

          
      }else{
        closemainadmin();
        devmodeaktif = false
        var left = $('#developermenuid').offset().left;  // Get the calculated left position

        $("#developermenuid").css({left:left})  // Set the left to its calculated position
        .animate({"left":"-300px"}, "slow");
        setTimeout(() => {
          $('#developermenuid').fadeOut(0);
          
        }, 2000);




        var right = $('#developermenuspecid').offset().right;  // Get the calculated left position

          $("#developermenuspecid").css({right:right})  // Set the left to its calculated position
          .animate({"right":"-300px"}, "slow");
          setTimeout(() => {
            $('#developermenuspecid').fadeOut(0);
            
          }, 2000);
      }
      
    }


    if (event.data.action == "devmodeonline"){
      devmodeaktif = true
      $('.developermenu').css('opacity', "1.0") 
      $('.developermenuspec').css('opacity', "1.0") 


    }


    if (event.data.action == "renewlog"){
       logsbeya = event.data.newlog;
    }

    // ----------------------------- player ticket part js --------------------------------------------------

    if (event.data.action == "openplayerticket"){
      $('.playerticketmain').fadeIn(500);
      $('.playerticketlist').fadeIn(0);
      // $('body').fadeIn(0);

      currenttickets = event.data.ticketplayerlist;
      playeridisi = event.data.playeridisi;
      playernames = event.data.playername;
      inserplayertickets(currenttickets);

      // reloadchatmessage2(event.data.kacinkod);
      // reloadchatmessageforother(event.data.kacinkod);
      playerticketmodaktif = true;
      playeticketstatus = true;


      
    }

    if (event.data.action == "newticketadd"){
      currenttickets = event.data.newticket;

      if (playeticketstatus){
        inserplayertickets(currenttickets);
      }
    }



    if (event.data.action == "writetorcon"){
       insertrcon(event.data.rconcommands);
    }


    if (event.data.action == "openrconagain"){
      $('.rconpart').fadeIn(500);
      $('.rcondowntext').fadeOut(300);
      rconaktif = true;

    }


     if (event.data.action == "writeannouncepls"){
        $('.adminnotifycontainer').fadeIn(0);
     
        var top = $('.adminnotifycontainer').offset().top;
       
        $(".adminnotifycontainer").css({top:top})  // Set the left to its calculated position
        .animate({"top":"50px"}, "slow");
        $('.adminnotifyinfo').html(event.data.announcemessage);
        setTimeout(() => {
          var top = $('.adminnotifycontainer').offset().top;
          $(".adminnotifycontainer").css({top:top})  // Set the left to its calculated position
          .animate({"top":"-300px"}, "slow");
          $('.adminnotifycontainer').fadeOut(0);
          $.post('https://bp_admin/refreshannounce', JSON.stringify({ }));


        }, 5000);
     }


     if (event.data.action == "notifyplease"){
      if (notifyold == false){
        $('.notifyadmin').fadeIn(300);
        $('#notifyadminwrite').html(event.data.notifymsg);
        $.post('https://bp_admin/soundplsthnx', JSON.stringify({ }));


        notifyold = true;

        setTimeout(() => {
          $('.notifyadmin').fadeOut(300);
          notifyold = false;
        }, 3000);
      } 
   

     }

    
  
  });

  function sendnotifyjs(msg)
  {
    if (notifyold == false){
      $('.notifyadmin').fadeIn(300);
      $('#notifyadminwrite').html(msg);

      notifyold = true;

      setTimeout(() => {
        $('.notifyadmin').fadeOut(300);
        notifyold = false;
      }, 3000);
    } 
  }


  function insertrcon(data){

    $('.rconchathere').html('');

    for (let i = 0; i < data.length; i++) {
      const element = data[i];
    
    $('.rconchathere').append('<div class="rconchathereitem">'+element.message+'</div>');
      
    }

  }


  function inserplayertickets(data){
    $('.playerticketlist').html('');

    for (let i = 0; i < data.length; i++) {
      const element = data[i];
      if (element.ticket_owner == playeridisi){
        $('.playerticketlist').append('<div class="playerticketlistitem" data-playerticketinfo = '+i+' data-ticketid = '+element.ticket_id+'  > <div class="tickettopnameplayer">#TICKET</div> <div class="ticketcenterticket">'+element.ticket_top+'</div> <div class="tickettimeplayer">'+element.ticket_time+'</div> </div>');
      }
     
      
    }

     playerticketclick();
  }


  function playerticketclick(){
    $( ".playerticketlistitem" ).each( function( i, obj ) {

        $( this ).click( function() { 
          var data = $( this ).data( "playerticketinfo" ); 
          var data2 = $( this ).data( "ticketid" ); 

          currentticketid = data2;
          $('.playerticketlist').fadeOut(50);
          $('.playerticketmessagepart').fadeIn(200);
  
          reloadchatmessageforothernew(currentticketid)
        });
    });

  }



  


  function insertdevmode(data){
    $('.onlineplayerlistsys').html('');
    for (let i = 0; i < data.length; i++) {
      const element = data[i];

      if (element.onlinestate){
        $('.onlineplayerlistsys').append('<div class="onlineplayeritems"  data-devmodeplayer = "'+element.onlineid+'" > <img src="gamepad.svg" alt="" style="margin-right: 5px; margin-left: 5px;"> '+element.playername+'  <img src="arrowbeya.svg" alt="" style="margin-left: 5px; margin-right: 5px;"> #'+element.onlineid+'</div>');
      }
      
    }

    devmodeclick();

  }


  function devmodeclick(){
    $( ".onlineplayeritems" ).each( function( i, obj ) {
    
 

      $( this ).click( function() { 
        var data = $( this ).data( "devmodeplayer" ); 

        currentspecid = data;
        $('.onlineplayerlistsys').fadeOut(0);
        $('.onlineplayerlistsecond').fadeIn(0);
      });
    });
  }




  function closemainadmin(){
    $('.vehiclelist').fadeOut(0);
    $('#vehiclelistright').fadeOut(0);
    


    $('.playerbanlist').fadeOut(0);
    $('.playerlist').fadeOut(0);
    $('.objectlist').fadeOut(0);
    $('.itemlist').fadeOut(0);
    $('.extralist').fadeOut(0);
    $('.loglist').fadeOut(0);


    $('#objectlistright').fadeOut(0);
    $('#playerrightlist').fadeOut(0);
    $('#playerrightbanlist').fadeOut(0);
    $('#supportlistright').fadeOut(0);
    $('#extralistright').fadeOut(0);
    $('#loglistright').fadeOut(0);
    $('.adminmain').fadeOut(0);

    
    $.post('https://bp_admin/closenui', JSON.stringify({ }));


    
  }

  function getticketsira(gelen){
    for (let i = 0; i < currenttickets.length; i++) {
      const element = currenttickets[i];
    
      if (element.ticket_id == gelen){
        return i;
      }
      
    }
  }


  function reloadchatmessage2(kodss){
    $('.scroller2').html('');


    var newkod = getticketsira(kodss);
 
    for (let i = 0; i < currenttickets[newkod].ticket_msg.length; i++) {
        const element = currenttickets[newkod].ticket_msg[i];

  
        if (kodss == currentticketid){

        
            if (playeridisi == element.memberid){
                $('.scroller2').append('<div class="usermainchatcontainer" style="float: right;"> <div class="userrightmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div> <div class="theavatar"> <img src="https://cdn.icon-icons.com/icons2/1371/PNG/512/batman_90804.png" class="theavatar_img" /></div> </div>')
            }else{
                $('.scroller2').append('<div class="usermainchatcontainer" style="float: left;"> <div class="theavatar"> <img src="https://img.icons8.com/external-gradient-flat-deni-mao/600/000000/external-User-avatar-online-shopping-gradient-flat-deni-mao.png" class="theavatar_img" /></div> <div class="userleftmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div><div class="userlefplayername">👷🏽 '+element.membername+'</div> </div>')
            }
        }
    }
}


function reloadchatmessageforothernew(kodss){
  $('.playeticketscroller2').html('');

  var newkod = getticketsira(kodss);
  for (let i = 0; i < currenttickets[newkod].ticket_msg.length; i++) {
      const element = currenttickets[newkod].ticket_msg[i];


   

      
          if (playeridisi == element.memberid){
              $('.playeticketscroller2').append('<div class="playeticketmainchatcontainer" style="float: right;"> <div class="playeticketrightmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div> <div class="playetickettheavatar"> <img src="https://cdn.icon-icons.com/icons2/1371/PNG/512/batman_90804.png" class="playetickettheavatar_img" /></div> </div>')
          }else{
              $('.playeticketscroller2').append('<div class="playeticketmainchatcontainer" style="float: left;"> <div class="playetickettheavatar"> <img src="https://img.icons8.com/external-gradient-flat-deni-mao/600/000000/external-User-avatar-online-shopping-gradient-flat-deni-mao.png" class="playetickettheavatar_img" /></div> <div class="playeticketleftmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div><div class="userlefplayername">👮🏽‍♂️ '+element.membername+'</div> </div>')
          }
      
  }
}


function reloadchatmessageforother(kodss){
  $('.playeticketscroller2').html('');

  var newkod = getticketsira(kodss);

  for (let i = 0; i < currenttickets[newkod].ticket_msg.length; i++) {
      const element = currenttickets[newkod].ticket_msg[i];


      if (kodss == currentticketid){

      
          if (playeridisi == element.memberid){
              $('.playeticketscroller2').append('<div class="playeticketmainchatcontainer" style="float: right;"> <div class="playeticketrightmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div> <div class="playetickettheavatar"> <img src="https://cdn.icon-icons.com/icons2/1371/PNG/512/batman_90804.png" class="playetickettheavatar_img" /></div> </div>')
          }else{
              $('.playeticketscroller2').append('<div class="playeticketmainchatcontainer" style="float: left;"> <div class="playetickettheavatar"> <img src="https://img.icons8.com/external-gradient-flat-deni-mao/600/000000/external-User-avatar-online-shopping-gradient-flat-deni-mao.png" class="playetickettheavatar_img" /></div> <div class="playeticketleftmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div><div class="userlefplayername">👮🏽‍♂️ '+element.membername+'</div> </div>')
          }
      }
  }
}


  function insertticketlist(data){
  
    $('#supportlistbeyaid').html('');
    for (let i = 0; i < data.length; i++) {
      const element = data[i];
 
      $('#supportlistbeyaid').append('<div class="support-item"  data-ticketsira = "'+i+'" data-ticketid = "'+element.ticket_id+'" > <div class="support-item-active"> <img src="deneme.svg" alt="" style="width: 20px; margin-top:-16px;"> </div> <div class="support-item-playername">'+element.ticket_top+'</div> <div class="supportticketbelirti">#Ticket-'+element.ticket_id+'</div></div>');
    }

    ticketclick();

  }


  function ticketclick(){
    $( ".support-item" ).each( function( i, obj ) {
    
 

      $( this ).click( function() { 
        if (Number(playerperm) >= Number(configmainperms.playersupportmin)){
            var data = $( this ).data( "ticketsira" ); 
            currentticketid = $( this ).data( "ticketid" ); 

          
            $('#supportlistbeyaid').css('display', 'none');
            $('#supporttalkbeyaid').css('display', 'flex');

            $('.scroller2').html('');

            for (let i = 0; i < currenttickets[data].ticket_msg.length; i++) {
              const element = currenttickets[data].ticket_msg[i];
                if (playeridisi == element.memberid){
                  $('.scroller2').append('<div class="usermainchatcontainer" style="float: right;"> <div class="userrightmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div> <div class="theavatar"> <img src="https://cdn.icon-icons.com/icons2/1371/PNG/512/batman_90804.png" class="theavatar_img" /></div> </div>')
                }else{
                    $('.scroller2').append('<div class="usermainchatcontainer" style="float: left;"> <div class="theavatar"> <img src="https://img.icons8.com/external-gradient-flat-deni-mao/600/000000/external-User-avatar-online-shopping-gradient-flat-deni-mao.png" class="theavatar_img" /></div> <div class="userleftmessage"><p style="margin-left: 10px; margin-right: 10px;">'+element.membermessage+'</p></div><div class="userlefplayername">👷🏽 '+element.membername+'</div> </div>')
                }
            }
        }else{

          sendnotifyjs("You cant access tickets Sorry!")
          
        }
      
    
      

      })
 

    });

  }


  function insertobjectlist(data){
    $('#objectlistbeyaid').html('');
    for (let i = 0; i < data.length; i++) {
      const element = data[i];
 
      
      $('#objectlistbeyaid').append('<div class="objectlistcard" data-find4="'+element.label+'"  data-clickob = "'+element.name+'"> <div class="objectlistcardimage"> <img src="'+element.img+'" alt="" class="imgdeger"> </div> <div class="objectlistcardname">'+element.label+'</div> </div>');
   
     
    }
  
    objectclick();
   
  
  }


  function objectclick(){
    $( ".objectlistcard" ).each( function( i, obj ) {
    
 

      $( this ).click( function() { 
        if (Number(playerperm) >= Number(configmainperms.propspawnmin)){
              var data = $( this ).data( "clickob" ); 
            
            $.post('https://bp_admin/objectspawn', JSON.stringify({ objectmodel : data}));
            

            $('.objectlist').fadeOut(0);
            // $('body').fadeOut(0);
            $('.adminmain').fadeOut(0);
            $('#objectlistright').fadeOut(0);
        }else{

          sendnotifyjs("You cant access object spawn Sorry!!")
        
        }
      

      })
 

    });

  }

  function inservehiclelist(data){
    $('#vehiclelistbeyaid').html('');
    for (let i = 0; i < data.length; i++) {
      const element = data[i];
      // console.log(element.img);
      $('#vehiclelistbeyaid').append('<div class="vehiclelistcard" data-find3="'+element.label+'"  data-click = "'+element.name+'"> <div class="vehiclelistcardimage"> <img src="'+element.img+'" alt="" class="imgdeger"> </div> <div class="vehiclelistcardname">'+element.label+'</div> </div>');
   
     
    }
  
    vehicleclick();
   
  
  }



  function vehicleclick(){
    $( ".vehiclelistcard" ).each( function( i, obj ) {
    
 

      $( this ).click( function() { 
        if (Number(playerperm) >= Number(configmainperms.vehiclespawnmin)){
            var data = $( this ).data( "click" ); 
    
            vehicledata.vehiclemodel = String(data)


            $('.screenmenu').fadeIn(500);
            $('.loadermain').fadeIn(0);

            setTimeout(function(){
              $('.loadermain').fadeOut(0);
              $('.screenvehiclesettings').fadeIn(200);




              

            },700);
          }else{
            sendnotifyjs("You dont have permission!!")
         
          }

      })
 

    });

  }
  
function insertplayerlist(data){
  $('#playerlistinsert').html('');
  for (let i = 0; i < data.length; i++) {
    const element = data[i];

    if (element.onlinestate){
      $('#playerlistinsert').append('<div class="playerlist-item" data-find="'+element.playername+'"> <div class="playerlist-item-active"> <img src="online.svg" alt="" style="width: 12px; margin-top:-8px;"> <div style="float:left; margin-top:0px; margin-left: 10px;">Online</div> </div> <div class="playerlist-item-ayrac"></div> <div class="playerlist-item-playername"> <div style="margin-top: 4px;">'+element.playername+'</div> </div> <div class="playerlist-item-playerid"> <div style="margin-top: 2px;">'+element.onlineid+'</div> </div> <div class="playerlist-item-ayrac" style="margin-left: 15px;"></div> <div class="playerlist-item-playerinfo"> <div style="margin-top: 5px; float: left;">ID : '+element.playerid.slice(0, 30)+'</div> <div style="margin-top: 5px; margin-left: 30px; float: left;">JOB : '+element.playerjobname+'</div> </div> <div class="playerlist-item-settings"> <div class="playerlist-item-button" data-infoid ="'+i+'" > Settings <img src="settings.svg" alt="" style="width: 10px;"> </div> </div> </div>');
    }else{
      $('#playerlistinsert').append('<div class="playerlist-item" data-find="'+element.playername+'"> <div class="playerlist-item-active"> <img src="offline.svg" alt="" style="width: 12px; margin-top:-8px;"> <div style="float:left; margin-top:0px; margin-left: 10px;">Offline</div> </div> <div class="playerlist-item-ayrac"></div> <div class="playerlist-item-playername"> <div style="margin-top: 4px;">'+element.playername+'</div> </div> <div class="playerlist-item-playerid"> <div style="margin-top: 2px;">'+element.onlineid+'</div> </div> <div class="playerlist-item-ayrac" style="margin-left: 15px;"></div> <div class="playerlist-item-playerinfo"> <div style="margin-top: 5px; float: left;">ID : '+element.playerid.slice(0, 30)+'</div> <div style="margin-top: 5px; margin-left: 30px; float: left;">JOB : '+element.playerjobname+'</div> </div> <div class="playerlist-item-settings"> <div class="playerlist-item-button" data-infoid ="'+i+'"> Settings <img src="settings.svg" alt="" style="width: 10px;"> </div> </div> </div>');
    }
   
  }

  clicksetup();

}

function insertplayerbanlist(data){
  $('#playerbanlistid').html('');
  for (let i = 0; i < data.length; i++) {
    const element = data[i];

     $('#playerbanlistid').append('<div class="playerbanlist-item" data-find2="'+element.playername+'" > <div class="playerbanlist-item-active"> <img src="ignore.svg" alt=""> </div> <div class="playerbanlist-item-ayrac"></div> <div class="playerbanlist-item-playername"> <div style="margin-top: 5px;">'+element.playername+'</div> </div> <div class="playerbanlist-item-playername"> <div style="margin-top: 5px;">-</div> </div> <div class="playerbanlist-item-playerinfo"> <div style="margin-top: 5px; float: left;text-overflow: ellipsis;  white-space: nowrap; overflow: hidden;">Reason : '+element.reason+'</div> </div> <div class="playerbanlist-item-ayrac"></div> <div class="playerbanlist-item-playerdate"> <div style="margin-top: 5px;">TIME: '+ ' '+element.time+'h</div> </div> <div class="playerbanlist-item-delete"> <div class="playerbanlist-item-button2" data-baninfoid2 = "'+i+'"> Delete <img src="delete.svg" alt="" style="width: 10px;"> </div> <div class="playerbanlist-item-button" data-baninfoid = "'+i+'"  style="margin-left: 15px;"> INFO <svg version="1.1" style="width: 10px;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="416.979px" height="416.979px" viewBox="0 0 416.979 416.979" style="enable-background:new 0 0 416.979 416.979;" xml:space="preserve"> <g> <path d="M356.004,61.156c-81.37-81.47-213.377-81.551-294.848-0.182c-81.47,81.371-81.552,213.379-0.181,294.85 c81.369,81.47,213.378,81.551,294.849,0.181C437.293,274.636,437.375,142.626,356.004,61.156z M237.6,340.786 c0,3.217-2.607,5.822-5.822,5.822h-46.576c-3.215,0-5.822-2.605-5.822-5.822V167.885c0-3.217,2.607-5.822,5.822-5.822h46.576 c3.215,0,5.822,2.604,5.822,5.822V340.786z M208.49,137.901c-18.618,0-33.766-15.146-33.766-33.765 c0-18.617,15.147-33.766,33.766-33.766c18.619,0,33.766,15.148,33.766,33.766C242.256,122.755,227.107,137.901,208.49,137.901z"/> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> <g> </g> </svg> </div> </div> </div>');
   
  }

  clicksetup2();

}


function clicksetup2(){
  $( ".playerbanlist-item-button" ).each( function( i, obj ) {
    
 

        $( this ).click( function() { 
          if (Number(playerperm) >= Number(configmainperms.playerbanremove)){
              var data = $( this ).data( "baninfoid" ); 
            
              $('.screenmenu').fadeIn(500);
              $('.loadermain').fadeIn(0);

            


              setTimeout(function(){
                $('.loadermain').fadeOut(0);
                $('.screenbansettings').fadeIn(200);
                $('#banreasonname').html(playerbans[data].playername)
                $('#banreasonwrite').html(playerbans[data].reason)
      



                

              },700);
          }else{
            sendnotifyjs("You cant remove because you dont have access!!");
          
          }
           


        
        })
 

  });


  $( ".playerbanlist-item-button2" ).each( function( i, obj ) {
    
 

    $( this ).click( function() { 
        var data = $( this ).data( "baninfoid2" ); 
       
       
        
        $.post('https://bp_admin/banremove', JSON.stringify({playerbanid: playerbans[data].playerid}));


    
    })


});
}


function clicksetup(){
  $( ".playerlist-item-button" ).each( function( i, obj ) {
    
 

        $( this ).click( function() { 
          if (Number(playerperm) >= Number(configmainperms.playersettingsmin)){
              var data = $( this ).data( "infoid" ); 
              $('.screenmenu').fadeIn(500);
              $('.loadermain').fadeIn(0);

              currentplayerid = playerinfos[data].onlineid;
              currentplayeridentifier = playerinfos[data].playerid;
              currentplayername = playerinfos[data].playername;
              currentlicense = playerinfos[data].playerlicense;



              setTimeout(function(){
                $('.loadermain').fadeOut(0);
                $('.screenplayersettings').fadeIn(200);
                $('#playername').html(playerinfos[data].playername)
                $('#playerid').html(playerinfos[data].onlineid)
                $('#playerjob').html(playerinfos[data].playerjobname)
                $('#steamname').html(playerinfos[data].playerjustname)



                

              },700);
          }else{
            sendnotifyjs("Sorry you dont have acces for this!!");

        
          }
           


        
        })
 

  });
}



$(document).ready(function(){

  $("#objectyes").click(function(){
   $.post('https://bp_admin/selectobjecttype', JSON.stringify({type: "yes"}));
     
  });


  $("#objectno").click(function(){
    $.post('https://bp_admin/selectobjecttype', JSON.stringify({type: "no"}));
 
  });





  $(".screenplayerexit").click(function(){
    $('.screenmenu').fadeOut(500);
    $('.screenplayersettings').fadeOut(0);
  });


  $(".screenvehicleexit").click(function(){
    $('.screenmenu').fadeOut(500);
    $('.screenvehiclesettings').fadeOut(0);
  });

  $(".screenbanexit").click(function(){
    $('.screenmenu').fadeOut(500);
    $('.screenbansettings').fadeOut(0);
  });

  

  $("#playerrightbanlist").click(function(){
    $('.rightmenu-item').removeClass('addhover2');

    $('#playerrightbanlist').addClass('addhover2');
    $('.playerlist').fadeOut(0);
    $('.playerbanlist').fadeIn(0);

    // insertbanlist(playerbans);
  });

  $("#playerrightlist").click(function(){
    $('.rightmenu-item').removeClass('addhover2');

    $('#playerrightlist').addClass('addhover2');
    $('.playerbanlist').fadeOut(0);
    $('.playerlist').fadeIn(0);
    
    insertplayerlist(playerinfos);
  });

  $("#vehiclelistidsi").click(function(){
    $('.vehiclelist').fadeIn(0);
    $('#vehiclelistright').fadeIn(0);
    


    $('.playerbanlist').fadeOut(0);
    $('.playerlist').fadeOut(0);
    $('.objectlist').fadeOut(0);
    $('.itemlist').fadeOut(0);
    $('.extralist').fadeOut(0);
    $('.loglist').fadeOut(0);


    $('#objectlistright').fadeOut(0);
    $('#playerrightlist').fadeOut(0);
    $('#playerrightbanlist').fadeOut(0);
    $('#supportlistright').fadeOut(0);
    $('#extralistright').fadeOut(0);
    $('#loglistright').fadeOut(0);

    

    $('.rightmenu-item').removeClass('addhover2');
    $('.leftmenu-items').removeClass('addhover2');
    $('#vehiclelistright').addClass('addhover2');
    $('.leftmenu-items').removeClass('addhover');
    $('#vehiclelistidsi').addClass('addhover');

  });


  $("#playersupportidsi").click(function(){
    $('.itemlist').fadeIn(0);
    $('#supportlistright').fadeIn(0);
    $('#supportlistbeyaid').fadeIn(0);

    $('.objectlist').fadeOut(0);
    $('.playerbanlist').fadeOut(0);
    $('.playerlist').fadeOut(0);
    $('.vehiclelist').fadeOut(0);
    // $('.itemlist').fadeOut(0);
    $('.extralist').fadeOut(0);
    $('.loglist').fadeOut(0);
    

    $('#playerrightbanlist').fadeOut(0);
    $('#vehiclelistright').fadeOut(0);
    $('#playerrightlist').fadeOut(0);
    $('#objectlistright').fadeOut(0);
    $('#extralistright').fadeOut(0);
    $('#supporttalkbeyaid').fadeOut(0);
    $('#loglistright').fadeOut(0);

    

    insertticketlist(currenttickets);

 

    $('.rightmenu-item').removeClass('addhover2');
    $('#vehiclelistright').addClass('addhover2');
    $('.leftmenu-items').removeClass('addhover2');
    $('.leftmenu-items').removeClass('addhover');
    $('#playersupportidsi').addClass('addhover');
    
  });

  $("#adminextraidsi").click(function(){
    $('.extralist').fadeIn(0);
    $('#extralistright').fadeIn(0);


    $('.playerbanlist').fadeOut(0);
    $('.itemlist').fadeOut(0);
    $('.objectlist').fadeOut(0);
    $('.playerlist').fadeOut(0);
    $('.vehiclelist').fadeOut(0);
    $('.loglist').fadeOut(0);

  
    $('#playerrightlist').fadeOut(0);
    $('#playerrightbanlist').fadeOut(0);
    $('#vehiclelistright').fadeOut(0);
    $('#objectlistright').fadeOut(0);
    $('#extralistright').fadeIn(0);
    $('#loglistright').fadeOut(0);
    $('#supporttalkbeyaid').fadeOut(0);
    $('#supportlistright').fadeOut(0);






    $('.rightmenu-item').removeClass('addhover2'); 
    $('.leftmenu-items').removeClass('addhover2');
    $('#extralistright').addClass('addhover2');
    $('.leftmenu-items').removeClass('addhover');
    $('#adminextraidsi').addClass('addhover');


 
  });
  
  $("#objectlistidsi").click(function(){

    $('.objectlist').fadeIn(0);
    $('#objectlistright').fadeIn(0);

 


    $('.playerbanlist').fadeOut(0);
    $('.playerlist').fadeOut(0);
    $('.itemlist').fadeOut(0);
    $('.extralist').fadeOut(0);
    $('.vehiclelist').fadeOut(0);
    $('.loglist').fadeOut(0);


    $('#playerrightlist').fadeOut(0);
    $('#playerrightbanlist').fadeOut(0);
    $('#vehiclelistright').fadeOut(0);
    $('#extralistright').fadeOut(0);
    $('#loglistright').fadeOut(0);
    $('#supporttalkbeyaid').fadeOut(0);
    $('#supportlistright').fadeOut(0);





    $('.leftmenu-items').removeClass('addhover2');
    $('.rightmenu-item').removeClass('addhover2');
    $('#objectlistright').addClass('addhover2');
    $('.leftmenu-items').removeClass('addhover');
    $('#objectlistidsi').addClass('addhover');

  });

  

  $("#playerlistimiz").click(function(){

    $('#playerrightlist').fadeIn(0);
    $('#playerrightbanlist').fadeIn(0);
    $('.playerlist').fadeIn(0);

    $('#supportlistright').fadeOut(0);
    $('#vehiclelistright').fadeOut(0);
    $('#extralistright').fadeOut(0);
    $('#loglistright').fadeOut(0);
    $('#objectlistright').fadeOut(0);
    $('.playerbanlist').fadeOut(0);

    $('.objectlist').fadeOut(0);
    $('.vehiclelist').fadeOut(0);
    $('.itemlist').fadeOut(0);
    $('.extralist').fadeOut(0);
    $('.loglist').fadeOut(0);

 
    $('.leftmenu-items').removeClass('addhover');
    $('#playerlistimiz').addClass('addhover');
    $('.rightmenu-item').removeClass('addhover2');
    $('#playerrightlist').addClass('addhover2');
  });



  $("#adminlogidsi").click(function(){
    $('.loglist').fadeIn(0);
    $('#loglistright').fadeIn(0);

    $('#supportlistright').fadeOut(0);
    $('#vehiclelistright').fadeOut(0);
    $('#extralistright').fadeOut(0);

    $('#objectlistright').fadeOut(0);

    $('.objectlist').fadeOut(0);
    $('.vehiclelist').fadeOut(0);
    $('.itemlist').fadeOut(0);
    $('.extralist').fadeOut(0);
   

    $('#playerrightlist').fadeOut(0);
    $('#playerrightbanlist').fadeOut(0);
    $('.playerlist').fadeOut(0);

 
    $('.leftmenu-items').removeClass('addhover');
    $('#adminlogidsi').addClass('addhover');
    $('.rightmenu-item').removeClass('addhover2');
    $('#loglistright').addClass('addhover2');
  });

  $("#vehiclespawnconfirm").click(function(){
   var vehicleplate = $('#getvehicleplate').val();
   var vehiclecolor = $('#getvehiclecolor').val();
   var vehiclefullmod = $('#getvehiclemods').prop('checked')
   var vehicleturbomod = $('#getvehicleturbo').prop('checked')
   var vehicledamagemod = $('#getvehicledamage').prop('checked')
  

   if (vehicleplate.length == 0) {
    vehicleplate = "random"
   }

   $.post('https://bp_admin/vehiclespawn', JSON.stringify({ vehicleplate : vehicleplate, vehiclecolor : vehiclecolor, vehiclefullmod : vehiclefullmod, vehicleturbomod : vehicleturbomod, vehicledamagemod : vehicledamagemod, vehiclemodel : vehicledata.vehiclemodel}));
   
   $('.screenmenu').fadeOut(0);
   $('.screenvehiclesettings').fadeOut(0);
   $('.vehiclelist').fadeOut(0);
  //  $('body').fadeOut(0);
   $('.adminmain').fadeOut(0);
   $('#vehiclelistright').fadeOut(0);


   
  });




  $(".chatimagepart").click(function(){
    $('.addimagepart').fadeIn(500);
  });

  $(".addimagepart").click(function(e){
               
    if (!$(e.target).is('.imageboxcenter, .imageboxcenter *')) {
     $('.addimagepart').fadeOut(500);
     }
 });

 $("#imageenterlar").click(function(e){
  var heyy = document.getElementById("imageinput").value;

  if (heyy.length != 0) {

      var denetim = '<img src="'+heyy+'" alt="" width="300px" height="300px" >'

      $.post('https://bp_admin/insertchat', JSON.stringify({ 
              inputvalues : denetim,
              currentticketid : currentticketid
           
            


          }));
      
      document.getElementById("imageinput").value = "";
      $('.addimagepart').fadeOut(500);
  }

});

  $("#giveitemid").click(function(){
    if (Number(playerperm) >= Number(configextraperms.giveitem)){
      var itemname = $('#itembeya').val();
      var itemcount = $('#itembeya2').val();
      var itemplayer = $('#itembeya3').val();
        
        if (itemname.length > 0 && itemcount.length > 0 && itemplayer.length > 0){
          $.post('https://bp_admin/giveitem', JSON.stringify({ itemname : itemname, itemcount : itemcount, itemplayer : itemplayer}));

        }

    }else{
      sendnotifyjs("You cant give item. because your permission lvl low");
      
    }
    
  });

  $("#givemoneyid").click(function(){
    if (Number(playerperm) >= Number(configextraperms.givemoney)){
        var moneyname = $('#itembeya4').val();
        var moneycount = $('#itembeya5').val();
        var moneyplayer = $('#itembeya6').val();
          
          if (moneyname.length > 0 && moneycount.length > 0 && moneyplayer.length > 0){
            $.post('https://bp_admin/givemoney', JSON.stringify({ moneyname : moneyname, moneycount : moneycount, moneyplayer : moneyplayer}));

          }
    }else{
      sendnotifyjs("You cant give money. because your permission lvl low");

    }
    
  });



  // ------------------------------------------------------------ player commands ------------------------

  $("#playerrevive").click(function(){
    $.post('https://bp_admin/playercommand', JSON.stringify({ commandtype : "revive" , commandid : currentplayerid}));

  });
  
  $("#playerheal").click(function(){
    $.post('https://bp_admin/playercommand', JSON.stringify({ commandtype : "heal" , commandid : currentplayerid}));

  });

  $("#playerbring").click(function(){
    $.post('https://bp_admin/playercommand', JSON.stringify({ commandtype : "bring" , commandid : currentplayerid}));

  });

  $("#playergoto").click(function(){
    $.post('https://bp_admin/playercommand', JSON.stringify({ commandtype : "goto" , commandid : currentplayerid}));

  });

  $("#playerkick").click(function(){
    $('.addbanpart').fadeIn(200);

    $.post('https://bp_admin/playercommand', JSON.stringify({ commandtype : "kick" , commandid : currentplayerid}));

  });

  $("#playerban").click(function(){
    $('#baninput').html('');
    $('.screenmenu').fadeOut(0);
    $('.screenplayersettings').fadeOut(0);
    $('.addbanpart').fadeIn(200);
    

    
    // $.post('https://bp_admin/playercommand', JSON.stringify({ commandtype : "ban" , commandid : currentplayerid}));

  });

  $("#banyes").click(function(){
    $('.addbanpart').fadeOut(200);
     var banreason =  $('#baninput').val();
     var bantime =  $('#bantimeid').val();

     if (banreason.length > 0){
      $.post('https://bp_admin/playercommand', JSON.stringify({ commandtype : "ban" , commandid : currentplayerid, commandbanid : currentplayeridentifier, commandbanname : currentplayername, commandbanreason:banreason, commandbantime:bantime, commandlicense : currentlicense  }));
     }
    

  });


  $("#banno").click(function(){
    $('.addbanpart').fadeOut(200);
    
   

  });

  $("#backtolist").click(function(){
    $('.onlineplayerlistsecond').fadeOut(0);
    $('.onlineplayerlistsys').fadeIn(0);

    insertdevmode(playerinfos);
    
   

  });

  $("#spectateclick").click(function(){
    
    $.post('https://bp_admin/sendforspec', JSON.stringify({ currentspecid : currentspecid }));
   

  });


  $("#reviveclickdev").click(function(){
    
    $.post('https://bp_admin/reviveclickdev', JSON.stringify({ currentspecid : currentspecid }));
   

  });

  $("#bringclickdev").click(function(){
    
    $.post('https://bp_admin/bringclickdev', JSON.stringify({ currentspecid : currentspecid }));
   

  });
  

  $("#gotoclickdev").click(function(){
    
    $.post('https://bp_admin/gotoclickdev', JSON.stringify({ currentspecid : currentspecid }));
   

  });


  $("#healclickdev").click(function(){
    
    $.post('https://bp_admin/healclickdev', JSON.stringify({ currentspecid : currentspecid }));
   

  });
  

  $("#kickclickdev").click(function(){
    
    $.post('https://bp_admin/kickclickdev', JSON.stringify({ currentspecid : currentspecid }));
   

  });


  $(".screenticketexit").click(function(){
    
    $('.screenmenu').fadeOut(0);
    $('.screenticketsettings').fadeOut(0);
   

  });


  
  
  
  

  


  $("#updatedevelopermode").click(function(){
    
    if (Number(playerperm) >= Number(configextraperms.developermod)){
      var getdevelopermodcheck = $('#cbx').prop('checked')
  
      $.post('https://bp_admin/sendemode', JSON.stringify({ modnow : getdevelopermodcheck }));
      
        // document.getElementById("developermenuid").animate([
        //   // keyframes
        //   { transform: 'translateX(-200px)' },
        //   { transform: 'translateY(100px)' }
        // ], {
        //   // timing options
        //   duration: 500,
        //   delay: 100
          
        // });
    }else{
      sendnotifyjs("You cant acces dev mode");

     
    }
    
   

  });


  $("#pedupdate").click(function(){
    var writeped = $('#devmenuped').val();
    var writeid = $('#devmenupedid').val();
    if (writeped.length > 0 && writeid.length > 0 )
    {
      $.post('https://bp_admin/pedupdate', JSON.stringify({ writeped : writeped , writeid: writeid}));

      $('#devmenuped').val('');
      $('#devmenupedid').val('');

    }
    
    
   

  });


  $("#ticketsendid").click(function(){
    var writetop = $('#tickettopwriteid').val();
    var writemessage = $('#ticketmsgwriteid').val();

    if (writetop.length > 0 && writemessage.length > 0){
       $('.screenmenu').fadeOut(0);
       $('.screenticketsettings').fadeOut(0);
      $.post('https://bp_admin/ticketinsert', JSON.stringify({ playeridisi : playeridisi , writetop: writetop, writemessage : writemessage, playernames:playernames}));
      $('#tickettopwriteid').val('');
      $('#ticketmsgwriteid').val('');
       
    }
   
    
    
   

  });

  $(".playerticketrightadd").click(function(){
    $('.screenmenu').fadeIn(500);
    $('.loadermain').fadeIn(0);

   


    setTimeout(function(){
      $('.loadermain').fadeOut(0);
      $('.screenticketsettings').fadeIn(200);





      

    },700);
    
   
  });

  $(".playerticketmaintoptext").click(function(){
    $('.playerticketmessagepart').fadeOut(0);
    $('.playerticketlist').fadeIn(200);

    inserplayertickets(currenttickets);

  });


  
  $("#adminrconon").click(function(){
    if (Number(playerperm) >= Number(configmainperms.rconmin)){
      closemainadmin();
      $('.rconpart').fadeIn(500);
      rconaktif = true;
      $.post('https://bp_admin/rconpartopen', JSON.stringify({ }));
    }else{
      sendnotifyjs("You cant acces rcon");

   
    }

  });

  $("#closercon").click(function(){
  
    rconaktif = false;
   
    $('.rconpart').fadeOut(500);
    $.post('https://bp_admin/rconpartclose', JSON.stringify({ }));
  
  });

  $("#rconhide").click(function(){
  
    $('.rconpart').fadeOut(500);
    $('.rcondowntext').fadeIn(300);
    
    rconaktif = false;

   
    $.post('https://bp_admin/rconparthide', JSON.stringify({ }));

  });
  
  $("#announcesend").click(function(){
     var writeannounce = $('#announid').val();
  
     if (writeannounce.length > 0){

      closemainadmin();


         $.post('https://bp_admin/checkannounce', JSON.stringify({ announcemsg: writeannounce }));

         $('#announid').val('');
      

     }

  });
  
  
  
  
});

function insertloglist(veri){
  $('#loglistbeyaid').html('');
  for (let i = 0; i < veri.length; i++) {
    const element = veri[i];
     $('#loglistbeyaid').append('<div class="log-item"> <div class="log-item-active"> <img src="info.svg" alt="" style="width: 20px; margin-top:-16px;"> </div> <div class="log-item-playername">STATE : '+element.log_message+'. PLAYER N. : '+element.log_playername+'. PLAYER ID : '+element.log_playerid+'</div> </div>');
  
   
  }

}



$("#searcinputwith2").keyup(function() {
  var n = $("#searcinputwith2").val().toLowerCase(); //convert value to lowercase for case-insensitive comparison

  $(".playerlist-item").each( function(){

      var $this = $(this);
      var value = $this.attr( "data-find" ).toLowerCase();
  
  
      $this.toggleClass( "hidden", !value.includes( n ) );

      
     
  })
});



$("#searcinputwith3").keyup(function() {
  var n = $("#searcinputwith3").val().toLowerCase(); //convert value to lowercase for case-insensitive comparison

  $(".playerbanlist-item").each( function(){

      var $this = $(this);
      var value = $this.attr( "data-find2" ).toLowerCase();
 
  
      $this.toggleClass( "hidden", !value.includes( n ) );

      
     
  })
});

$("#searcinputwith4").keyup(function() {
  var n = $("#searcinputwith4").val().toLowerCase(); //convert value to lowercase for case-insensitive comparison

  $(".vehiclelistcard").each( function(){

      var $this = $(this);
      var value = $this.attr( "data-find3" ).toLowerCase();
   
  
      $this.toggleClass( "hidden", !value.includes( n ) );

      
     
  })
});


$("#searcinputwith5").keyup(function() {
  var n = $("#searcinputwith5").val().toLowerCase(); //convert value to lowercase for case-insensitive comparison

  $(".objectlistcard").each( function(){

      var $this = $(this);
      var value = $this.attr( "data-find4" ).toLowerCase();
   
  
      $this.toggleClass( "hidden", !value.includes( n ) );

      
     
  })
});



document.getElementById("enterrcon").addEventListener("keypress", function(event) {
        
  if (event.key === "Enter") {
       
      if (this.value.length != 0) {
        var totalWords = this.value;

        var firstWord = totalWords.replace(/ .*/,'');
        var secondWord =totalWords.split(" ")

        if (secondWord[1] == "bp_admin"){
          $.post('https://bp_admin/rconbesterror', JSON.stringify({}));
          this.value = '';
          return;
        }

       
          if (firstWord == "restart"){
           
              
              if (secondWord.length < 3){

                  if (secondWord.length > 1){
                          $.post('https://bp_admin/rconrestart', JSON.stringify({ scriptname: secondWord[1]}));
                          this.value = '';
                  }

              }

          }else if(firstWord == "start"){
            if (secondWord.length < 3){

              if (secondWord.length > 1){
                    $.post('https://bp_admin/rconstart', JSON.stringify({ scriptname: secondWord[1]}));
                    this.value = '';
              }

            }
          }else if(firstWord == "stop"){
            if (secondWord.length < 3){

              if (secondWord.length > 1){
                    $.post('https://bp_admin/rconstop', JSON.stringify({ scriptname: secondWord[1]}));
                    this.value = '';

              }

            }

          }else if(firstWord == "commands"){
            if (secondWord.length < 2){

              if (secondWord.length > 0){
                    $.post('https://bp_admin/rconcommandsinfo', JSON.stringify({}));
                    this.value = '';

              }

            }
          }
        
          $(".rconchathere").stop().animate({ scrollTop: $(".rconchathere")[0].scrollHeight}, 1000);
          
      }
  
  
  }
});



document.getElementById("userchatinput").addEventListener("keypress", function(event) {
        
  if (event.key === "Enter") {
       
      if (this.value.length != 0) {
       
          $.post('https://bp_admin/insertchat', JSON.stringify({ 
              inputvalues : this.value,
              currentticketid : currentticketid
           
            


          }));
          $(".scroller2").stop().animate({ scrollTop: $(".scroller2")[0].scrollHeight}, 1000);
          document.getElementById("userchatinput").value = '';
      }
  
  
  }
});



document.getElementById("userchatinputplayer").addEventListener("keypress", function(event) {
        
  if (event.key === "Enter") {
       
      if (this.value.length != 0) {
       
          $.post('https://bp_admin/insertchat', JSON.stringify({ 
              inputvalues : this.value,
              currentticketid : currentticketid
           
            


          }));
          $(".playeticketscroller2").stop().animate({ scrollTop: $(".playeticketscroller2")[0].scrollHeight}, 1000);
          document.getElementById("userchatinputplayer").value = '';
      }
  
  
  }
});



function weatherclick(data){
  if (Number(playerperm) >= Number(configextraperms.weather)){
      $('.screenmenu').fadeIn(500);
      $('.loadermain').fadeIn(0);

      setTimeout(function(){
        $('.loadermain').fadeOut(0);
      
        $.post('https://bp_admin/changewheater', JSON.stringify({ weathertype : data}));

        $('.screenmenu').fadeOut(500);

        

      },700);
    }else{
      sendnotifyjs("You cant do this sorry");

     
    }

 
}


var acc = document.getElementsByClassName("developermenuitem");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = 500 + "px";
    

    } 
  });
}

function closemainplayerticket(){
  $('.playerticketmain').fadeOut(300);
  $('.playerticketlist').fadeOut(0);
  $('.playerticketmessagepart').fadeOut(0);
  $.post('https://bp_admin/closenui', JSON.stringify({ }));
}


document.onkeyup = function (data) {
  if (data.which == 27) {
    if (devmodeaktif == true && rconaktif == false){
      $('.developermenu').css('opacity', "0.2") 
      $('.developermenuspec').css('opacity', "0.2") 


      $.post('http://bp_admin/hidemod', JSON.stringify({}));

    }

    if (adminticketmodaktif == true && rconaktif == false){
      closemainadmin();
      adminticketmodaktif = false;
    }

    if (playerticketmodaktif == true && rconaktif == false){
      closemainplayerticket();
      playerticketmodaktif = false;
    }
     
    return
  }

  // if (data.which == 36){
  //    if (rconhide){
  //       $('.rconpart').fadeIn(500);
  //         $.post('https://bp_admin/rconpartopen', JSON.stringify({ }));

  //         rconhide = false;
  //        $('.rcondowntext').fadeOut(300);


  //    }
  // }
};







function objectchange(value){
  var bune =  $(value).prop('checked');
  $.post('http://bp_admin/objectchange', JSON.stringify({change: bune}));
 
}


function vehiclechange(value){
  var bune =  $(value).prop('checked');
  $.post('http://bp_admin/vehiclechange', JSON.stringify({change: bune}));
 
}

function pedchange(value){
  var bune =  $(value).prop('checked');
  $.post('http://bp_admin/pedchange', JSON.stringify({change: bune}));
 
}

function undamaged(value){
  var bune =  $(value).prop('checked');
  $.post('http://bp_admin/undamaged', JSON.stringify({change: bune}));

}

function playerfast(value){
  var bune =  $(value).prop('checked');
  $.post('http://bp_admin/faster', JSON.stringify({change: bune}));

}




function noclip(value){
  var bune =  $(value).prop('checked');
 
  if (bune == true){
    $('.noclippart').fadeIn(0);
    var right = $('#noclippartid').offset().right;
    $("#noclippartid").css({right:right})  // Set the left to its calculated position
    .animate({"right":"0px"}, "slow");
  }else{
    
    var right = $('#noclippartid').offset().right;
    $("#noclippartid").css({right:right})  // Set the left to its calculated position
    .animate({"right":"-500px"}, "slow");

    setTimeout(() => {
      $('.noclippart').fadeOut(0);
    }, 500);
  }



  $.post('http://bp_admin/noclip', JSON.stringify({change: bune}));
}