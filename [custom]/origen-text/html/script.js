var currentIndex = 0
var totalItems = $('.item').length;

window.onload = function(e) {
window.addEventListener("message", function (e) {
    e = e.data
    switch (e.action) {
      case "open":
        return open(e.data)
      case "close":
        append = false
        return $("body").fadeOut(500);
      case "key":
        return changeItem(e.key);
      default:
        return;
    }
});
}


append = false
function open(data) {
    
    if (append) {
        return;
    }
    
    $('.right-box').empty();
    $.each(data["item"], function (index, value) {
        append = true;
        $('.right-box').append(`
            
        <div class="item">
         
        <div class="item-box-border"></div>
        <div class="border">
          <svg class="control-1" width="10" height="20" viewBox="0 0 19 20" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M18.9882 19.1734C15.5745 11.1177 9.48555 4.48671 1.74947 0.400052L0.832188 2.13647C8.16848 6.01193 13.9427 12.3002 17.18 19.9396L18.9882 19.1734Z" fill="rgb(79, 82, 82,0.8)"/>
          </svg>
          <svg style="left:-38%;transform:rotate(-137deg)" class="control-1" width="10" height="20" viewBox="0 0 19 20" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M18.9882 19.1734C15.5745 11.1177 9.48555 4.48671 1.74947 0.400052L0.832188 2.13647C8.16848 6.01193 13.9427 12.3002 17.18 19.9396L18.9882 19.1734Z" fill="rgb(79, 82, 82,0.8)"/>
        </svg>
          <div class="alt-border"></div>
        </div>
        <div class="item-right">
          <div class="itemhr"></div>
          <div style="transform: rotate(90deg);top: 20.7%;left: -9.4%;" class="itemhr"></div>
          
          <div style="transform: rotate(90deg);top:65%;left: 95.5%;" class="itemhr"></div>
          <div style="top:113%;left: 88.8%;" class="itemhr"></div>
          
          ${value.name}</div>
      </div>
        `)

    });
    $("body").fadeIn(500);
}

function resetStyles(index) {
    $('.item').eq(index).find('.item-right, .alt-border, .border, .itemhr, .control-1 path').css('background', 'rgb(79, 82, 82,0.8)');
    $('.item').eq(index).find('.control-1 path').css('fill', 'rgb(79, 82, 82,0.8)');
    $('.item').eq(index).find('.alt-border').css('display', 'none');
}

function applyStyles(index) {
    $('.item').eq(index).find('.item-right, .alt-border, .border').css('background', 'radial-gradient(83% 83% at 50% 50%,rgb(1, 104, 76),rgb(7, 197, 153))');
    $('.item').eq(index).find('.itemhr, .control-1 path').css('background', 'radial-gradient(83% 83% at 50% 50%,rgb(1, 104, 76),rgb(7, 197, 153))');
    $('.item').eq(index).find('.control-1 path').css('fill', '#19c29a');
    $('.item').eq(index).find('.alt-border').css('display', 'block');

}

function changeItem(direction) {
    resetStyles(currentIndex);

    if (direction == "down") {
        currentIndex = (currentIndex + 1) % totalItems;
    } else if (direction == "up") {
        currentIndex = (currentIndex - 1 + totalItems) % totalItems;
    } else if (direction == "enter") {
        $.post(`http://origen-text/enter`, JSON.stringify({currentIndex:currentIndex }), function (x) {});
    }

    applyStyles(currentIndex);
}