import { FaSpotify } from "react-icons/fa6";
import { PiPauseFill } from "react-icons/pi";
import useLocales from "../../../hooks/useLocales";
import useData from "../../../hooks/useData";
import { useEffect, useRef, useState } from "react";
import { fetchNui } from "../../../utils/fetchNui";
import { MessageProps } from "../../../types/BasicTypes";
import { SpecialMessage } from "./special";
import { DefaultMessage } from "./default";
import classNames from "classnames";

export const MessageBox: React.FC = () => {
  const { messages, playingSong, activeHotbar, chatBoxVisible } = useData();
  const { _t } = useLocales();

  const [filteredMessages, setFilteredMessages] = useState<MessageProps[]>([]);

  const messagesEndRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const messagesEnd = messagesEndRef.current;
    if (messagesEnd) {
      const scrollOptions: ScrollIntoViewOptions = {
        behavior: "smooth",
        block: "end",
        inline: "nearest",
      };
      const scrollDelay = 100;

      const scrollTimeout = setTimeout(() => {
        messagesEnd.scrollIntoView(scrollOptions);
      }, scrollDelay);
      return () => clearTimeout(scrollTimeout);
    }
  }, [messages]);

  useEffect(() => {
    if (activeHotbar == "") {
      setFilteredMessages(messages);
      return;
    }
    const filtered = messages.filter(
      (message) => message?.type?.toLowerCase() === activeHotbar.toLowerCase()
    );
    setFilteredMessages(filtered);
  }, [activeHotbar, messages]);

  return (
    <>
      <div
        className={classNames("message-box", {
          closing: !chatBoxVisible,
        })}
      >
        <div className="col mb-2">
          {filteredMessages.map((message, i) =>
            message.specialMessage ? (
              <SpecialMessage key={i} message={message} />
            ) : (
              <DefaultMessage key={i} message={message} />
            )
          )}
        </div>
        {playingSong.active && (
          <div className="w-full pr-1 pb-2 mt-auto">
            <div className="flex items-center gap-2 w-full bg-gradient-15 h-full p-2 border-l-4 border-1db954 rounded-r-sm">
              <div>
                <FaSpotify className="w-8 h-8 text-1db954" />
              </div>
              <div className="text-white text-sm overflow-hidden text-ellipsis max-w-[450px]">
                <span className="whitespace-nowrap font-medium">
                  {_t("spofi_now_playing")}:{" "}
                </span>
                <span>{playingSong.title}</span>
              </div>
              <div className="end ml-auto">
                <button
                  onClick={() => {
                    fetchNui("nui:processInput", "stopmusic");
                  }}
                  className="flex items-center bg-white/80 text-black/60 rounded p-0.5 hover:bg-1db954 hover:text-white transition-colors"
                >
                  <PiPauseFill />
                </button>
              </div>
            </div>
          </div>
        )}
        <div ref={messagesEndRef} />
      </div>
    </>
  );
};
