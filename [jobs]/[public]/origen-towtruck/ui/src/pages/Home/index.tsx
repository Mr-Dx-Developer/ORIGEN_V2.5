import update from "immutability-helper";
import { XYCoord, useDrop } from "react-dnd";
import { useCallback, useEffect, useState } from "react";
import type { AppTypes, DragItem } from "../../types/BasicTypes";
import App_SC_ThrowTruck from "../../components/Apps/ShortCut/ThrowTruck";
import useData from "../../hooks/useData";
import AppTrowTuck from "../../components/Apps/Exe/AppTrowTuck";
import "./index.sass";
import classNames from "classnames";
import BoilerPlate from "../../components/Apps/BoilerPlate";
import { Panel } from "../../components/Panel";
import { useVisibility } from "../../hooks/useVisibility";
import { isEnvBrowser } from "../../utils/misc";
import { fetchNui } from "../../utils/fetchNui";

interface Item {
  id: string;
  left: number;
  top: number;
}

export const Home: React.FC = () => {
  const { visible, setVisible } = useVisibility();
  const { runningApp, isAppFullScreen } = useData();

  useEffect(() => {
    if (!visible) return;

    const keyHandler = (e: KeyboardEvent) => {
      if (["Escape"].includes(e.code)) {
        if (!isEnvBrowser()) {
          fetchNui("ui:hideFrame", null, true);
          setVisible(false);
        }
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  }, [visible, setVisible]);

  const [items, setItems] = useState<{ [key: string]: Item }>({
    ["app_1"]: {
      id: "app_1",
      left: 40,
      top: 80,
    },
  });

  const moveBox = useCallback(
    (id: string, left: number, top: number) => {
      setItems(
        update(items, {
          [id]: {
            $merge: { left, top },
          },
        })
      );
    },
    [items, setItems]
  );

  const [, drop] = useDrop(
    () => ({
      accept: "app-box",
      drop(item: DragItem, monitor) {
        const delta = monitor.getDifferenceFromInitialOffset() as XYCoord;
        const left = Math.round(item.left + delta.x);
        const top = Math.round(item.top + delta.y);
        moveBox(item.id, left, top);
        return undefined;
      },
    }),
    [moveBox]
  );

  const renderComponent = (key: string) => {
    const item = items[key];
    switch (key) {
      case "app_1":
        return (
          <App_SC_ThrowTruck
            key={key}
            id={key}
            left={item.left}
            top={item.top}
          />
        );
      default:
        return null;
    }
  };

  const renderApp = (app: AppTypes) => {
    switch (app) {
      case "towTruck":
        return <AppTrowTuck />;

      default:
        return null;
    }
  };

  return (
    <Panel>
      <div className="w-full h-full">
        <div ref={drop} className="w-full h-full" role="app-drop-box">
          {Object.keys(items).map((key) => renderComponent(key))}
        </div>
        {runningApp && (
          <div
            className={classNames(
              "absolute top-0 left-0 w-full h-full app-container fadeInScaleUp transition-[padding]",
              {
                hidden: !runningApp,
                "p-4": !isAppFullScreen,
              }
            )}
          >
            <div className="w-full h-full">
              <BoilerPlate>{renderApp(runningApp)}</BoilerPlate>
            </div>
          </div>
        )}
      </div>
    </Panel>
  );
};
