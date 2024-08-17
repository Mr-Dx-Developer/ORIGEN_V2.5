import React, { createContext, useEffect, useState } from "react";
import { DataContextProps } from "../types/DataProviderTypes";
import { debugData } from "../utils/debugData";
import { useNuiEvent } from "../hooks/useNuiEvent";
import {
  HotbarItemProps,
  MessageProps,
  PlayingSongProps,
  SuggestionProps,
  CommandProps,
  TypeColorProps,
  Text3DProps,
} from "../types/BasicTypes";
import { getFormattedDate, isEnvBrowser, parseText } from "../utils/misc";
import { fetchNui } from "../utils/fetchNui";

debugData<any>([
  {
    action: "ui:UpdateChatSettings",
    data: {
      defaultSuggestions: [
        {
          name: "test",
          description: "Test",
        } as SuggestionProps,
      ],
      customNameTag: true,
      customNameColor: true,
    },
  },
  {
    action: "ui:setTypeColors",
    data: {
      ["me"]: {
        color: "#fff",
        background: "#F2617B",
      },
      ["do"]: {
        color: "#fff",
        background: "#9861F2",
      },
      ["ooc"]: {
        color: "#fff",
        background: "#8AB1AA",
      },
    },
  },
  {
    action: "ui:setHotbarItems",
    data: [
      {
        command: "ooc",
        label: "OOC",
      },
      {
        command: "me",
        label: "ME",
      },
      {
        command: "do",
        label: "DO",
      },
      {
        command: "cd",
        label: "CD",
      },
    ] as HotbarItemProps[],
  },
]);
debugData<any>(
  [
    {
      action: "ui:setMessages",
      data: [
        {
          borderColor: "#00C2FF",
          color: "#fff",
          header: "Mechanic",
          time: getFormattedDate(),
          type: "JOB",
          sourceId: 52,
          channel: "mec",
          args: ["Ali Koç, your job is: Mechanic - Sheriff"],
          content: "",
          specialMessage: "job",
          job: {
            name: "mechanic",
            label: "Mechanic",
          },
        } as MessageProps,
        {
          borderColor: "",
          color: "",
          header: "Ali Koç",
          time: getFormattedDate(),
          type: "BALANCE",
          sourceId: -1,
          channel: "",
          args: ["Bank Balance"],
          content: "",
          specialMessage: "balance",
          balance: {
            bank: 10000,
            money: 5000,
          },
        } as MessageProps,
      ],
    },
    {
      action: "ui:setPlayingSong",
      data: {
        active: true,
        title: "Ya da benide yanına al da kal",
      } as PlayingSongProps,
    },
    {
      action: "ui:showChat",
      data: null,
    },
    {
      action: "ui:Show3DText",
      data: {
        screenX: 83,
        screenY: 15,
        source: 1,
        text: "",
        type: "rps",
        rpsValue: "paper",
      } as Text3DProps,
    },
    {
      action: "ui:Show3DText",
      data: {
        screenX: 83,
        screenY: 25,
        source: 2,
        text: "",
        type: "roll-the-dice",
        diceValue: 8,
      } as Text3DProps,
    },
  ],
  2000
);

export const DataCtx = createContext<DataContextProps>({} as DataContextProps);

