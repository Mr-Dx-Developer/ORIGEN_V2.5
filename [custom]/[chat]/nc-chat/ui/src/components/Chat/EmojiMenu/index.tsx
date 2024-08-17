import { emojiList } from "./emoji.ts";

type EmojiMenuProps = {
  onClickEmoji: (
    event: React.MouseEvent<HTMLButtonElement>,
    emoji: string
  ) => void;
};

export const EmojiMenu: React.FC<EmojiMenuProps> = ({ onClickEmoji }) => {
  const emojies = emojiList;
  return (
    <>
      <div
        id="emoji-menu"
        className="p-1 overflow-y-auto overflow-x-hidden flex justify-between items-start flex-wrap w-[210px] h-[250px] bg-gradient-15 border border-black/20 rounded"
      >
        {emojies.map((emoji, i) => (
          <button type="button" key={i} onClick={(e) => onClickEmoji(e, emoji)}>
            {emoji}
          </button>
        ))}
      </div>
    </>
  );
};
