interface CustomWindow extends Window {
  invokeNative?: unknown;
}

// Will return whether the current environment is in a regular browser
// and not CEF
export const isEnvBrowser = (): boolean =>
  !(window as CustomWindow).invokeNative;

// Basic no operation function
export const noop = (): void => {};

export function debugLog(error: any, functionName?: string) {
  const now = new Date();
  const timestamp = now.toISOString();
  const errorMessage = error.message || "No Message.";
  const errorStack = error.stack || "No Stack.";

  const logMessage = `
    Info: ${functionName ?? "?"},
    Time: ${timestamp}
    Error Message: ${errorMessage}
    Error Stack Trace: ${errorStack}
    Error: ${error}
  `;
  console.error(logMessage);
}

export function getFormattedDate() {
  const options: Intl.DateTimeFormatOptions = {
    hour: "2-digit",
    minute: "2-digit",
    hour12: false,
  };

  const formattedDate = new Intl.DateTimeFormat("default", options).format(
    new Date()
  );

  return formattedDate;
}

export const parseText = (str: any) => {
  return str
    .replace(/(<([^>]+)>)/gi, "")
    .replace(
      /\^([0-9])/g,
      (str: never, color: any) =>
        `</span><span data-m="${str}" class="chat-textColor-${color}">`
    )
    .replaceAll("\n", "<br/>");
};
