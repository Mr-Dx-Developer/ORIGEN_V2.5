import React, { createContext, useEffect, useMemo, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { PageTypes, RouterProviderProps } from "../types/RouterProviderTypes";
import { Main } from "../pages/Main";
import { debugData } from "../utils/debugData";
import { Settings } from "../pages/Settings";

debugData([
  {
    action: "ui:setRouter",
    data: "settings",
  },
]);

export const RouterCtx = createContext<RouterProviderProps>(
  {} as RouterProviderProps
);

export const RouterProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [router, setRouter] = useState<PageTypes>("main");
  const [page, setPage] = useState<React.ReactNode | null>(null);

  useNuiEvent("ui:setRouter", setRouter);

  useEffect(() => {
    if (router == "main") setPage(<Main />);
    else if (router == "settings") setPage(<Settings />);
    else setPage(<Main />);
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
