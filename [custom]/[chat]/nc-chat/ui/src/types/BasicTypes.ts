export type HotbarItemProps = {
  command: string;
  label: string;
};

export type MessageProps = {
  type: string;
  color: string;
  borderColor: string;
  header: string;
  content: string;
  time: string;
  args: string[];
  specialMessage?: string;
  [key: string]: any;
};

export type PlayingSongProps = {
  active: boolean;
  title: string;
};

export type SuggestionProps = {
  name: string;
  description: string;
  args: string;
};

export type CommandProps = {
  name: string;
  description: string;
};

export type TypeColorProps = {
  [key: string]: {
    color: string;
    background: string;
  };
};

export type Text3DProps = {
  source: number;
  screenX: number;
  screenY: number;
  text: string;
  type: "me" | "do" | "roll-the-dice" | "rps";
  diceValue?: number;
  rpsValue?: "rock" | "paper" | "scissors";
  extra?: any;
  meDoPP: string;
};
