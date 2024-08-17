import useData from "../../../../../hooks/useData";
import useLocales from "../../../../../hooks/useLocales";

export const Rank: React.FC = () => {
  const { locale } = useLocales();
  const { topRank, jobSettings } = useData();

  return (
    <>
      <div className="w-full h-full flex flex-col">
        <div className="flex-shrink-0 w-full bg-white/[0.09] rounded-t-lg py-3">
          <div className="flex">
            <h1 className="font-medium text-xs pl-3 pr-2">
              {locale.rank_text_avatar}
            </h1>
            <h1 className="font-medium text-xs px-4 pr-6">
              {locale.rank_text_name}
            </h1>
            <h1 className="font-medium text-xs px-10">
              {locale.rank_text_level}
            </h1>
            <h1 className="font-medium text-xs pl-28">
              {locale.rank_text_exp}
            </h1>
          </div>
        </div>
        <div className="w-full rounded-b-lg bg-white/[0.04] p-3 overflow-auto h-full">
          <div className="w-full flex flex-col gap-3 overflow-auto">
            {Object.values(topRank).map((value, index) => {
              const nextLeveLExp = jobSettings.ranks[value.level] ?? value.exp;
              return (
                <div
                  key={index}
                  className="h-[52px] rounded-[3px] bg-white/[0.12] flex overflow-auto scrollbar-hide"
                >
                  <div className="min-w-12 min-h-12 bg-white/10 overflow-hidden">
                    <div
                      className="w-12 h-12 bg-cover bg-center overflow-hidden rounded-full"
                      style={{
                        backgroundImage: `url(images/profiles/${value.photo}.png)`,
                      }}
                    ></div>
                  </div>
                  <div className="px-4 flex items-center h-full w-[150px] overflow-auto">
                    <h1 className="text-white text-sm font-semibold whitespace-nowrap">
                      {value.characterName}
                    </h1>
                  </div>
                  <div className="h-full min-w-[160px] flex items-center select-none">
                    <div className="h-8 w-full flex-shrink-0 rounded-sm border border-FF7B7B bg-ffborder-FF7B7B/10 flex items-center justify-center">
                      <h1 className="font-semibold text-FF7B7B border-FF7B7B text-sm">
                        Lv. {value.level}
                      </h1>
                    </div>
                  </div>
                  <div className="px-4 h-full w-full flex items-center">
                    <div className="h-8 w-full flex-shrink-0 rounded-sm border border-7C bg-white/10 flex items-center justify-center px-4">
                      <div className="relative w-full">
                        <div
                          title={(nextLeveLExp - value.exp).toString()}
                          className="w-full rounded-sm h-[6px] bg-43"
                        ></div>
                        <div
                          title={value.exp.toString()}
                          className="absolute top-0 bg-white h-[6px] rounded-sm"
                          style={{
                            width: (value.exp / nextLeveLExp) * 100 + "%",
                          }}
                        ></div>
                      </div>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </div>
    </>
  );
};
