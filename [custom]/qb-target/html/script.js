window.onload = function(e) {
    window.addEventListener("message", function(event) {
        let data = event.data;
        switch (data.response) {
            case "foundTarget":
                document.querySelector(".peak-icon").classList.remove("deactive");
                document.querySelector(".peak-icon").classList.add("active");
                document.querySelector(".under-element").classList.remove("deactive");
                document.querySelector(".under-element").classList.add("active");
                break;
            case "openTarget":
                $('.container').css('display', 'block')
                break;
            case "closeTarget":
                $('.options').html('');
                document.querySelector(".peak-icon").classList.remove("active");
                document.querySelector(".peak-icon").classList.add("deactive");
                document.querySelector(".under-element").classList.remove("active");
                document.querySelector(".under-element").classList.add("deactive");
                $('.container').css('display', 'none')
                break;
            case "leftTarget":
                $('.options').html('');
                document.querySelector(".peak-icon").classList.remove("active");
                document.querySelector(".peak-icon").classList.add("deactive");
                document.querySelector(".under-element").classList.remove("active");
                document.querySelector(".under-element").classList.add("deactive");
                $('.options').css('display', 'none')
                break;
            case "validTarget":
                ValidTarget(data.data);
                break;
        }
    });
};

function ValidTarget(item) {
    $('.options').html('');
    $('.options').css('display', 'block');
    for (var k in item) { 
        let html = `
            <div class="option" id="target-${k}">
                <i id="target-${k}" style="font-size: .75vw; color: #00f8b9;" class="${item[k].icon}"></i>
                <h6 id="target-${k}" class="MuiTypography-root MuiTypography-h6 MuiTypography-colorTextPrimary" style="word-break: break-word;">${item[k].label}</h6>
            </div>
        `
        $(".options").append(html);
    }
}

$(document).on('mousedown', (event) => {
    let element = event.target;
    console.log(element.id)
    if (element.id.split("-")[0] === 'target') {
        let TargetData = element.id.split("-")[1]

        $.post(`https://qb-target/selectTarget`, JSON.stringify(Number(TargetData)+1));
        document.querySelector(".peak-icon").classList.remove("active");
        document.querySelector(".peak-icon").classList.add("deactive");
        document.querySelector(".under-element").classList.remove("active");
        document.querySelector(".under-element").classList.add("deactive");
        $('.container').css('display', 'none')
        $('.options').css('display', 'none')
    }
});



function FadeIn(Object, Timeout) {
    $(Object).fadeIn(Timeout).css('display', 'block');
}

function FadeOut(Object, Timeout) {
    $(Object).fadeOut(Timeout)
    setTimeout(function(){
        $(Object).css("display", "none");
    }, Timeout)
}