import { useState } from "react";
import useData from "../../../../../hooks/useData";
import useLocales from "../../../../../hooks/useLocales";
import {
  AcceptableJobProps,
  CallsForHelpProps,
} from "../../../../../types/BasicTypes";
import { fetchNui } from "../../../../../utils/fetchNui";
import { formatNumberWithComma } from "../../../../../utils/misc";
import { PiUser } from "react-icons/pi";

export const Home: React.FC = () => {
  const { locale } = useLocales();
  const { acceptableJobs, jobSettings, playerProfile, CallsForHelp } =
    useData();
  const [isReady, setIsReady] = useState<boolean>(true);

  const handleStartJob = (value: AcceptableJobProps) => {
    if (!isReady) return;
    setIsReady(false);
    fetchNui("nui:StartNewJob", value);
    setTimeout(() => {
      setIsReady(true);
    }, 1000);
  };

  const handleCallHelp = (value: CallsForHelpProps) => {
    if (!isReady) return;
    setIsReady(false);
    fetchNui("nui:confirmHelpRequest", value, true);
    setTimeout(() => {
      setIsReady(true);
    }, 1000);
  };

  return (
    <>
      <div className="w-full h-full flex flex-col">
        <div className="flex-shrink-0 w-full bg-white/[0.09] rounded-t-lg py-3">
          <div className="flex">
            <h1 className="font-medium text-xs pl-2.5">
              {locale.home_text_home}
            </h1>
            <h1 className="font-medium text-xs pl-20">
              {locale.home_text_location}
            </h1>
            <h1 className="font-medium text-xs pl-12">
              {locale.home_text_regards}
            </h1>
            <h1 className="font-medium text-xs pl-28">
              {locale.home_text_rep}
            </h1>
            <h1 className="font-medium text-xs px-10 ml-auto">
              {locale.home_text_gps}
            </h1>
          </div>
        </div>
        <div className="w-full rounded-b-lg bg-white/[0.04] p-3 overflow-auto h-full">
          <div className="w-full flex flex-col gap-3 overflow-auto">
            {CallsForHelp.map((value, index) => {
              return (
                <div
                  key={index}
                  className="h-[52px] rounded-[3px] bg-white/[0.12] flex overflow-auto scrollbar-hide"
                >
                  <div className="relative min-w-[52px] min-h-[52px] flex items-center justify-center">
                    <img
                      className="rounded-l-[3px] w-full h-full opacity-40"
                      src="images/gtav_atlas.png"
                      alt="gtav_atlas"
                    />
                    <PiUser className="w-8 h-8 absolute text-fea71c/80" />
                  </div>
                  <div className="px-4 flex items-center h-full min-w-[150px] max-w-[150px]">
                    <img
                      src="images/icons/location_car.svg"
                      alt="location_car"
                    />
                    <span className="px-2 font-semibold text-xs text-white whitespace-nowrap overflow-auto scrollbar-hide">
                      {value.location}
                    </span>
                  </div>
                  <div className="h-full min-w-[140px] flex items-center select-none">
                    <div className="h-8 w-full flex-shrink-0 rounded-sm border border-fea71c bg-fea71c/10 flex justify-center items-center">
                      <h1 className="font-semibold text-fea71c text-xs">
                        {locale.text_person} - {value.helpId}
                      </h1>
                    </div>
                  </div>
                  <div className="px-4 h-full w-full flex items-center">
                    <div className="h-8 w-full flex-shrink-0 rounded-sm border border-7C bg-white/10 flex items-center justify-center px-4">
                      <div className="relative w-full">
                        <div className="w-full rounded-sm h-[6px] bg-43"></div>
                        <div
                          className="absolute top-0 bg-fea71c h-[6px] rounded-sm"
                          style={{
                            width: "100%",
                          }}
                        ></div>
                      </div>
                    </div>
                  </div>
                  <div className="h-full min-w-[43px] flex items-center mr-3 ml-auto">
                    <div
                      onClick={() => handleCallHelp(value)}
                      className="cursor-pointer h-8 w-full flex-shrink-0 rounded-sm border-2 border-fea71c bg-fea71c/25 hover:bg-fea71c/40 flex items-center justify-center"
                    >
                      <img
                        src="images/icons/nav_arrow_yll.svg"
                        alt="nav_arrow"
                      />
                    </div>
                  </div>
                </div>
              );
            })}
            {acceptableJobs.map((value, index) => {
              return (
                !playerProfile.completedTasks[value.id] && (
                  <div
                    key={index}
                    className="h-[52px] rounded-[3px] bg-white/[0.12] flex overflow-auto scrollbar-hide"
                  >
                    <div className="min-w-[52px] min-h-[52px]">
                      <img
                        className="rounded-l-[3px] w-full h-full"
                        src="images/gtav_atlas.png"
                        alt="gtav_atlas"
                      />
                    </div>
                    <div className="px-4 flex items-center h-full min-w-[150px] max-w-[150px]">
                      <img
                        src="images/icons/location_car.svg"
                        alt="location_car"
                      />
                      <span className="px-2 font-semibold text-xs text-white whitespace-nowrap overflow-auto scrollbar-hide">
                        {value.location}
                      </span>
                    </div>
                    <div className="h-full min-w-[140px] flex items-center select-none">
                      <div className="h-8 w-full flex-shrink-0 rounded-sm border border-7B bg-7B/10 flex items-center justify-center">
                        <h1 className="font-semibold text-7B text-xs">
                          {locale.text_money_type}
                          {formatNumberWithComma(value.reward)}
                          {"~"}
                          {formatNumberWithComma(value.reward * 3)}
                        </h1>
                      </div>
                    </div>
                    <div className="px-4 h-full w-full flex items-center">
                      <div className="h-8 w-full flex-shrink-0 rounded-sm border border-7C bg-white/10 flex items-center justify-center px-4">
                        <div className="relative w-full">
                          <div className="w-full rounded-sm h-[6px] bg-43"></div>
                          <div
                            title={value.exp.toString()}
                            className="absolute top-0 bg-white h-[6px] rounded-sm"
                            style={{
                              width:
                                (value.exp /
                                  (jobSettings.maxExp > value.exp
                                    ? jobSettings.maxExp
                                    : value.exp)) *
                                  100 +
                                "%",
                            }}
                          ></div>
                        </div>
                      </div>
                    </div>
                    <div className="h-full min-w-[43px] flex items-center mr-3 ml-auto">
                      <div
                        onClick={() => handleStartJob(value)}
                        className="cursor-pointer h-8 w-full flex-shrink-0 rounded-sm border-2 border-7B bg-7B/25 hover:bg-7B/40 flex items-center justify-center"
                      >
                        <img src="images/icons/nav_arrow.svg" alt="nav_arrow" />
                      </div>
                    </div>
                  </div>
                )
              );
            })}
          </div>
        </div>
      </div>
    </>
  );
};
