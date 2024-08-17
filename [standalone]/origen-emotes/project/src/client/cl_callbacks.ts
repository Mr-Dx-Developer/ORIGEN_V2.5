import { NUI } from "./classes/NUI";

RegisterNuiCallbackType("playEmote");
on("__cfx_nui:playEmote", (data: any, cb: Function) => {
    NUI.closeUI();

    if (data.type === "Walks") {
        ExecuteCommand(`walk "${data.emoteName}"`) 
    } else {
        ExecuteCommand(`e "${data.emoteName}"`)
    }
    cb("OK");
});

RegisterNuiCallbackType("hideFrame");
on("__cfx_nui:hideFrame", (data: any, cb: Function) => {
    NUI.closeUI();
    cb("OK");
});