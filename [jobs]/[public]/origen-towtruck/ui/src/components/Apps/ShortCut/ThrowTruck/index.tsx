import React from "react";
import { DragPreviewImage, useDrag } from "react-dnd";
import useLocales from "../../../../hooks/useLocales";
import useData from "../../../../hooks/useData";

interface SCTrowTuckProps {
  id: string;
  top: number;
  left: number;
}

const App_SC_ThrowTruck: React.FC<SCTrowTuckProps> = ({ id, top, left }) => {
  const { locale } = useLocales();
  const { setRunningApp } = useData();

  const [{ isDragging }, drag, preview] = useDrag(
    () => ({
      type: "app-box",
      item: { id, left, top },
      collect: (monitor) => ({
        isDragging: !!monitor.isDragging(),
      }),
    }),
    [id, left, top]
  );

  const handleFakeClick = (e: React.MouseEvent<HTMLDivElement>) => {
    e.preventDefault();
    setRunningApp("towTruck");
  };

  return (
    <>
      <DragPreviewImage connect={preview} src="images/icons/app-icon.png" />
      <div
        onClick={handleFakeClick}
        className="flex flex-col items-center cursor-pointer"
        ref={drag}
        style={{
          position: "absolute",
          top,
          left,
          opacity: isDragging ? 0.5 : 1,
          width: "84px",
          height: "88px",
        }}
      >
        <div
          style={{
            width: "66px",
            height: "54px",
          }}
        >
          <img src="images/icons/app-icon.png" alt="app-icon" />
        </div>
        <div className="text-center mt-1">
          <h1
            className="text-white text-xs font-bold"
            style={{ textShadow: "0px 0px 1.6px rgba(0, 0, 0, 0.85)" }}
          >
            {locale.text_app_1}
          </h1>
        </div>
      </div>
    </>
  );
};

export default App_SC_ThrowTruck;
