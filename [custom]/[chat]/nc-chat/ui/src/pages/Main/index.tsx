import classNames from "classnames";
import { ChatInputPart } from "../../components/Chat/ChatInputPart";
import { MessageBox } from "../../components/Chat/MessageBox";
import useData from "../../hooks/useData";
import "./index.sass";
import { ThreeDTexts } from "../../components/ThreeDTexts";

export const Main: React.FC = () => {
  const { chatPosition } = useData();

  return (
    <>
      <div
        className={classNames("w-[520px] absolute top-[10%]", {
          "left-[2%]": chatPosition == "left",
          "right-[2%]": chatPosition == "right",
        })}
      >
        <div className="flex flex-col">
          <MessageBox />
          <ChatInputPart />
        </div>
      </div>
      <ThreeDTexts />
    </>
  );
};
