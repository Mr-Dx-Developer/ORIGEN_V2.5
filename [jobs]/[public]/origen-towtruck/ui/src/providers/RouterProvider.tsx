import React, { createContext, useEffect, useMemo, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { PageTypes, RouterProviderProps } from "../types/RouterProviderTypes";
import { Home } from "../pages/Home";
import BedControl from "../pages/BedControl";
import { debugData } from "../utils/debugData";

debugData([
  {
    action: "nui:setRouter",
    data: "flatbed_control",
  },
]);

export const RouterCtx = createContext<RouterProviderProps>(
  {} as RouterProviderProps
);

export const RouterProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [router, setRouter] = useState<PageTypes>("home");
  const [page, setPage] = useState<React.ReactNode | null>(null);

  useNuiEvent("nui:setRouter", setRouter);

  useEffect(() => {
    if (router == "home") setPage(<Home />);
    if (router == "flatbed_control") setPage(<BedControl />);
  }, [router]);

  const value = useMemo(() => {
    return {
      router,
      setRouter,
      page,
    };
  }, [router, page]);

  return <RouterCtx.Provider value={value}>{children}</RouterCtx.Provider>;
};

export default RouterProvider;
