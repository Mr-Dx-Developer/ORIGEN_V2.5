const copyToClipboard = (str) => {
    const el = document.createElement('textarea');
    el.value = str;
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
    console.log("^5copied "+str+" to clipboard");
}

const RenderPlayerList = (source, identifier) => {
    return `
        <div class="listcard" id="${identifier}">
            <div class="playerid-txt">${source}</div>
            <div class="identifier"> ${identifier}</div>
        </div>
    `;
};

const OpenScoreboard = (data, count, isadmin) => {
    let html = "";
    $("#scoretitle").html(`Online <br> Players [${count}]`);
    Object.entries(data).forEach(([_, item]) => {
        if (item !== null) {
            let identifier = isadmin === true ? item.name : item.identifier;
            let source = item.source;
            html += RenderPlayerList(source, identifier);
        }
    });
    $("#playerlist").html(html);
    $('.listcard').click(function() {
        const target = $(this)
        copyToClipboard(target.attr('id'));
    });
};

const CloseScoreboard = () => {
    $("#playerlist").html(" ");
    $("#scoretitle").html(" ");
};

const ForceClose = () => {
    $.post(`https://${GetParentResourceName()}/CloseScoreboard`);
    return CloseScoreboard();
};

window.addEventListener("message", (event) => {
    const data = event.data;
    const playerlist = data.data;
    const action = data.action;
    switch (action) {
        case "OPEN_BOARD":
            return OpenScoreboard(playerlist, data.count, data.isadmin);
        case "CLOSE_BOARD":
            return CloseScoreboard();
        default:
            return;
    }
});

document.onkeyup = function (event) {
    const charCode = event.key;
    if (charCode == "Escape" || charCode == "Backspace") {
        ForceClose();
    }
};