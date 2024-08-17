export type LocaleProps = {
  [key: string]: string;
};

export type LocaleContextProps = {
  _t: (key: string) => string;
  setLocale: (locales: LocaleProps) => void;
};
