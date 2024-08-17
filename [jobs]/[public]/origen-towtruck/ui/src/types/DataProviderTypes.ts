import {
  AcceptableJobProps,
  AppTypes,
  CallsForHelpProps,
  JobSettingsProps,
  PlayerProfileProps,
  TopRankProps,
} from "./BasicTypes";

export type DataContextProps = {
  runningApp: AppTypes;
  setRunningApp: React.Dispatch<React.SetStateAction<AppTypes>>;
  isAppFullScreen: boolean;
  setAppFullScreen: React.Dispatch<React.SetStateAction<boolean>>;
  playerProfile: PlayerProfileProps;
  updatePlayerProfilePhoto: (newProfile: string) => void;
  topRank: TopRankProps[];
  acceptableJobs: AcceptableJobProps[];
  jobSettings: JobSettingsProps;
  flatBedProgress: "up" | "down" | null;
  setFlatBedProgress: React.Dispatch<
    React.SetStateAction<"up" | "down" | null>
  >;
  CallsForHelp: CallsForHelpProps[];
};
