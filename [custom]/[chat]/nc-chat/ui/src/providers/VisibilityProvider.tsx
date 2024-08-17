import React, { createContext, useMemo, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { debugData } from "../utils/debugData";
import classNames from "classnames";
import { isEnvBrowser } from "../utils/misc";

debugData([
  {
    action: "ui:setVisible",
    data: true,
  },
]);

export interface VisibilityProviderValue {
  setVisible: (visible: boolean) => void;
  visible: boolean;
}

export const VisibilityCtx = createContext<VisibilityProviderValue>(
  {} as VisibilityProviderValue
);

export const VisibilityProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [visible, setVisible] = useState(false);

  useNuiEvent<boolean>("ui:setVisible", setVisible);

  const value = useMemo(() => {
    return {
      visible,
      setVisible,
    };
  }, [visible]);

  return (
    <VisibilityCtx.Provider value={value}>
      <main
        style={{ visibility: visible ? "visible" : "hidden" }}
        className={classNames({ "bg-black/40": isEnvBrowser() })}
      >
        {children}
      </main>
    </VisibilityCtx.Provider>
  );
};
