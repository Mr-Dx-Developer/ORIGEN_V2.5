let timeout;

 function closeMenu() {
   $.post('https://freecity_books/close', JSON.stringify({}));
   $(".flipbook-viewport").fadeOut(400);
   timeout = setTimeout(function () {
     $('.flipbook').turn('destroy');
  }, 400);
 }

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    let action = event.data.action;
    let item = event.data.menuItem;
    let itemPages = {'page':''};
    let pagesIndex = 1
    let base = ''

    if (action === "open_"+item) {
      let numberOfPages = event.data.pages
      $(".flipbook").html('');
      for (let key of Object.keys(itemPages)) {
        while (pagesIndex <= numberOfPages) {
          base =`${base}<img src="pages/${item + pagesIndex}.jpg" alt="">`;
        pagesIndex++;
        $(".flipbook").html(base)
        }
      }
          
        openMenu();
        cityMenu();
          let menuEl = document.querySelector(".flipbook-viewport");
         menuEl.style.display = "block";
    }

  });
});



function cityMenu() {
 $(window).ready(function () {
   $(".flipbook").turn({
     display: "double",
     acceleration: true,
     duration: 2000,
     gradients: !$.isTouch,
     elevation: 50,
     inclination: 1,
     when: {
       turned: function (e, page) {

       },
     },
   });
 });
};

//audio
function openMenu() {
  var audio = document.getElementById("open-menu");
  audio.volume = 0.2;
  audio.play();
}


$(document).keyup(function (e) {
  if (e.keyCode === 27) {
    closeMenu();
  }
});

