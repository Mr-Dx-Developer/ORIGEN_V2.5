import React, { useEffect, useState } from "react";
import { MdHome } from "react-icons/md";
import { FaRankingStar } from "react-icons/fa6";
import useData from "../../../../hooks/useData";
import classNames from "classnames";
import { Home } from "./Home";
import { Rank } from "./Rank";
import useLocales from "../../../../hooks/useLocales";

const AppTrowTuck: React.FC = () => {
  const { locale } = useLocales();
  const { playerProfile, updatePlayerProfilePhoto } = useData();
  const [photoSelectMenu, setPhotoSelectMenu] = useState<boolean>(false);
  const [activePage, setActivePage] = useState<"home" | "rank">("home");

  useEffect(() => {
    if (!photoSelectMenu) return;

    const handleDocumentClick = (e: any) => {
      const withinPhoto = e.target.closest("#playerProfilePhoto");
      const withinMenu = e.target.closest("#photoSelectMenu");
      if (!withinMenu && !withinPhoto) {
        setPhotoSelectMenu(false);
      }
    };

    document.addEventListener("click", handleDocumentClick);
    return () => {
      document.removeEventListener("click", handleDocumentClick);
    };
  }, [photoSelectMenu]);

  return (
    <div className="w-full h-full flex flex-col">
      <div
        className="relative rounded-t-lg bg-cover flex items-center justify-center p-8"
        style={{
          backgroundImage: "url(images/app_towtruck_bg.png)",
        }}
      >
        <div
          className="rounded-t-lg bg-cover"
          style={{
            backgroundImage: "url(images/app_towtruck_title.png)",
            width: "309px",
            height: "121px",
          }}
        ></div>
        <div className="absolute bottom-0 right-0 px-2 py-2">
          <div className="flex gap-2">
            <button
              onClick={() => setActivePage("home")}
              className={classNames(
                "border-2 p-1 rounded-lg bg-7B/40 shadow-lg hover:border-7B",
                {
                  "border-7B": activePage == "home",
                  "border-7B/40": activePage != "home",
                }
              )}
            >
              <MdHome className="w-5 h-5" />
            </button>
            <button
              onClick={() => setActivePage("rank")}
              className={classNames(
                "border-2 p-1 rounded-lg bg-FF7B7B/40 shadow-lg hover:border-FF7B7B",
                {
                  "border-FF7B7B": activePage == "rank",
                  "border-FF7B7B/40": activePage != "rank",
                }
              )}
            >
              <FaRankingStar className="w-5 h-5" />
            </button>
          </div>
        </div>
      </div>
      <div className="w-full h-full flex max-2xl:flex-col-reverse mt-3 overflow-auto scrollbar-hide">
        <div className="min-w-[368px] 2xl:max-w-[368px] grid max-2xl:grid-flow-col gap-3 overflow-auto scrollbar-hide mr-3">
          <div className="min-w-[300px]">
            <div
              className="rounded-t-md py-3 px-4"
              style={{
                background:
                  "linear-gradient(89deg, rgba(255, 255, 255, 0.15) 0%, rgba(40, 40, 40, 0.44) 100%)",
              }}
            >
              <div className="flex justify-between items-start">
                <div>
                  <h1 className="text-white/85 text-sm font-bold mb-2">
                    {locale.text_total_reputation}
                  </h1>
                  <div className="flex items-end">
                    <div className="relative">
                      <div
                        className="w-14 h-14 bg-cover bg-center"
                        id="playerProfilePhoto"
                        onClick={() => setPhotoSelectMenu(!photoSelectMenu)}
                        style={{
                          backgroundImage: `url(images/profiles/${playerProfile.photo}.png)`,
                        }}
                      ></div>
                      {photoSelectMenu && (
                        <div
                          id="photoSelectMenu"
                          className="absolute top-0 left-full border border-white/20 flex flex-col gap-2 items-center bg-43/95 p-2 z-10"
                        >
                          {[...Array(6)].map((_, index) => (
                            <div
                              key={index}
                              className="w-12 h-12 flex items-center border rounded-full overflow-hidden border-white/20 hover:border-white/80 cursor-pointer"
                              onClick={() => {
                                updatePlayerProfilePhoto(
                                  "profile_" + (index + 1)
                                );
                                setPhotoSelectMenu(false);
                              }}
                            >
                              <div
                                className="w-full h-full bg-cover bg-center"
                                style={{
                                  backgroundImage: `url(images/profiles/profile_${
                                    index + 1
                                  }.png)`,
                                }}
                              ></div>
                            </div>
                          ))}
                        </div>
                      )}
                    </div>
                    <div className="ml-2 w-full">
                      <h1 className="text-sm font-semibold">
                        {playerProfile.characterName}
                      </h1>
                      <h1 className="text-xs text-white font-semibold">
                        {locale.text_level} {playerProfile.level}
                      </h1>
                    </div>
                  </div>
                </div>
                <div>
                  <img src="images/icons/note.svg" alt="note" />
                </div>
              </div>
            </div>
            <div
              className="w-full rounded-b-md py-3 px-4"
              style={{ background: "rgba(16, 16, 16, 0.55)" }}
            >
              <div className="relative w-full">
                <div className="flex justify-between items-center mb-1">
                  <h1 className="text-[11px]">{locale.text_reputation}</h1>
                  <h1 className="text-[11px]">
                    {playerProfile.exp}
                    {" / "}
                    {playerProfile.nextLeveLExp}
                  </h1>
                </div>
                <div className="relative w-full mb-1">
                  <div className="w-full rounded-sm h-1 bg-43"></div>
                  <div
                    className="absolute top-0 bg-white h-1 rounded-sm"
                    style={{
                      width:
                        (playerProfile.exp / playerProfile.nextLeveLExp) * 100 +
                        "%",
                    }}
                  ></div>
                </div>
              </div>
            </div>
          </div>
          <div
            className="rounded-t-md py-3 px-4"
            style={{
              background:
                "linear-gradient(89deg, rgba(255, 255, 255, 0.12) 0%, rgba(40, 40, 40, 0.42) 100%)",
            }}
          >
            <div className="flex justify-between items-start mb-2">
              <div>
                <h1 className="text-white text-sm font-bold">
                  {locale.text_towtruck_about}
                </h1>
                <h1 className="text-xs text-white font-semibold">
                  {locale.text_victor_goods}
                </h1>
              </div>
              <div>
                <img src="images/icons/medal.svg" alt="medal" />
              </div>
            </div>
            <h1 className="text-sm mb-2 text-white/70">
              {locale.text_towtruck_description}
            </h1>
            <div
              className="relative w-full bg-cover bg-center bg-no-repeat h-[118px] flex items-center justify-center"
              style={{
                background: "url(images/info-bg.png)",
              }}
            >
              <img
                width={82}
                height={32}
                src="images/tawtruckservices.png"
                alt="tawtruckservices"
              />
            </div>
          </div>
          <div
            className="rounded-md h-[81px] w-[368px]"
            style={{
              background: "#040403",
            }}
          >
            <div
              className="h-full w-full bg-center bg-cover"
              style={{
                backgroundImage: "url(images/graph.png)",
              }}
            ></div>
          </div>
        </div>
        <div className="w-full max-2xl:overflow-auto max-2xl:mb-3 h-full">
          {activePage == "home" ? <Home /> : <Rank />}
        </div>
      </div>
    </div>
  );
};

export default AppTrowTuck;
