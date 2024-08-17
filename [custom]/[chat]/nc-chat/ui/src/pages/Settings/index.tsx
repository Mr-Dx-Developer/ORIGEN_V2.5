import { FaImage } from "react-icons/fa";
import { IoMdClose } from "react-icons/io";
import useData from "../../hooks/useData";
import useLocales from "../../hooks/useLocales";
import useRouter from "../../hooks/useRouter";
import { ChangeEvent } from "react";
import classNames from "classnames";
import { FaBell, FaBellSlash } from "react-icons/fa";

export const Settings = () => {
  const { setRouter } = useRouter();
  const {
    chatPosition,
    setChatPosition,
    typeColors,
    updateTypeColor,
    customNameColor,
    customNameTag,
    updateCustomNameColor,
    updateCustomNameTag,
    activeCustomNameColor,
    activeCustomNameTag,
    notification,
    setNotification,
    meDoPP,
    setMeDoPP,
  } = useData();
  const { _t } = useLocales();

  const handleHexChange = (e: ChangeEvent<HTMLInputElement>, type: string) => {
    const _val = e.currentTarget.value;
    updateTypeColor(type, _val);
  };
  const handleChangeNameColor = (e: ChangeEvent<HTMLInputElement>) => {
    const _val = e.currentTarget.value;
    updateCustomNameColor(_val);
  };
  const handleChangeNameTag = (e: ChangeEvent<HTMLInputElement>) => {
    const _val = e.currentTarget.value;
    updateCustomNameTag(_val);
  };

  const handleToggleNotification = () => {
    setNotification(!notification);
  };

  const _editableTypes = ["ooc", "me", "do"];

  return (
    <>
      <div className="absolute w-full h-full flex items-center justify-center bg-0c0c0c/45">
        <div className="relative p-3 pt-1 w-[520px] min-h-[180px] flex flex-col gap-2 border-l-4 border-[#373737] background-settings">
          <div className="flex flex-col items-start -mt-2">
            <div className="flex items-center font-medium text-white uppercase text-lg gap-2">
              <div className="mt-4">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="19"
                  height="21"
                  viewBox="0 0 19 21"
                  fill="none"
                >
                  <path
                    d="M14.8193 5.93489H16.8471C18.0342 5.93489 19 5.02981 19 3.91745V2.01719C19 0.90483 18.0342 0 16.8471 0H14.8193C13.6322 0 12.6664 0.90483 12.6664 2.01719V3.91745C12.6664 5.02981 13.6322 5.93489 14.8193 5.93489ZM16.8471 1.52518C17.1367 1.52518 17.3724 1.74586 17.3724 2.01719V3.91745C17.3724 4.18878 17.1367 4.40971 16.8471 4.40971H14.8193C14.5297 4.40971 14.294 4.18878 14.294 3.91745V2.01719C14.294 1.74586 14.5297 1.52518 14.8193 1.52518H16.8471ZM7.31554e-07 1.82604C7.31554e-07 1.40478 0.364509 1.06345 0.813787 1.06345H10.3914C10.8409 1.06345 11.2052 1.40478 11.2052 1.82604C11.2052 2.2473 10.8409 2.58863 10.3914 2.58863H0.813787C0.364509 2.58863 7.31554e-07 2.2473 7.31554e-07 1.82604ZM4.3847 4.1086C4.3847 3.68734 4.74921 3.34601 5.19848 3.34601H10.3914C10.8409 3.34601 11.2052 3.68734 11.2052 4.1086C11.2052 4.52986 10.8409 4.87119 10.3914 4.87119H5.19848C4.74921 4.87119 4.3847 4.52986 4.3847 4.1086ZM14.8193 21H16.8471C18.0342 21 19 20.0949 19 18.9828V17.0823C19 15.9702 18.0342 15.0651 16.8471 15.0651H14.8193C13.6322 15.0651 12.6664 15.9702 12.6664 17.0823V18.9828C12.6664 20.0949 13.6322 21 14.8193 21ZM16.8471 16.5903C17.1367 16.5903 17.3724 16.8112 17.3724 17.0823V18.9828C17.3724 19.2539 17.1367 19.4748 16.8471 19.4748H14.8193C14.5297 19.4748 14.294 19.2539 14.294 18.9828V17.0823C14.294 16.8112 14.5297 16.5903 14.8193 16.5903H16.8471ZM7.31554e-07 16.8912C7.31554e-07 16.4701 0.364509 16.1286 0.813787 16.1286H10.3914C10.8409 16.1286 11.2052 16.4701 11.2052 16.8912C11.2052 17.3122 10.8409 17.6537 10.3914 17.6537H0.813787C0.364509 17.6537 7.31554e-07 17.3122 7.31554e-07 16.8912ZM4.3847 19.174C4.3847 18.7529 4.74921 18.4114 5.19848 18.4114H10.3914C10.8409 18.4114 11.2052 18.7529 11.2052 19.174C11.2052 19.595 10.8409 19.9365 10.3914 19.9365H5.19848C4.74921 19.9365 4.3847 19.595 4.3847 19.174ZM2.15261 13.6958H4.18072C5.36749 13.6958 6.33333 12.7907 6.33333 11.6786V9.77812C6.33333 8.66576 5.36749 7.76069 4.18072 7.76069H2.15261C0.965842 7.76069 7.31554e-07 8.66576 7.31554e-07 9.77812V11.6786C7.31554e-07 12.7907 0.965842 13.6958 2.15261 13.6958ZM4.18072 9.28586C4.47 9.28586 4.70576 9.5068 4.70576 9.77812V11.6786C4.70576 11.9497 4.47 12.1706 4.18072 12.1706H2.15261C1.86334 12.1706 1.62757 11.9497 1.62757 11.6786V9.77812C1.62757 9.5068 1.86334 9.28586 2.15261 9.28586H4.18072ZM7.79455 9.58698C7.79455 9.16572 8.15905 8.82439 8.60833 8.82439H18.1862C18.6358 8.82439 19 9.16572 19 9.58698C19 10.0082 18.6358 10.3496 18.1862 10.3496H8.60833C8.15905 10.3496 7.79455 10.0082 7.79455 9.58698ZM7.79455 11.8698C7.79455 11.4488 8.15905 11.1072 8.60833 11.1072H13.8015C14.2511 11.1072 14.6153 11.4488 14.6153 11.8698C14.6153 12.2908 14.2511 12.6324 13.8015 12.6324H8.60833C8.15905 12.6324 7.79455 12.2908 7.79455 11.8698Z"
                    fill="url(#paint0_linear_3_303)"
                  />
                  <defs>
                    <linearGradient
                      id="paint0_linear_3_303"
                      x1="23.3182"
                      y1="9.69231"
                      x2="-1.72301"
                      y2="8.76901"
                      gradientUnits="userSpaceOnUse"
                    >
                      <stop stopColor="white" />
                      <stop offset="1" stopColor="white" stopOpacity="0" />
                    </linearGradient>
                  </defs>
                </svg>
              </div>
              <div>
                <span className="font-bold">UI</span>
                <span>Chat</span>
              </div>
            </div>
            <h1 className="text-white font-thin tracking-widest ml-7 -mt-3 text-sm">
              Settings
            </h1>
            <div
              className="ml-auto absolute right-1.5 top-1.5 cursor-pointer group"
              onClick={() => {
                setRouter("main");
              }}
            >
              <IoMdClose className="w-5 h-5 text-white/40 group-hover:text-white" />
            </div>
          </div>
          <div className="body flex flex-col gap-3">
            <div className="grid grid-cols-3 justify-between items-center gap-3">
              {_editableTypes.map((_type, i) => (
                <div
                  key={i}
                  className="h-10 w-full flex items-center border-r-4"
                  style={{
                    borderColor: typeColors[_type].background,
                  }}
                >
                  <div
                    className="min-w-10 min-h-10 h-10 w-10 flex items-center justify-center"
                    style={{
                      backgroundColor: typeColors[_type].background,
                    }}
                  >
                    <h1 className="font-HighriseBold text-white text-center mt-0.5 text-xl uppercase">
                      {_type}
                    </h1>
                  </div>
                  <div className="w-full h-10 flex items-center justify-center relative">
                    <div
                      className="absolute w-full h-full top-0 left-0"
                      style={{
                        backgroundColor: typeColors[_type].background,
                        opacity: 0.2,
                      }}
                    ></div>
                    <div className="w-full h-full flex items-center justify-center z-10">
                      <input
                        id={"color_inpıt_" + _type}
                        className="invisible font-bold bg-transparent w-full h-full ring-0 outline-none text-center z-10"
                        style={{
                          color: typeColors[_type].background,
                        }}
                        type="color"
                        value={typeColors[_type].background.toUpperCase()}
                        onChange={(e) => handleHexChange(e, _type)}
                      />
                      <label
                        htmlFor={"color_inpıt_" + _type}
                        className="text-center font-bold text-white w-full absolute"
                      >
                        {typeColors[_type].background.toUpperCase()}
                      </label>
                    </div>
                  </div>
                </div>
              ))}
            </div>
            <div className="grid grid-cols-3 justify-start items-center gap-3">
              {activeCustomNameColor && (
                <div
                  className="h-10 w-full flex items-center border-r-4"
                  style={{
                    borderColor: customNameColor,
                  }}
                >
                  <div
                    className="min-w-10 min-h-10 h-10 w-10 flex items-center justify-center"
                    style={{
                      backgroundColor: customNameColor,
                    }}
                  >
                    <h1 className="font-HighriseBold text-gray-900 text-center mt-0.5 text-xl uppercase">
                      {_t("name_color")}
                    </h1>
                  </div>
                  <div className="w-full h-10 flex items-center justify-center relative">
                    <div
                      className="absolute w-full h-full top-0 left-0"
                      style={{
                        backgroundColor: customNameColor,
                        opacity: 0.2,
                      }}
                    ></div>
                    <div className="w-full h-full flex items-center justify-center z-10 relative">
                      <input
                        id="activeCustomNameColor"
                        className="invisible font-bold bg-transparent w-full h-full ring-0 outline-none text-center z-10"
                        style={{
                          color: customNameColor,
                        }}
                        type="color"
                        value={customNameColor.toUpperCase()}
                        onChange={(e) => handleChangeNameColor(e)}
                      />
                      <label
                        htmlFor="activeCustomNameColor"
                        className="font-bold text-white absolute text-center w-full"
                      >
                        {customNameColor.toUpperCase()}
                      </label>
                      <h1
                        className="absolute bottom-0 right-1 text-[10px]"
                        style={{
                          color: customNameColor,
                        }}
                      >
                        [All]
                      </h1>
                    </div>
                  </div>
                </div>
              )}
              {activeCustomNameTag && (
                <div className="h-10 w-full flex items-center border-r-4">
                  <div className="min-w-10 min-h-10 h-10 w-10 flex items-center justify-center bg-white">
                    <h1 className="font-HighriseBold text-gray-900 text-center mt-0.5 text-xl uppercase">
                      {_t("name_tag")}
                    </h1>
                  </div>
                  <div className="w-full h-10 flex items-center justify-center relative">
                    <div className="absolute w-full h-full top-0 left-0  bg-white/20"></div>
                    <div className="w-full h-full flex items-center justify-center z-10">
                      <input
                        className="font-bold bg-transparent w-full h-full ring-0 outline-none text-center z-10 text-white uppercase"
                        type="text"
                        maxLength={5}
                        value={customNameTag}
                        placeholder="None"
                        onChange={(e) => handleChangeNameTag(e)}
                      />
                    </div>
                  </div>
                </div>
              )}
              <div className="flex items-end justify-end">
                <button
                  className=" bg-black/40 p-1 rounded hover:bg-black/60"
                  onClick={() => {
                    setMeDoPP("");
                    updateCustomNameTag("");
                    updateCustomNameColor("#FFF");
                    updateTypeColor("ooc", "#8AB1DE")
                    updateTypeColor("me", "#F2617B")
                    updateTypeColor("do", "#9861F2")
                  }}
                >
                  <h1 className="text-white font-semibold">Reset</h1>
                </button>
              </div>
            </div>
          </div>
          <div className="bottom mt-auto">
            <div className="flex mt-3 text-white justify-between gap-2 w-full border-x-4 border-[#373737] p-2 bg-black/20">
              <div className="flex items-center justify-start gap-2">
                <FaImage className="w-5 h-5 text-white" />
                <h1
                  className={classNames("text-sm font-semibold", {
                    "text-white": meDoPP.length > 0,
                    "text-white/50": meDoPP.length == 0,
                  })}
                >
                  {_t("rp_text_pp_desc")}
                </h1>
              </div>
              <div className="input">
                <input
                  className="w-full text-white text-xs font-medium bg-transparent h-full ring-0 outline-none border rounded px-2 border-[#373737]"
                  type="text"
                  value={meDoPP}
                  onChange={(e) => setMeDoPP(e.currentTarget.value)}
                  placeholder="Link..."
                />
              </div>
            </div>
            <div className="flex justify-between items-center">
              <div className="flex mt-3 text-white justify-between gap-2 w-full border-l-4 border-[#373737] p-2 bg-black/20">
                <div className="flex items-center justify-start gap-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 10 10"
                    fill="none"
                  >
                    <path
                      d="M5.81076 3.76302L1.71517 7.27631C1.55 7.41796 1.46532 7.61843 1.46562 7.82066C1.46562 7.98582 1.52191 8.15166 1.638 8.28667C1.89585 8.58665 2.34754 8.62128 2.64812 8.36374L6.77541 4.82284C7.43129 5.16077 8.22542 4.97454 8.22542 4.97454C8.51058 4.89845 8.78365 4.75934 9.02266 4.55428C9.49123 4.15255 9.73015 3.58353 9.72996 3.01118C9.72996 2.96562 9.7285 2.92007 9.72547 2.87461C9.71006 2.66691 9.51816 2.81988 9.51816 2.81988L9.08286 3.19321C8.64736 3.56704 7.99069 3.5169 7.61646 3.08122C7.44846 2.88514 7.36613 2.64428 7.36603 2.40459C7.36603 2.11174 7.48876 1.82025 7.72846 1.61441L8.1981 1.21142C8.1981 1.21142 8.402 1.07855 8.14522 1.0288C7.54046 0.892322 6.88116 1.03202 6.37406 1.46701C5.90558 1.86864 5.66579 2.43708 5.66608 3.00972C5.66618 3.26462 5.71408 3.5207 5.81076 3.76302Z"
                      fill="white"
                    />
                    <path
                      d="M9.3049 4.97415H9.30422C8.78413 5.39938 8.13391 5.59527 7.49012 5.54152C7.25013 6.73645 6.19533 7.63726 4.92932 7.63784C4.72952 7.63794 4.53567 7.61346 4.34875 7.57102L2.97718 8.7479C2.91728 8.79892 2.85348 8.84185 2.78782 8.8796C2.68987 9.18377 2.81036 9.50511 3.07776 9.61574C3.36068 9.73387 3.69794 9.57077 3.83111 9.25108L3.94447 8.97949C4.10827 9.02047 4.2749 9.05256 4.44553 9.07295L4.44563 9.37371H4.44611C4.44621 9.71963 4.69528 10.0001 5.002 10C5.30892 9.9999 5.5572 9.71924 5.55711 9.37322L5.55701 9.05042C5.7171 9.02603 5.87358 8.99296 6.02675 8.95003L6.1527 9.25557C6.2843 9.57516 6.62166 9.73924 6.90536 9.62247C7.18877 9.5055 7.31179 9.15197 7.18028 8.8317L7.04584 8.50636C7.18506 8.42168 7.3193 8.33057 7.44642 8.23009L7.70104 8.4847C7.94582 8.72898 8.31995 8.75093 8.53702 8.53436C8.7535 8.3173 8.73145 7.94309 8.48687 7.69833L8.2182 7.43035C8.30893 7.30675 8.39292 7.17963 8.46912 7.04618L8.82384 7.19368C9.14354 7.32675 9.49836 7.2049 9.61601 6.92131C9.73386 6.6386 9.57074 6.30097 9.25134 6.16781L8.88257 6.01387C8.92003 5.86325 8.95047 5.71038 8.97037 5.55381H9.37397C9.71981 5.55362 10.0002 5.30427 10 4.99795C10 4.98917 9.99756 4.98156 9.99698 4.97327H9.99727C9.98829 4.79289 9.88234 4.63554 9.72576 4.54004C9.58255 4.72988 9.32012 4.96117 9.3049 4.97415Z"
                      fill="white"
                    />
                    <path
                      d="M1.17558 2.80642C0.856268 2.67355 0.501937 2.79529 0.383989 3.07859C0.266042 3.36159 0.429159 3.69932 0.748954 3.83219L1.00007 3.93725C0.954996 4.10349 0.919778 4.27303 0.89412 4.44678H0.626226C0.288968 4.44687 0.0159016 4.68393 0.00243855 4.98059H0.00292683C0.002244 4.9881 0 4.99512 0 5.00254C0 5.30885 0.281065 5.55801 0.626908 5.55781H0.887194C0.909242 5.72716 0.942412 5.89222 0.98446 6.05367L0.74437 6.15289C0.424574 6.28478 0.259894 6.62114 0.377355 6.90502C0.491205 7.18207 0.830513 7.30382 1.14319 7.18763C1.20943 7.07896 1.28708 6.97663 1.38542 6.89205L2.48637 5.94793C2.3772 5.66063 2.31515 5.35051 2.31505 5.02546C2.31505 5.02107 2.31613 5.01697 2.31613 5.01239C2.31613 5.00088 2.31798 4.99015 2.31798 4.97893H2.31779C2.34169 3.55748 3.50009 2.41162 4.92756 2.41103C5.0298 2.41103 5.1299 2.41835 5.22873 2.42966C5.35048 1.9101 5.63242 1.43745 6.04499 1.08323C5.78432 1.02197 5.67779 1.00968 5.55408 0.996899L5.55398 0.626294C5.55389 0.280272 5.30531 0 4.99829 0C4.69147 0.000195503 4.4428 0.280856 4.44299 0.626781L4.44309 0.975729C4.28466 0.994655 4.12993 1.02353 3.97764 1.05992L3.84779 0.744722C3.71589 0.424846 3.37854 0.260567 3.09523 0.377337C2.81153 0.494304 2.68831 0.848519 2.81982 1.16849L2.94109 1.46291C2.79446 1.54544 2.65534 1.63773 2.52012 1.73655L2.29896 1.51588C2.05409 1.27102 1.67995 1.24898 1.46327 1.46632C1.2463 1.68309 1.26845 2.0575 1.51361 2.30206L1.72112 2.50907C1.61956 2.63901 1.52678 2.77491 1.44093 2.91665L1.17558 2.80642Z"
                      fill="white"
                    />
                  </svg>
                  <h1
                    className={classNames("text-sm font-semibold", {
                      "text-white": chatPosition == "right",
                      "text-white/50": chatPosition != "right",
                    })}
                  >
                    {_t("chat_position_desc")}
                  </h1>
                </div>
                <div className="input">
                  <input
                    className="hidden"
                    type="checkbox"
                    id="checkboxInput"
                    checked={chatPosition == "right"}
                    onChange={(e: React.ChangeEvent<HTMLInputElement>) => {
                      setChatPosition(e.target.checked ? "right" : "left");
                    }}
                  />
                  <label
                    htmlFor="checkboxInput"
                    className="toggleSwitch flex items-center justify-center relative w-[42px] h-[24px] cursor-pointer transition-transform bg-black/35"
                  ></label>
                </div>
              </div>
              <div className="flex mt-3 text-white justify-between gap-2 w-full border-x-4 border-[#373737] p-2 bg-black/20">
                <div className="flex items-center justify-start gap-2">
                  {notification ? (
                    <FaBell className="w-5 h-5 text-white/80 group-hover:text-white" />
                  ) : (
                    <FaBellSlash className="w-5 h-5 text-white/80 group-hover:text-white" />
                  )}
                  <h1
                    className={classNames("text-sm font-semibold", {
                      "text-white": notification,
                      "text-white/50": !notification,
                    })}
                  >
                    {_t("setting_notif")}
                  </h1>
                </div>
                <div className="input">
                  <input
                    className="hidden"
                    type="checkbox"
                    id="notifInput"
                    checked={notification == true}
                    onChange={handleToggleNotification}
                  />
                  <label
                    htmlFor="notifInput"
                    className="toggleSwitch flex items-center justify-center relative w-[42px] h-[24px] cursor-pointer transition-transform bg-black/35"
                  ></label>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};
