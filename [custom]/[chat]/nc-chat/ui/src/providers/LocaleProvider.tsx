import { createContext, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { debugData } from "../utils/debugData";
import { LocaleContextProps, LocaleProps } from "../types/LocaleProviderTypes";

debugData<LocaleProps>([
  {
    action: "ui:setLocale",
    data: {
      chat_input_placeholder: "Enter message...",
      hotbar_item_global: "Global",
      spofi_now_playing: "Now Playing",
      chat_position_desc: "Chat Position - Right",
      name_color: "Name",
      name_tag: "Tag",
      bank_balance: "Balance",
      setting_notif: "Notification",
      rp_text_pp_desc: "Me/Do Profile Photo",
      rps_rock: "Rock",
      rps_paper: "Paper",
      rps_scissors: "Scissors",
    },
  },
]);

export const LocaleCtx = createContext<LocaleContextProps>(
  {} as LocaleContextProps
);

export const LocaleProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [locale, setLocale] = useState<LocaleProps>({} as LocaleProps);

  useNuiEvent("ui:setLocale", async (data: LocaleProps) => setLocale(data));

  const _t = (key: string) => {
    return locale[key] || key;
  };

  const value = {
    _t,
    setLocale,
  };

  return <LocaleCtx.Provider value={value}>{children}</LocaleCtx.Provider>;
};

export default LocaleProvider;
