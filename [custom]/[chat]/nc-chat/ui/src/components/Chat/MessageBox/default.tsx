import { FaImage, FaUserSecret } from "react-icons/fa";
import { MessageProps } from "../../../types/BasicTypes";
import { LoagImage } from "../LoadImage";
import useData from "../../../hooks/useData";

export const DefaultMessage: React.FC<{ message: MessageProps }> = ({
  message,
}) => {
  const { customNameColor } = useData();

  return (
    <>
      <div
        className="flex gap-3 p-2 rounded-r-sm border-l-4 bg-gradient-15 w-max"
        style={{
          borderColor: message.borderColor,
        }}
      >
        <div
          className="flex items-center justify-center h-8 w-8 p-0.5 pb-0"
          style={{
            backgroundColor: message.borderColor,
          }}
        >
          {message?.type?.toLowerCase() == "error" ? (
            <svg
              width="17"
              height="17"
              viewBox="0 0 17 17"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M16.3731 13.96L12.7088 10.9213C13.4774 9.79523 13.9421 8.43677 13.9421 6.97106C13.9421 3.12804 10.8141 0 6.97106 0C3.12804 0 0 3.12804 0 6.97106C0 10.8141 3.12804 13.9421 6.97106 13.9421C8.43677 13.9421 9.79523 13.4774 10.9213 12.7088L13.96 16.3731C14.0315 16.4445 14.103 16.5339 14.1924 16.6054C14.9252 17.2132 15.9977 17.1059 16.6054 16.3731C17.2132 15.6402 17.1059 14.5677 16.3731 13.96ZM1.84107 6.98893C1.84107 4.14689 4.14689 1.84107 6.98893 1.84107C9.83098 1.84107 12.1368 4.14689 12.1368 6.98893C12.1368 9.83098 9.81311 12.1189 6.98893 12.1189C4.14689 12.1189 1.84107 9.81311 1.84107 6.98893Z"
                fill="white"
              />
              <path
                d="M9.08025 4.87974C8.72276 4.52225 8.15078 4.52225 7.79329 4.87974L6.97106 5.70197L6.14883 4.87974C5.79134 4.52225 5.21936 4.52225 4.86187 4.87974C4.50438 5.23723 4.50438 5.80921 4.86187 6.1667L5.6841 6.98893L4.87974 7.79328C4.52225 8.15077 4.52225 8.72276 4.87974 9.08025C5.05849 9.25899 5.29086 9.34837 5.52323 9.34837C5.75559 9.34837 5.98796 9.25899 6.16671 9.08025L6.98894 8.25802L7.81116 9.08025C7.98991 9.25899 8.22228 9.34837 8.45465 9.34837C8.68701 9.34837 8.91938 9.25899 9.09813 9.08025C9.45562 8.72276 9.45562 8.15077 9.09813 7.79328L8.2759 6.97106L9.09813 6.14883C9.43774 5.80921 9.43774 5.23723 9.08025 4.87974Z"
                fill="white"
              />
            </svg>
          ) : message?.type?.toLowerCase() == "announcement" ? (
            <svg
              width="19"
              height="17"
              viewBox="0 0 19 17"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M18.7469 14.45L10.9461 0.85C10.6261 0.32381 10.086 0 9.48598 0C8.88591 0 8.34586 0.32381 8.02583 0.85L0.225023 14.45C-0.0750077 14.9762 -0.0750077 15.6238 0.225023 16.15C0.525054 16.6762 1.06511 17 1.68517 17H17.3268C17.9268 17 18.4869 16.6762 18.7869 16.15C19.087 15.6238 19.067 14.9762 18.7469 14.45ZM9.48598 4.29048C10.166 4.29048 10.7261 4.87738 10.6861 5.56548L10.4461 10.2607C10.4261 10.7869 10.006 11.1917 9.48598 11.1917C8.96592 11.1917 8.54588 10.7869 8.52588 10.2607L8.28585 5.56548C8.24585 4.85714 8.80591 4.29048 9.48598 4.29048ZM9.48598 14.6321C8.7859 14.6321 8.22585 14.0655 8.22585 13.3571C8.22585 12.6488 8.7859 12.0821 9.48598 12.0821C10.186 12.0821 10.7461 12.6488 10.7461 13.3571C10.7461 14.0655 10.186 14.6321 9.48598 14.6321Z"
                fill="#333333"
              />
            </svg>
          ) : message?.type?.toLowerCase() == "darkchat" ? (
            <FaUserSecret className="w-5 h-5 text-white" />
          ) : message?.type?.toLowerCase() == "image" ? (
            <FaImage className="w-5 h-5 text-white" />
          ) : message?.type?.toLocaleLowerCase() == "police" ? (
            <img className="w-5 h-5" src="images/icons/police.svg"></img>
          ) : message?.type?.toLocaleLowerCase() == "ems" ? (
            <img className="w-5 h-5" src="images/icons/ems.svg"></img>
          ) : (
            <h1 className="font-HighriseBold text-[22px] text-wrap text-white">
              {message?.type?.substring(0, 3)}
            </h1>
          )}
        </div>
        <div className="flex flex-col flex-wrap items-start justify-center text-sm font-medium text-ellipsis whitespace-pre-wrap">
          <div className="w-full flex items-center gap-1">
            {message?.channel && (
              <div className="text-white">
                <h1>[{message.channel}]</h1>
              </div>
            )}
            {message?.sourceId && (
              <div style={{ color: message.borderColor }}>
                <h1>[{message.sourceId}]</h1>
              </div>
            )}
            <div
              style={{
                color: customNameColor,
              }}
            >
              <h1>{message.header}</h1>
            </div>
            <div className="text-white/35 ml-auto text-xs">
              <h1>{message.time}</h1>
            </div>
          </div>
          <div className="max-w-[442px] -mt-1">
            {message?.type?.toLowerCase() != "image" ? (
              <h1
                className="text-white/80 text-xs text-ellipsis overflow-hidden"
                dangerouslySetInnerHTML={{ __html: message.content }}
              ></h1>
            ) : (
              <>
                <div className="mt-2">
                  <LoagImage src={message.content} />
                </div>
              </>
            )}
          </div>
        </div>
      </div>
    </>
  );
};
