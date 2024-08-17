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

export function formatNumberWithComma(number: number) {
  number = number ?? 0;
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
export function capitalizeFirstLetter(string: string) {
  if (typeof string != "string") return "";
  return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
}
export const isDeepEqual = (obj1: any, obj2: any) => {
  if (obj1 === obj2) {
    return true;
  }
  if (
    typeof obj1 !== "object" ||
    typeof obj2 !== "object" ||
    obj1 == null ||
    obj2 == null
  ) {
    return false;
  }

  const keys1 = Object.keys(obj1);
  const keys2 = Object.keys(obj2);

  if (keys1.length !== keys2.length) {
    return false;
  }

  for (const key of keys1) {
    if (!keys2.includes(key) || !isDeepEqual(obj1[key], obj2[key])) {
      return false;
    }
  }

  return true;
};

export function getFormattedDate() {
  const options: Intl.DateTimeFormatOptions = {
    weekday: "short",
    day: "numeric",
    month: "short",
    hour: "2-digit",
    minute: "2-digit",
    hour12: false,
  };

  const formattedDate = new Intl.DateTimeFormat("default", options).format(
    new Date()
  );

  return formattedDate;
}
