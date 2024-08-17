import classNames from "classnames";
import useData from "../../hooks/useData";
import { fetchNui } from "../../utils/fetchNui";
import { useEffect } from "react";
import { isEnvBrowser } from "../../utils/misc";

const BedControl: React.FC = () => {
  const { flatBedProgress, setFlatBedProgress } = useData();

  useEffect(() => {
    const keyHandler = (e: KeyboardEvent) => {
      if (["Escape"].includes(e.code)) {
        if (!isEnvBrowser()) {
          fetchNui("ui:setNuiFocus", false, true);
        }
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  }, []);

  const handleUp = () => {
    if (flatBedProgress) return;
    setFlatBedProgress("up");
    fetchNui("nui:toggleFlatBed", null, true);
  };
  const handleDown = () => {
    if (flatBedProgress) return;
    setFlatBedProgress("down");
    fetchNui("nui:toggleFlatBed", null, true);
  };

  return (
    <div className="absolute bottom-20 right-20 flex items-center justify-center">
      <div
        className="w-16 h-28 absolute bg-white/60"
        style={{
          clipPath:
            "polygon(50% 0, 100% 15%, 100% 85%, 50% 100%, 0 85%, 0 15%)",
        }}
      ></div>
      <div
        className="w-14 h-24 flex flex-col justify-center items-center gap-3 z-10 transition-all bg-4B/60 drop-shadow-md"
        style={{
          clipPath:
            "polygon(50% 0, 100% 15%, 100% 85%, 50% 100%, 0 85%, 0 15%)",
        }}
      >
        <button
          onClick={handleUp}
          className={classNames(
            "w-5 h-4 bg-white hover:bg-45FFBC drop-shadow-md",
            {
              "!bg-45FFBC": flatBedProgress === "up",
            }
          )}
          style={{
            clipPath: "polygon(50% 0%, 0% 100%, 100% 100%)",
          }}
        ></button>
        <button
          onClick={handleDown}
          className={classNames(
            "w-5 h-4 bg-white hover:bg-FF5A5A drop-shadow-md",
            {
              "!bg-FF5A5A": flatBedProgress === "down",
            }
          )}
          style={{
            clipPath: "polygon(100% 0, 0 0, 50% 100%)",
          }}
        ></button>
      </div>
      <div
        className={classNames(
          "absolute w-full px-1 h-6 -top-4 z-0 transition-all opacity-0",
          {
            "opacity-100": flatBedProgress == "up",
            invisible: flatBedProgress != "up",
          }
        )}
      >
        <img
          className="w-full h-full"
          src="images/vector_up.png"
          alt="vector_up"
        />
      </div>
      <div
        className={classNames(
          "absolute w-full px-1 h-6 -bottom-4 z-0 transition-all opacity-0",
          {
            "opacity-100": flatBedProgress == "down",
            invisible: flatBedProgress != "down",
          }
        )}
      >
        <img
          className="w-full h-full"
          src="images/vector_down.png"
          alt="vector_down"
        />
      </div>
    </div>
  );
};

export default BedControl;
