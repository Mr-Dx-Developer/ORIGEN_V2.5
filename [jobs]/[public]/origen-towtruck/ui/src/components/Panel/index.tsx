import classNames from "classnames";
import useLocales from "../../hooks/useLocales";
import { getFormattedDate, isEnvBrowser } from "../../utils/misc";

export type PanelProps = {
  children: React.ReactNode;
};

export const Panel: React.FC<PanelProps> = ({ children }) => {
  const { locale } = useLocales();

  return (
    <div
      className={classNames("w-full h-full flex", {
        "bg-dark/70": !isEnvBrowser(),
        "bg-dark": isEnvBrowser(),
      })}
    >
      <div className="w-3/4 h-5/6 m-auto">
        <div className="border-[6px] border-solid border-4B bg-4B rounded-[2.2rem] w-full h-full shrink-0">
          <div className="border-[8px] border-solid border-0B bg-0B rounded-[2.2rem] w-full h-full shrink-0">
            <div
              className="flex flex-col w-full h-full rounded-[2.2rem] bg-center bg-no-repeat bg-cover"
              style={{
                backgroundImage: "url(images/ipad_bg.png)",
              }}
            >
              <div
                className="relative grid grid-cols-3 rounded-t-[2.2rem] px-5"
                style={{
                  background:
                    "linear-gradient(180deg, rgba(0, 0, 0, 0.50) 0%, rgba(0, 0, 0, 0.50) 100%)",
                }}
              >
                <ul className="flex items-center gap-3 overflow-auto scrollbar-hide justify-start select-none whitespace-nowrap">
                  <li className="mr-1">
                    <svg
                      width="16"
                      height="18"
                      viewBox="0 0 13 14"
                      fill="none"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <g id="Vector">
                        <path
                          d="M12.9591 7.13851C12.9591 8.82742 12.3141 10.4472 11.166 11.6414C10.0179 12.8357 8.46068 13.5066 6.83699 13.5066C5.21329 13.5066 3.6561 12.8357 2.50798 11.6414C1.35985 10.4472 0.714844 8.82742 0.714844 7.13851L12.9591 7.13851Z"
                          fill="white"
                        />
                        <path
                          d="M7.13563 6.6235C7.13563 6.08882 7.03158 5.56706 6.83699 5.09748C6.74187 4.86795 6.62512 4.65089 6.48831 4.45089C6.43062 4.36655 6.36936 4.28524 6.30466 4.20731C5.95451 3.78559 5.52225 3.48548 5.05314 3.32957C4.80944 3.24857 4.55579 3.20649 4.29854 3.20649C3.54609 3.20649 2.82447 3.5665 2.29241 4.20731C1.76035 4.84813 1.46145 5.71726 1.46145 6.6235L7.13563 6.6235Z"
                          fill="white"
                        />
                        <path
                          fillRule="evenodd"
                          clipRule="evenodd"
                          d="M10.7583 0.178536C7.90583 0.0149824 6.46505 0.500213 4.6327 2.5067C5.45073 2.60278 6.22124 3.04943 6.8114 3.77763C7.62097 2.28613 8.74597 1.59462 11.1269 0.963751C11.2223 0.938473 11.274 0.811639 11.2303 0.706413L11.134 0.474515C11.0622 0.301582 10.9187 0.18773 10.7583 0.178536ZM7.22707 4.39173C7.59592 5.0478 7.81927 5.81837 7.87075 6.6235L12.2125 6.6235C12.2125 5.71726 11.9136 4.84813 11.3816 4.20731C10.8495 3.5665 10.1279 3.20649 9.37543 3.20649C8.62299 3.20649 7.90137 3.5665 7.36931 4.20731C7.31987 4.26686 7.27243 4.32838 7.22707 4.39173ZM6.48831 4.45089C6.62512 4.65089 6.74187 4.86795 6.83699 5.09748C7.03158 5.56706 7.13563 6.08882 7.13563 6.6235L6.53834 6.6235H1.46145C1.46145 5.71726 1.76035 4.84813 2.29241 4.20731C2.82447 3.5665 3.54609 3.20649 4.29854 3.20649C4.55579 3.20649 4.80944 3.24857 5.05314 3.32957C5.52225 3.48548 5.95451 3.78559 6.30466 4.20731C6.36936 4.28524 6.43062 4.36655 6.48831 4.45089Z"
                          fill="white"
                        />
                      </g>
                    </svg>
                  </li>
                  <li>
                    <h1 className="text-xs font-extrabold text-white">
                      {locale.text_towtruck}
                    </h1>
                  </li>
                  <li>
                    <h1 className="text-xs font-medium text-white">
                      {locale.text_file}
                    </h1>
                  </li>
                  <li>
                    <h1 className="text-xs font-medium text-white">
                      {locale.text_order}
                    </h1>
                  </li>
                  <li>
                    <h1 className="text-xs font-medium text-white">
                      {locale.text_image}
                    </h1>
                  </li>
                  <li>
                    <h1 className="text-xs font-medium text-white">
                      {locale.text_history}
                    </h1>
                  </li>
                  <li>
                    <h1 className="text-xs font-medium text-white">
                      {locale.text_place_marks}
                    </h1>
                  </li>
                  <li>
                    <h1 className="text-xs font-medium text-white">
                      {locale.text_screen}
                    </h1>
                  </li>
                  <li>
                    <h1 className="text-xs font-medium text-white">
                      {locale.text_help}
                    </h1>
                  </li>
                </ul>
                <div className="relative bottom-[1px] flex justify-center">
                  <img src="images/celtik.png" alt="celtik" />
                </div>
                <ul className="flex items-center justify-end gap-3 overflow-x-auto scrollbar-hide select-none">
                  <li>
                    <h1 className="text-xs font-medium text-white whitespace-nowrap">
                      {getFormattedDate()}
                    </h1>
                  </li>
                </ul>
              </div>
              <div className="w-full h-full relative rounded-b-[2.2rem]">
                {children}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
