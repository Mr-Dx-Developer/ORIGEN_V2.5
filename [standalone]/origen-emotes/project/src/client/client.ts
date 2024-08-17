import "./cl_main.ts";

on('onResourceStart', (resName: string) => {
  if (resName === GetCurrentResourceName()) {
    console.log('Emotes Menu started!')
  }
})