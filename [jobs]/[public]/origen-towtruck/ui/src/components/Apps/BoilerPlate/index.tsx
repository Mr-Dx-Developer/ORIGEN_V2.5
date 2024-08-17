import classNames from "classnames";
import useData from "../../../hooks/useData";
import { AiOutlineFullscreen } from "react-icons/ai";
import useLocales from "../../../hooks/useLocales";

type BoilerPlateProps = {
  children: React.ReactNode;
};
const BoilerPlate: React.FC<BoilerPlateProps> = ({ children }) => {
  const { locale } = useLocales();
  const { setRunningApp, setAppFullScreen, isAppFullScreen } = useData();

  return (
    <div className="w-full h-full flex flex-col">
      <div
        className={classNames("bg-black/85", {
          "rounded-t-lg": !isAppFullScreen,
        })}
      >
        <div className="flex gap-2 p-3.5 items-center">
          <div
            onClick={() => setRunningApp(null)}
            className="w-3 h-3 rounded-full group cursor-pointer"
            style={{
              backgroundColor: "#F35D55",
            }}
          >
            <div className="font-bold flex items-center justify-center invisible group-hover:visible text-[8px] uppercase">
              <h1>X</h1>
            </div>
          </div>
          <div
            className="w-3 h-3 rounded-full"
            style={{
              backgroundColor: "#FEBC2E",
            }}
          ></div>
          <div
            onClick={() => setAppFullScreen(!isAppFullScreen)}
            className="w-3 h-3 rounded-full group cursor-pointer"
            style={{
              backgroundColor: "#2BC840",
            }}
          >
            <div className="font-bold flex items-center justify-center invisible group-hover:visible text-[8px] uppercase">
              <div>
                <AiOutlineFullscreen className="w-2.5 h-2.5" />
              </div>
            </div>
          </div>
          <div className="mx-2 w-[1px] h-4 flex-shrink-0 bg-white/20"></div>
          <div className="mr-1">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="8"
              height="13"
              viewBox="0 0 8 13"
              fill="none"
            >
              <path
                d="M6.5 1L1.35355 6.14645C1.15829 6.34171 1.15829 6.65829 1.35355 6.85355L6.5 12"
                stroke="white"
                strokeOpacity="0.18"
                strokeWidth="2"
                strokeLinecap="round"
              />
            </svg>
          </div>
          <div className="ml-1">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="8"
              height="13"
              viewBox="0 0 8 13"
              fill="none"
            >
              <path
                d="M1 1L6.14645 6.14645C6.34171 6.34171 6.34171 6.65829 6.14645 6.85355L1 12"
                stroke="white"
                strokeOpacity="0.18"
                strokeWidth="2"
                strokeLinecap="round"
              />
            </svg>
          </div>
          <div className="mx-2 w-[1px] h-4 flex-shrink-0 bg-white/20"></div>
          <div>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="13"
              height="14"
              viewBox="0 0 13 14"
              fill="none"
            >
              <path
                fillRule="evenodd"
                clipRule="evenodd"
                d="M5.08939 11.0041C2.2786 11.0041 0 8.66391 0 5.77715C0 2.89039 2.2786 0.550205 5.08939 0.550205C7.90019 0.550205 10.1788 2.89039 10.1788 5.77715C10.1788 6.78953 9.89854 7.73468 9.41339 8.53526C9.48103 8.58012 9.54523 8.63235 9.60485 8.69197L12.338 11.4251C12.8197 11.9068 12.8197 12.6878 12.338 13.1695C11.8562 13.6512 11.0752 13.6512 10.5935 13.1695L7.86044 10.4364C7.80453 10.3805 7.7551 10.3205 7.71217 10.2575C6.94622 10.7314 6.04881 11.0041 5.08939 11.0041ZM5.08939 9.46259C3.10754 9.46259 1.50094 7.81256 1.50094 5.77715C1.50094 3.74174 3.10754 2.09171 5.08939 2.09171C7.07124 2.09171 8.67785 3.74174 8.67785 5.77715C8.67785 7.81256 7.07124 9.46259 5.08939 9.46259Z"
                fill="white"
                fillOpacity="0.18"
              />
            </svg>
          </div>
          <div>
            <h1 className="text-white/20 text-xs font-bold select-none">
              {locale.text_search}
            </h1>
          </div>
        </div>
      </div>
      <div
        className={classNames(
          "bg-black/90 bg-cover bg-no-repeat bg-center w-full h-full p-4 overflow-auto",
          {
            "rounded-b-lg": !isAppFullScreen,
            "rounded-b-[2rem]": isAppFullScreen,
          }
        )}
        style={{
          backgroundImage: "url(images/app_bg_effect.png)",
        }}
      >
        <>{children}</>
      </div>
    </div>
  );
};

export default BoilerPlate;
