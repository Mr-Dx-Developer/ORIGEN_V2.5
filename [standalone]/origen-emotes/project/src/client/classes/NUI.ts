export class NUI {
    static openUI(type?: string) {
        this.sendReactMessage('setVisible', true);
        SetNuiFocus(true, true);
        
        const emotes = global.exports["dpemotes"].getEmotes();
        this.sendReactMessage("setEmotes", emotes)
    }

    static closeUI() {
        this.sendReactMessage('setVisible', false);
        SetNuiFocus(false, false);
    }

    static sendReactMessage(action: string, data: object | boolean | string | number) {
        SendNuiMessage(
            JSON.stringify({
                action: action,
                data: data,
            })
        );
    }
}