import { MessageProps } from "../../../types/BasicTypes";
import { GiGearHammer } from "react-icons/gi";
import { RiEmpathizeFill } from "react-icons/ri";

export const JobInfoMessage: React.FC<{ message: MessageProps }> = ({
  message,
}) => {
  const _jobs: any = {
    police: {
      radial:
        "linear-gradient(90deg, rgba(242,82,82,0.25) 0%, rgba(82,146,242,0.45) 100%)",
      border: "linear-gradient(182.68deg, #F25252 -13.1%, #5292F2 128.31%)",
    },
    ambulance: {
      radial:
        "radial-gradient(circle, rgba(91,43,43,0.45) 0%, rgba(242,82,82,0.4) 100%)",
      border: "#FD6767",
    },
    mechanic: {
      radial:
        "radial-gradient(circle, rgba(163,175,168,0.45) 0%, rgba(158,255,197,.4) 100%)",
      border: "#9EFFC5",
    },
  };

  return (
    <>
      <div className="flex gap-3 p-2 rounded-r-sm w-max relative bg-black/60 z-0">
        <div
          className="absolute w-full h-full top-0 left-0"
          style={{
            background: _jobs[message.job.name]?.radial,
          }}
        ></div>
        <div
          className="absolute left-0 top-0 h-full w-1"
          style={{
            background: _jobs[message.job.name]?.border,
          }}
        ></div>
        <div className="flex items-center justify-center h-8 w-8 bg-black/45 rounded-lg z-10">
          {message?.job?.name?.toLocaleLowerCase() == "police" ? (
            <img className="w-5 h-5" src="images/icons/police.svg"></img>
          ) : message?.job?.name?.toLocaleLowerCase() == "ambulance" ? (
            <img className="w-5 h-5" src="images/icons/ems.svg"></img>
          ) : message?.job?.name?.toLocaleLowerCase() == "mechanic" ? (
            <GiGearHammer className="w-5 h-5 text-[#9EFFC5]" />
          ) : (
            <RiEmpathizeFill className="w-5 h-5 text-white" />
          )}
        </div>
        <div className="flex flex-col flex-wrap items-start justify-center text-sm font-medium text-ellipsis whitespace-pre-wrap z-10 pr-2">
          <div className="w-full flex items-center gap-1">
            <div className="text-white uppercase">
              <h1>[{message?.job?.label}]</h1>
            </div>
            <div className="text-white/85 ml-auto text-xs">
              <h1>{message.time}</h1>
            </div>
          </div>
          <div className="max-w-[442px] -mt-1">
            <h1
              className="text-white text-xs text-ellipsis overflow-hidden"
              dangerouslySetInnerHTML={{ __html: message.content }}
            ></h1>
          </div>
        </div>
        <div
          className="absolute right-0 top-0 h-full w-1"
          style={{
            background: _jobs[message.job.name]?.border,
          }}
        ></div>
      </div>
    </>
  );
};
