import { createContext, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { debugData } from "../utils/debugData";
import { LocaleContextProps, LocaleProps } from "../types/LocaleProviderTypes";

debugData<LocaleProps>([
  {
    action: "nui:setLocale",
    data: {
      text_app_1: "Tow Truck App",
      text_search: "Search",
      text_towtruck: "TowTruck",
      text_file: "File",
      text_order: "Order",
      text_image: "Image",
      text_history: "History",
      text_place_marks: "Place Marks",
      text_screen: "Screen",
      text_help: "Help",
      text_total_reputation: "Total Reputation",
      text_level: "Level",
      text_reputation: "Reputation",
      text_towtruck_about: "TowTruck About",
      text_victor_goods: "Victor Goods",
      text_towtruck_description:
        "Reliable and Fast TowTruck Service: Always by your side for your vehicle needs. Stay safe with our professional solutions, continue your journey with confidence.",
      home_text_home: "Home",
      home_text_location: "Location",
      home_text_regards: "Regards",
      home_text_exp: "Exp",
      home_text_gps: "GPS",
      text_money_type: "$",
      rank_text_avatar: "Avatar",
      rank_text_name: "Name",
      rank_text_level: "Level",
      rank_text_exp: "Exp",
      text_person: "Person",
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

  useNuiEvent("nui:setLocale", async (data: LocaleProps) => setLocale(data));

  const value = {
    locale,
    setLocale,
  };

  return <LocaleCtx.Provider value={value}>{children}</LocaleCtx.Provider>;
};

export default LocaleProvider;
