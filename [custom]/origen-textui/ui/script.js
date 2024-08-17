function FadeIn(Object, Timeout) {
    $(Object).fadeIn(Timeout).css('display', 'block');
}

function FadeOut(Object, Timeout) {
    $(Object).fadeOut(Timeout)
    setTimeout(function(){
        $(Object).css("display", "none");
    }, Timeout)
}

window.onload = function(e) {
    window.addEventListener("message", function(event) {
        switch (event.data.action) {
            case 'opencircle':
                let xx = event.data.post
                OpenCircle(xx.x, xx.y, xx.id)
                break;
            case 'closecircle':
                FadeOut("#circle-"+event.data.post.id, 200)
                break;
            case 'drawText':
                let x = event.data.post
                $(".press2 .text2").html(x.key)
                $(".index2 .text2").html(x.text)
                FadeIn('.text-container2', 200)
                break;
            case 'changeText':
                $(".index2 .text2").html(event.data.post.text)
                break;
            case 'drawTextUpdate':
                let x2 = event.data.post
                $(".index2 .text2").html(x2.text)
                break;
            case 'drawTextClose':
                FadeOut('.text-container2', 200)
                break;
            case 'drawTextPress':
                $(".text-container2 .press2").css('box-shadow', "0vw .0521vw .6vw 0vw rgba(10, 116, 103, .7)");
                $(".text-container2 .index2").css('box-shadow', "0vw .0521vw .6vw 0vw rgba(10, 116, 103, .7)");
                setTimeout(function(){
                    $(".text-container2 .press2").css('box-shadow', "0vw .0521vw .5625vw 0vw rgba(10, 116, 103, 0.35)");
                    $(".text-container2 .index2").css('box-shadow', "0vw .01vw .1vw 0vw rgba(12, 63, 60, 0.05)");
                    setTimeout(function(){
                        FadeOut('.text-container2', 200)
                    }, 50)
                },1000)
                break;
            case 'updatecircle':
                $("#circle-"+event.data.post.id).css('left', event.data.post.x*100+"%");
                $("#circle-"+event.data.post.id).css('right', (100 - event.data.post.x*100)+"%");
                $("#circle-"+event.data.post.id).css('top', event.data.post.y*100+"%");
                $("#circle-"+event.data.post.id).css('bottom',(100 - event.data.post.y*100)+"%");
                break;
            case 'open':
                let xxx = event.data.post
                OpenContainer(xxx.x, xxx.y, xxx.text, xxx.key)
                break;
            case 'close':
                FadeOut('.text-container', 200)
                break;
        }
    });
};

function OpenContainer(x, y, text, key) {
    $('.text-container').css('left', x*100+"%");
    $('.text-container').css('right', (100 - x*100)+"%");
    $('.text-container').css('top', y*100+"%");
    $('.text-container').css('bottom',(100 - y*100)+"%");
    $(".press .text").html(key)
    $(".index .text").html(text)
    FadeIn('.text-container', 200)
}

function OpenCircle(x, y, id) {
    $(".circle").append(`
        <img id="circle-${id}" style="display: none; top: 25vw; left: 50vw; position: absolute; width: 30px; height: 30px;" src="circle.svg" alt="">
    `);
    $("#circle-"+id).css('left', x*100+"%");
    $("#circle-"+id).css('right', (100 - x*100)+"%");
    $("#circle-"+id).css('top', y*100+"%");
    $("#circle-"+id).css('bottom',(100 - y*100)+"%");
    FadeIn("#circle-"+id, 200)
}