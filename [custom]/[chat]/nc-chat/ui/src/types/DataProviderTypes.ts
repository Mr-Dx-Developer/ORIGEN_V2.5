import {
  CommandProps,
  HotbarItemProps,
  MessageProps,
  PlayingSongProps,
  SuggestionProps,
  Text3DProps,
  TypeColorProps,
} from "./BasicTypes";

export type DataContextProps = {
  hotbarItems: HotbarItemProps[];
  messages: MessageProps[];
  notification: boolean;
  setNotification: React.Dispatch<React.SetStateAction<boolean>>;
  chatPosition: "left" | "right";
  setChatPosition: React.Dispatch<React.SetStateAction<"left" | "right">>;
  playingSong: PlayingSongProps;
  setPlayingSong: React.Dispatch<React.SetStateAction<PlayingSongProps>>;
  commandList: CommandProps[];
  defaultSuggestions: any;
  enableEmojiMenu: boolean;
  chatBoxVisible: boolean;
  setChatBoxVisible: React.Dispatch<React.SetStateAction<boolean>>;
  chatInputVisible: boolean;
  setChatInputVisible: React.Dispatch<React.SetStateAction<boolean>>;
  suggestions: SuggestionProps[];
  setSuggestions: React.Dispatch<React.SetStateAction<SuggestionProps[]>>;
  usedCommands: string[];
  setUsedCommands: React.Dispatch<React.SetStateAction<string[]>>;
  oocMessageWithoutCommand: boolean;
  activeHotbar: string;
  setActiveHotbar: React.Dispatch<React.SetStateAction<string>>;
  typeColors: TypeColorProps;
  updateTypeColor: (type: string, color: string) => void;
  customNameColor: string;
  customNameTag: string;
  updateCustomNameColor: (color: string) => void;
  updateCustomNameTag: (tag: string) => void;
  activeCustomNameTag: boolean;
  activeCustomNameColor: boolean;
  _3DTexts: Text3DProps[];
  meDoPP: string;
  setMeDoPP: React.Dispatch<React.SetStateAction<string>>;
  sleep: boolean;
  setSleep: React.Dispatch<React.SetStateAction<boolean>>;
};
