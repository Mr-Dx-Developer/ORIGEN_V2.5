import { MessageProps } from "../../../types/BasicTypes";
import { BalanceInfoMessage } from "./balanceinfo";
import { JobInfoMessage } from "./jobinfo";

export const SpecialMessage: React.FC<{ message: MessageProps }> = ({
  message,
}) => {

  return (
    <>
      {message?.specialMessage == "job" && <JobInfoMessage message={message} />}
      {message?.specialMessage == "balance" && (
        <BalanceInfoMessage message={message} />
      )}
    </>
  );
};
