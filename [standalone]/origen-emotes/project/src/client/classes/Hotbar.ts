import { NUI } from "./NUI";

export class Hotbar {
    static tick = 0;

    static altPressed = false;

    static RegisterCommands() {
        for (let i = 0; i < 9; i++) {
            RegisterCommand(`alt+${i}`, () => {
                    const altState = this.altPressed || !!IsControlPressed(0, 19) || !!IsDisabledControlPressed(0, 19);
                    if (altState) {
                        NUI.sendReactMessage("hotBar", { key: `hotbar-${i}` });
                    }
            }, false);
        
            RegisterKeyMapping(`alt+${i}`, `Emote ALT+${i+1}`, "keyboard", `${i+1}`);
        }

        RegisterCommand('+emotesHotbar', this.actionAltPressed, false)
        RegisterCommand('-emotesHotbar', this.actionAltReleased, false)
        RegisterKeyMapping("+emotesHotbar", "Shortcut Hotbar", "keyboard", "LMENU")
    }

    static actionAltPressed() {
        this.altPressed = true;
    }

    static actionAltReleased() {
        this.altPressed = false;
    }
}