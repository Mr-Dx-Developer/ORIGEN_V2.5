import {
  FaDice,
  FaHandRock,
  FaHandPaper,
  FaHandScissors,
} from "react-icons/fa";

import classNames from "classnames";
import useData from "../../hooks/useData";
import useLocales from "../../hooks/useLocales";

export const ThreeDTexts: React.FC = () => {
  const { _3DTexts } = useData();
  const { _t } = useLocales();

  return (
    <>
      <div className="3d">
        {_3DTexts.map((item, i) => (
          <div key={i}>
            {item.type == "roll-the-dice" ? (
              <div
                className="absolute w-[64px] h-[64px] flex flex-col items-center justify-center rounded-xl border-2"
                style={{
                  left: item.screenX - 2 + "%",
                  top: item.screenY - 2.5 + "%",
                  background:
                    "linear-gradient(45deg, rgba(242,97,123,0.65) 0%, rgba(237,157,171,0.65) 50%, rgba(242,97,123,0.65) 100%)",
                }}
              >
                <FaDice className="w-6 h-6 text-white" />
                <h1 className="text-white font-semibold">{item?.diceValue}</h1>
              </div>
            ) : item.type == "rps" ? (
              <div
                className="absolute min-w-[64px] min-h-[64px] flex flex-col items-center justify-center rounded-xl border-2"
                style={{
                  left: item.screenX - 2 + "%",
                  top: item.screenY - 2.5 + "%",
                  background:
                    "linear-gradient(45deg, rgba(97,164,242,0.65) 0%, rgba(191,217,246,0.65) 50%, rgba(97,164,242,0.65) 100%)",
                }}
              >
                {item?.rpsValue == "rock" && (
                  <FaHandRock className="w-6 h-6 text-white" />
                )}
                {item?.rpsValue == "paper" && (
                  <FaHandPaper className="w-6 h-6 text-white" />
                )}
                {item?.rpsValue == "scissors" && (
                  <FaHandScissors className="w-6 h-6 text-white" />
                )}
                <h1 className="text-white font-semibold px-1 text-sm">
                  {item?.rpsValue == "rock" && _t("rps_rock")}
                  {item?.rpsValue == "paper" && _t("rps_paper")}
                  {item?.rpsValue == "scissors" && _t("rps_scissors")}
                </h1>
              </div>
            ) : (
              <div
                className="absolute w-[252px] min-h-[40px] flex items-center justify-center rounded rounded-bl-none border border-b-0"
                style={{
                  left: item.screenX + "%",
                  top: item.screenY + "%",
                  borderColor:
                    item.type == "do"
                      ? "rgba(242,97,123,0.65)"
                      : "rgba(97,164,242,0.65)",
                  background:
                    item.type == "do"
                      ? "linear-gradient(45deg, rgba(242,97,123,0.65) 0%, rgba(237,157,171,0.65) 50%, rgba(242,97,123,0.65) 100%)"
                      : "linear-gradient(45deg, rgba(97,164,242,0.65) 0%, rgba(191,217,246,0.65) 50%, rgba(97,164,242,0.65) 100%)",
                }}
              >
                <div className="p-1.5 text-wrap overflow-hidden text-ellipsis max-h-[148px] z-50">
                  <h1 className="text-xs text-center overflow-hidden text-ellipsis font-medium text-white px-2">
                    {item.text}
                  </h1>
                </div>
                <div
                  className={classNames(
                    "p-0.5 rounded text-sm text-white absolute -bottom-2 -right-2 z-10 shadow border",
                    {
                      "bg-[#F2617B] shadow-[#f2617b] border-[#f2617b]/40":
                        item.type == "do",
                      "bg-[#61A4F2] shadow-[#61a4f2] border-[#61a4f2]/40":
                        item.type == "me",
                    }
                  )}
                >
                  <h1 className="text-xs font-medium">
                    {item.type.toUpperCase()}
                  </h1>
                </div>
                <div
                  className="absolute top-full -left-[5px] w-4 h-3"
                  style={{
                    clipPath:
                      "polygon(100% 0%, 34% 75%, 0 100%, 10% 55%, 25% 0)",
                    background:
                      item.type == "do"
                        ? "rgba(242,97,123,0.65)"
                        : "rgba(97,164,242,0.65)",
                  }}
                ></div>
                <div
                  className="absolute w-8 h-8 rounded-md -top-4 -left-4"
                  style={{
                    background:
                      item.type == "do"
                        ? "rgba(242,97,123,0.90)"
                        : "rgba(97,164,242,0.90 )",
                  }}
                >
                  <img
                    className="w-full h-full rounded-md"
                    src={
                      item.meDoPP && item?.meDoPP?.length > 0
                        ? item?.meDoPP
                        : `images/itachi_${item.type}.png`
                    }
                    alt="itachi"
                  />
                </div>
              </div>
            )}
          </div>
        ))}
      </div>
    </>
  );
};
