import React, { createContext, useState } from "react";
import { DataContextProps } from "../types/DataProviderTypes";
import { debugData } from "../utils/debugData";
import {
  AcceptableJobProps,
  AppTypes,
  CallsForHelpProps,
  JobSettingsProps,
  PlayerProfileProps,
  TopRankProps,
} from "../types/BasicTypes";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { fetchNui } from "../utils/fetchNui";

debugData<any>([
  {
    action: "nui:setPlayerProfile",
    data: {
      characterName: "Ali Koç",
      photo: "profile_1",
      level: 5,
      exp: 100,
      nextLeveLExp: 500,
      completedTasks: [] as number[],
    } as PlayerProfileProps,
  },
  {
    action: "nui:setTopRank",
    data: [
      {
        characterName: "Adez",
        photo: "profile_2",
        level: 1,
        exp: 2100,
        nextLeveLExp: 20000,
      },
      {
        characterName: "Tuna",
        photo: "profile_1",
        level: 2,
        exp: 2100,
      },
      {
        characterName: "Ahmet",
        photo: "profile_3",
        level: 3,
        exp: 3800,
      },
      {
        characterName: "Ali Koç",
        photo: "profile_4",
        level: 4,
        exp: 6100,
      },
      {
        characterName: "Veli",
        photo: "profile_5",
        level: 5,
        exp: 9500,
      },
      {
        characterName: "Deli",
        photo: "profile_6",
        level: 6,
        exp: 12500,
      },
      {
        characterName: "Semih",
        photo: "profile_7",
        level: 7,
        exp: 16000,
      },
    ] as TopRankProps[],
  },
  {
    action: "nui:addCallsForHelp",
    data: {
      helpId: 1,
      location: "Street. 245 SFG",
      coords: {},
    } as any,
  },
  {
    action: "nui:setJobSettings",
    data: {
      maxExp: 500,
      ranks: [0, 2100, 3800, 6100, 9500, 12500, 16000],
    } as JobSettingsProps,
  },
  {
    action: "nui:setCallsForHelp",
    data: {
      [1]: {
        id: 1,
        location: "Street. 245 SFG",
      },
    } as any,
  },
]);

export const DataCtx = createContext<DataContextProps>({} as DataContextProps);

export const DataProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [playerProfile, setPlayerProfile] = useState<PlayerProfileProps>(
    {} as PlayerProfileProps
  );
  const [jobSettings, setJobSettings] = useState<JobSettingsProps>(
    {} as JobSettingsProps
  );
  const [runningApp, setRunningApp] = useState<AppTypes>(null);
  const [isAppFullScreen, setAppFullScreen] = useState<boolean>(false);
  const [topRank, setTopRank] = useState<TopRankProps[]>([]);
  const [acceptableJobs, setAcceptableJobs] = useState<AcceptableJobProps[]>(
    []
  );
  const [CallsForHelp, setCallsForHelp] = useState<CallsForHelpProps[]>([]);
  const [flatBedProgress, setFlatBedProgress] = useState<"up" | "down" | null>(
    null
  );

  useNuiEvent("nui:addCallsForHelp", (data) => {
    setCallsForHelp([...CallsForHelp, data]);
  });
  useNuiEvent("nui:removeCallsForHelp", (data) => {
    setCallsForHelp((callsForHelp) =>
      callsForHelp.filter((call) => call.helpId !== data.helpId)
    );
  });

  useNuiEvent("nui:setFlatBedProgress", setFlatBedProgress);
  useNuiEvent("nui:setPlayerProfile", setPlayerProfile);
  useNuiEvent("nui:setTopRank", (data) => {
    const formattedData = Object.keys(data).map(
      (key) =>
        ({
          character: key,
          characterName: data[key].characterName,
          level: data[key].level,
          exp: data[key].exp,
          photo: data[key].photo,
        } as PlayerProfileProps)
    );
    const sortedData = formattedData.sort((a, b) => {
      if (a.level !== b.level) {
        return b.level - a.level;
      } else {
        return b.exp - a.exp;
      }
    });
    const top10 = sortedData.slice(0, 10);
    setTopRank(top10);
  });

  useNuiEvent("nui:setAcceptableJobs", (data) => {
    setAcceptableJobs(Object.values(data));
  });

  useNuiEvent("nui:setJobSettings", setJobSettings);

  const updatePlayerProfilePhoto = (newProfile: string) => {
    setPlayerProfile((p) => ({
      ...p,
      photo: newProfile,
    }));
    fetchNui("nui:updateProfilePhoto", newProfile);
  };

  const value = {
    runningApp,
    setRunningApp,
    isAppFullScreen,
    setAppFullScreen,
    playerProfile,
    updatePlayerProfilePhoto,
    topRank,
    acceptableJobs,
    jobSettings,
    flatBedProgress,
    setFlatBedProgress,
    CallsForHelp,
  };

  return <DataCtx.Provider value={value}>{children}</DataCtx.Provider>;
};
