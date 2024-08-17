import { Hotbar } from "./classes/Hotbar";
import { NUI } from "./classes/NUI";
import "./cl_callbacks.ts";

let opened = false;
RegisterCommand("emotes", () => {
    if (opened) {
        NUI.closeUI();
    } else {
        NUI.openUI();
    }
}, false);

setImmediate(() => {
    Hotbar.RegisterCommands();
})