export const DataProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [activeHotbar, setActiveHotbar] = useState<string>("");
  const [hotbarItems, setHotbarItems] = useState<HotbarItemProps[]>([]);
  const [messages, setMessages] = useState<MessageProps[]>([]);
  const [notification, setNotification] = useState<boolean>(true);
  const [chatPosition, setChatPosition] = useState<"right" | "left">("left");
  const [playingSong, setPlayingSong] = useState<PlayingSongProps>(
    {} as PlayingSongProps
  );
  const [commandList, setCommandList] = useState<CommandProps[]>([]);
  const [defaultSuggestions, setDefaultSuggestions] = useState([]);
  const [suggestions, setSuggestions] = useState<SuggestionProps[]>([]);
  const [oocMessageWithoutCommand, setOOCMessageWithoutCommand] =
    useState<boolean>(true);
  const [enableEmojiMenu, setEnableEmojiMenu] = useState<boolean>(true);
  const [chatBoxVisible, setChatBoxVisible] = useState<boolean>(false);
  const [chatInputVisible, setChatInputVisible] = useState<boolean>(false);
  const [usedCommands, setUsedCommands] = useState<string[]>([]);
  const [typeColors, setTypeColors] = useState<TypeColorProps>(
    {} as TypeColorProps
  );
  const [customNameColor, setCustomNameColor] = useState<string>("#fff");
  const [customNameTag, setCustomNameTag] = useState<string>("");
  const [sleep, setSleep] = useState<boolean>(false);
  const [activeCustomNameColor, setActiveCustomNameColor] = useState(false);
  const [activeCustomNameTag, setActiveCustomNameTag] = useState(false);
  const [_3DTexts, set3DTexts] = useState<Text3DProps[]>([]);
  const [meDoPP, setMeDoPP] = useState<string>("");

  useNuiEvent("ui:setHotbarItems", setHotbarItems);
  useNuiEvent("ui:setMessages", (elements) => {
    elements.forEach((data: any) => {
      const msg: any = data?.args?.join(" ").trim();
      if (msg?.length >= 1) {
        if (msg.startsWith("^1")) {
          data = {
            type: data.type || "SYSTEM",
            typeColor: "#de4949",
            header: "ERROR",
            args: [msg.replaceAll("^1", "").replace("^0", "")],
            time: getFormattedDate(),
          };
        }
        const _borderColor =
          typeColors[data?.type.toLowerCase()]?.background || data.borderColor;
        setMessages((prevMessages) => [
          ...prevMessages,
          {
            ...data,
            borderColor: _borderColor || "#F25252",
            color: data.color || "rgba(255,255,255,0.6)",
            content: parseText(msg || data?.content),
            type: data?.type || "O",
          },
        ]);
        if (notification) {
          setChatBoxVisible(true);
        }
      }
    });
  });
  useNuiEvent("ui:setPlayingSong", setPlayingSong);
  useNuiEvent("ui:setTypeColors", setTypeColors);

  useNuiEvent("ui:UpdateChatSettings", (data) => {
    data?.commandList && setCommandList(data?.commandList);
    data?.defaultSuggestions && setDefaultSuggestions(data?.defaultSuggestions);
    typeof data?.enableEmojiMenu == "boolean" &&
      setEnableEmojiMenu(data?.enableEmojiMenu);
    typeof data?.oocMessageWithoutCommand == "boolean" &&
      setOOCMessageWithoutCommand(data?.oocMessageWithoutCommand);
    data?.hotBarSuggestions && setHotbarItems(data?.hotBarSuggestions);
    data?.typeColors && setTypeColors(data?.typeColors);
    typeof data?.customNameColor == "boolean" &&
      setActiveCustomNameColor(data?.customNameColor);
    typeof data?.customNameTag == "boolean" &&
      setActiveCustomNameTag(data?.customNameTag);
  });

  useNuiEvent("ui:addMessage", (data) => {
    const msg: any = data?.message?.args?.join(" ").trim();
    if (msg?.length >= 1) {
      if (msg.startsWith("^1")) {
        data.message = {
          type: data.message.type || "SYSTEM",
          typeColor: "#de4949",
          header: "ERROR",
          args: [msg.replaceAll("^1", "").replace("^0", "")],
          time: getFormattedDate(),
        };
      }
      const _borderColor =
        typeColors[data?.message?.type?.toLowerCase()]?.background ||
        data?.message?.borderColor;
      setMessages((prevMessages) => [
        ...prevMessages,
        {
          ...data.message,
          header: data?.message?.header || "SYSTEM",
          borderColor: _borderColor || "#F25252",
          color: data?.message?.color || "rgba(255,255,255,0.6)",
          content: parseText(msg || data?.message?.content),
          type: data?.message?.type || "S",
          time: getFormattedDate(),
        },
      ]);
      if (notification) {
        setChatBoxVisible(true);
      }
    }
  });

  useNuiEvent("ui:showChat", () => {
    setChatInputVisible(true);
    setChatBoxVisible(true);
  });

  useNuiEvent("ui:hideChat", () => {
    setChatInputVisible(false);
    setChatBoxVisible(false);
  });

  useNuiEvent("ui:addSuggestion", (data) => {
    const newSuggestion = {
      name: data.command,
      description: data.description,
      args: data.args,
    };
    setSuggestions((p) => [...p, newSuggestion]);
  });

  useNuiEvent("ui:clear", () => {
    setMessages([]);
  });

  useNuiEvent("ui:setSongInfo", async (data) => {
    if (data.off) {
      setPlayingSong((p) => ({
        ...p,
        active: false,
      }));
      return;
    }
    const response = await fetch(
      `https://noembed.com/embed?format=json&url=${data.url}`
    );
    const result = await response.json();
    setPlayingSong({
      active: true,
      title: result?.title || "Music not found...",
    });
  });

  useNuiEvent("ui:Show3DText", (data) => {
    set3DTexts((prevTexts) => {
      const updatedTexts = [...prevTexts];
      const index = updatedTexts.findIndex(
        (item) => item.source === data.source
      );
      if (index !== -1) {
        if (data.remove) {
          updatedTexts.splice(index, 1);
        } else {
          updatedTexts[index] = {
            ...updatedTexts[index],
            ...updatedTexts[index]?.extra,
            screenX: data.screenX,
            screenY: data.screenY,
            text: data.text?.trim(),
            type: data.type,
          };
        }
      } else {
        if (!data.remove) {
          updatedTexts.push({
            ...data?.extra,
            source: data.source,
            screenX: data.screenX,
            screenY: data.screenY,
            text: data.text?.trim(),
            type: data.type,
            meDoPP: data.meDoPP,
          });
        }
      }
      return updatedTexts;
    });
  });

  useEffect(() => {
    if (!chatBoxVisible || isEnvBrowser()) return;
    let _timer: number | undefined = undefined;
    _timer = setTimeout(() => {
      if (!chatInputVisible) {
        setChatBoxVisible(false);
      }
    }, 3000);

    return () => {
      clearTimeout(_timer);
    };
  }, [chatBoxVisible, chatInputVisible]);

  useEffect(() => {
    if (sleep) {
      const timeOutId = setTimeout(() => {
        setSleep(false);
      }, 2500);
      return () => clearTimeout(timeOutId);
    }
  }, [sleep]);

  useEffect(() => {
    fetchNui("nui:updateMeDoPP", meDoPP);
  }, [meDoPP]);

  const updateTypeColor = (type: string, color: string) => {
    setTypeColors((prevTypeColors) => {
      const updatedTypeColors = { ...prevTypeColors };
      if (updatedTypeColors[type]) {
        updatedTypeColors[type].background = color;
      }
      return updatedTypeColors;
    });
  };

  const updateCustomNameColor = (color: string) => {
    setCustomNameColor(color.toUpperCase());
    fetchNui("nui:updateNameColor", color.toUpperCase());
  };
  const updateCustomNameTag = (tag: string) => {
    setCustomNameTag(tag.toUpperCase());
    const _tag = tag.length > 0 ? `[${tag.toUpperCase()}]` : "";
    fetchNui("nui:updateNameTag", _tag);
  };

  const value = {
    hotbarItems,
    messages,
    notification,
    setNotification,
    chatPosition,
    setChatPosition,
    playingSong,
    setPlayingSong,
    commandList,
    defaultSuggestions,
    enableEmojiMenu,
    chatBoxVisible,
    setChatBoxVisible,
    chatInputVisible,
    setChatInputVisible,
    suggestions,
    setSuggestions,
    usedCommands,
    setUsedCommands,
    oocMessageWithoutCommand,
    activeHotbar,
    setActiveHotbar,
    typeColors,
    updateTypeColor,
    customNameColor,
    customNameTag,
    updateCustomNameColor,
    updateCustomNameTag,
    activeCustomNameColor,
    activeCustomNameTag,
    _3DTexts,
    meDoPP,
    setMeDoPP,
    sleep,
    setSleep,
  };

  return <DataCtx.Provider value={value}>{children}</DataCtx.Provider>;
};
