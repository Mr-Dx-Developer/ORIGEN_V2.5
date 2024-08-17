import React, { createContext, useMemo, useState } from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { debugData } from "../utils/debugData";
import classNames from "classnames";

debugData([
  {
    action: "nui:setVisible",
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

  useNuiEvent<boolean>("nui:setVisible", setVisible);

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
        className={classNames("w-full h-screen")}
      >
        {children}
      </main>
    </VisibilityCtx.Provider>
  );
};
