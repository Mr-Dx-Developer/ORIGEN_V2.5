import { BsBank2 } from "react-icons/bs";
import { MessageProps } from "../../../types/BasicTypes";
import { FaMoneyBillWave } from "react-icons/fa";
import useLocales from "../../../hooks/useLocales";

export const BalanceInfoMessage: React.FC<{ message: MessageProps }> = ({
  message,
}) => {
  const { _t } = useLocales();

  return (
    <>
      <div className="flex gap-3 p-2 rounded-r-sm w-max relative bg-black/60 z-0 items-center">
        <div
          className="absolute w-full h-full top-0 left-0"
          style={{
            background:
              "radial-gradient(circle, rgba(178,218,194, .4) 0%, rgba(0,255,102, .4) 100%)",
          }}
        ></div>
        <div
          className="absolute left-0 top-0 h-full w-1"
          style={{
            background: "#00FF66",
          }}
        ></div>
        <div className="relative flex items-center justify-center h-8 w-8 bg-black/45 rounded-lg z-10">
          <img className="w-5 h-5" src="images/icons/dollar.svg"></img>
          <img
            className="w-10 h-10 absolute"
            src="images/icons/dollar-shadow.svg"
          ></img>
        </div>
        <div className="flex gap-2 items-center text-sm font-medium text-ellipsis whitespace-pre-wrap z-10 pr-2 w-full">
          <div className="text-[#00FF66] uppercase font-semibold whitespace-nowrap mr-2">
            <h1>
              [{_t("bank_balance")}] {message.header}
            </h1>
          </div>
          <div className="flex gap-2">
            <div className="flex items-center gap-1 bg-black/45 px-2 rounded text-white [text-shadow:_0_0_5px_var(--tw-shadow-color)] shadow-white/60">
              <BsBank2 className="w-3 h-3 text-[#00FF66]" />
              <h1 className="font-semibold">{message?.balance?.bank}$</h1>
            </div>
            <div className="flex items-center gap-1 bg-black/45 px-2 rounded text-white [text-shadow:_0_0_5px_var(--tw-shadow-color)] shadow-white/60">
              <FaMoneyBillWave className="w-3 h-3 text-[#00FF66]" />
              <h1 className="font-medium">{message?.balance?.money}$</h1>
            </div>
          </div>
          <div className="text-white/85 ml-auto text-xs">
            <h1>{message.time}</h1>
          </div>
        </div>
        <div
          className="absolute right-0 top-0 h-full w-1"
          style={{
            background: "#00FF66",
          }}
        ></div>
      </div>
    </>
  );
};
