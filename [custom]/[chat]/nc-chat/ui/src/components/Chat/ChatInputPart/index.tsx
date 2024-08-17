import { FaGear } from "react-icons/fa6";
import { FaDice } from "react-icons/fa";
import { LiaHandScissors } from "react-icons/lia";

import { RiEmojiStickerFill } from "react-icons/ri";
import { HotBar } from "../HotBar";
import useLocales from "../../../hooks/useLocales";
import { EmojiMenu } from "../EmojiMenu";
import { useEffect, useRef, useState } from "react";
import useData from "../../../hooks/useData";
import useRouter from "../../../hooks/useRouter";
import { fetchNui } from "../../../utils/fetchNui";
import { Suggestions } from "../Suggestions";
import classNames from "classnames";

export const ChatInputPart: React.FC = () => {
  const { setRouter } = useRouter();
  const {
    enableEmojiMenu,
    oocMessageWithoutCommand,
    usedCommands,
    setUsedCommands,
    setChatInputVisible,
    chatInputVisible,
    activeHotbar,
    sleep,
    setSleep,
  } = useData();
  const { _t } = useLocales();

  const [emojiMenuVisible, setEmojiMenuVisible] = useState<boolean>(false);
  const chatInputRef = useRef<HTMLInputElement>(null);
  const emojiButtonRef = useRef<HTMLButtonElement>(null);
  const emojiMenuRef = useRef<HTMLDivElement>(null);
  const [inputValue, setInputValue] = useState<string>("");
  const [showingUsedCommand, setShowingUsedCommand] = useState<number>(0);

  const handleEmojiButtonClick = (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    event.preventDefault();
    setEmojiMenuVisible(!emojiMenuVisible);
  };

  const handleEmojiClick = (
    event: React.MouseEvent<HTMLButtonElement>,
    emoji: string
  ) => {
    event.preventDefault();
    setInputValue(inputValue + emoji);
    chatInputRef.current?.focus();
  };
  const handleHotbarClick = (
    event: React.MouseEvent<HTMLButtonElement>,
    command: string
  ) => {
    event.preventDefault();
    setInputValue(command);
    chatInputRef.current?.focus();
  };

  const handleInputChange = (event: React.FormEvent<HTMLInputElement>) => {
    setInputValue(event.currentTarget.value);
  };

  const handleSettingsButtonClick = () => {
    setRouter("settings");
    fetchNui("nui:setNuiFocus", true);
  };

  const handleKeyPress = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === "Enter") {
      const command = inputValue.trim();
      if (
        !command.startsWith("/") &&
        inputValue.length >= 1 &&
        oocMessageWithoutCommand
      ) {
        fetchNui("nui:processInput", `ooc ${inputValue}`);
        setUsedCommands((p) => [...p, inputValue]);
        setChatInputVisible(false);
        fetchNui("nui:setNuiFocus", false);
        setInputValue("");
        return;
      }
      if (inputValue.slice(1).length == 0 || !inputValue.startsWith("/"))
        return;
      fetchNui("nui:processInput", inputValue.slice(1));
      setUsedCommands((p) => [...p, `/${inputValue.slice(1)}`]);
      setChatInputVisible(false);
      fetchNui("nui:setNuiFocus", false);
      setInputValue("");
    } else if (event.key === "ArrowUp" || event.key === "ArrowDown") {
      event.preventDefault();
      if (usedCommands.length > 0) {
        let newIndex;
        if (event.key === "ArrowUp") {
          newIndex = showingUsedCommand - 1;
          if (newIndex < 0) newIndex = usedCommands.length - 1;
        } else {
          newIndex = showingUsedCommand + 1;
          if (newIndex >= usedCommands.length) newIndex = 0;
        }
        setShowingUsedCommand(newIndex);
        const _value = usedCommands[newIndex];
        if (_value && chatInputRef && chatInputRef.current) {
          setInputValue(_value);
          chatInputRef.current.focus();
        }
      }
    }
  };

  const handleDiceButtonClick = (
    event: React.MouseEvent<HTMLButtonElement>
  ) => {
    if (sleep) return;
    event.preventDefault();
    fetchNui("nui:RollTheDice");
    setSleep(true);
  };
  const handleRPSButtonClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    if (sleep) return;
    event.preventDefault();
    fetchNui("nui:RPS");
    setSleep(true);
  };

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (
        emojiMenuRef.current &&
        !emojiMenuRef.current.contains(event.target as Node) &&
        emojiButtonRef.current &&
        !emojiButtonRef.current.contains(event.target as Node)
      ) {
        setEmojiMenuVisible(false);
      }
    }
    function handleKeyPress(event: KeyboardEvent) {
      if (event.key === "Escape") {
        setEmojiMenuVisible(false);
      }
    }
    if (emojiMenuVisible) {
      document.addEventListener("mousedown", handleClickOutside);
      document.addEventListener("keydown", handleKeyPress);
    }
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
      document.removeEventListener("keydown", handleKeyPress);
    };
  }, [emojiMenuVisible]);

  useEffect(() => {
    function handleKeyPress(event: KeyboardEvent) {
      if (event.key === "Escape") {
        setChatInputVisible(false);
        setInputValue("");
        fetchNui("nui:setNuiFocus", false);
      }
    }
    if (chatInputVisible) {
      if (activeHotbar.length > 0 && inputValue.length == 0) {
        setInputValue("/" + activeHotbar + " ");
      }
      chatInputRef.current?.focus();
      document.addEventListener("keydown", handleKeyPress);
    } else {
      setShowingUsedCommand(0);
    }
    return () => {
      document.removeEventListener("keydown", handleKeyPress);
    };
  }, [
    chatInputRef,
    chatInputVisible,
    setChatInputVisible,
    usedCommands,
    showingUsedCommand,
    activeHotbar,
    inputValue,
  ]);

  return (
    <div
      className={classNames("relative chat-input-part", {
        closing: !chatInputVisible,
      })}
    >
      <div className="w-full flex flex-shrink-0 items-center bg-gradient-15">
        <div className="w-full h-11 pl-2.5 pr-1">
          <input
            ref={chatInputRef}
            className="w-full h-full p-0 border-none bg-transparent text-white ring-0 outline-none placeholder:text-white/40 text-sm"
            id="chat-text-input"
            placeholder={_t("chat_input_placeholder")}
            type="text"
            value={inputValue}
            onChange={handleInputChange}
            onKeyDown={handleKeyPress}
          />
        </div>
        <div className="flex items-center justify-end gap-1 pr-1">
          <button
            onClick={handleDiceButtonClick}
            id="button-dice"
            className="group hover:bg-white/40 bg-white/20 rounded-full flex items-center justify-center p-1"
          >
            <FaDice className="w-5 h-5 text-white/80 group-hover:text-white" />
          </button>
          <button
            onClick={handleRPSButtonClick}
            id="button-rps"
            className="group hover:bg-white/40 bg-white/20 rounded-full flex items-center justify-center p-1"
          >
            <LiaHandScissors className="w-5 h-5 text-white/80 group-hover:text-white" />
          </button>
          {enableEmojiMenu && (
            <button
              ref={emojiButtonRef}
              onClick={handleEmojiButtonClick}
              id="button-emoji"
              className="group hover:bg-white/40 bg-white/20 rounded-full flex items-center justify-center p-1"
            >
              <RiEmojiStickerFill className="w-5 h-5 text-white/80 group-hover:text-white" />
            </button>
          )}
          <button
            onClick={handleSettingsButtonClick}
            id="button-settings"
            className="group hover:bg-white/40 bg-white/20 rounded-full flex items-center justify-center p-1"
          >
            <FaGear className="w-5 h-5 text-white/80 group-hover:text-white" />
          </button>
        </div>
      </div>
      <HotBar onClickHotbar={handleHotbarClick} />
      {enableEmojiMenu && (
        <div
          className="absolute right-0 top-20"
          hidden={!emojiMenuVisible}
          ref={emojiMenuRef}
        >
          <EmojiMenu onClickEmoji={handleEmojiClick} />
        </div>
      )}
      <Suggestions inputValue={inputValue} />
    </div>
  );
};
