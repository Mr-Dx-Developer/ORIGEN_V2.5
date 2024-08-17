export const distance = (pos1:number[], pos2:number[]) => {
    return Math.hypot(pos1[0] - pos2[0], pos1[1] - pos2[1], pos1[2] - pos2[2])
}

export function Delay(ms: number) {
    return new Promise(res => setTimeout(res, ms));
}

export const Random = (min: number, max: number) => {
    return Math.floor(Math.random() * (max - min)) + min;
}