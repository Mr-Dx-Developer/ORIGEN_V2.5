import useData from "../../../hooks/useData";
import useLocales from "../../../hooks/useLocales";
import classNames from "classnames";

type HotBarProps = {
  onClickHotbar: (
    event: React.MouseEvent<HTMLButtonElement>,
    command: string
  ) => void;
};

export const HotBar: React.FC<HotBarProps> = ({ onClickHotbar }) => {
  const { hotbarItems, activeHotbar, setActiveHotbar } = useData();
  const { _t } = useLocales();

  const handleHotbarClick = (
    e: React.MouseEvent<HTMLButtonElement>,
    command: string
  ) => {
    e.preventDefault();
    setActiveHotbar(command);
    onClickHotbar(e, command !== "" ? "/" + command + " " : command);
  };

  return (
    <>
      <div className="flex items-center justify-between">
        <button
          className={classNames(
            "w-full border-b-2 transition-colors h-[30px] hover:bg-2d/70 hover:border-b-white",
            {
              "border-b-white bg-2d/70": activeHotbar === "",
              "border-b-46 bg-0f/70": activeHotbar !== "",
            }
          )}
          type="button"
          onClick={(e) => handleHotbarClick(e, "")}
        >
          <h1 className="uppercase text-white font-medium text-[11px]">
            {_t("hotbar_item_global")}
          </h1>
        </button>
        {hotbarItems.map((item, i) => (
          <button
            className={classNames(
              "w-full border-b-2 transition-colors h-[30px] hover:bg-2d/70 hover:border-b-white",
              {
                "border-b-white bg-2d/70": activeHotbar === item.command,
                "border-b-46 bg-0f/70": activeHotbar !== item.command,
              }
            )}
            type="button"
            key={i}
            onClick={(e) => handleHotbarClick(e, item.command)}
          >
            <h1 className="uppercase text-white font-medium text-[11px]">
              {item.label}
            </h1>
          </button>
        ))}
      </div>
    </>
  );
};
