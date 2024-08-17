import useData from "../../../hooks/useData";
import { SuggestionProps } from "../../../types/BasicTypes";

export const Suggestions: React.FC<{ inputValue: string }> = ({
  inputValue,
}) => {
  const { defaultSuggestions, commandList } = useData();

  let newSuggestion: SuggestionProps[] = [];
  if (inputValue === "/") {
    newSuggestion = defaultSuggestions;
  } else if (inputValue.startsWith("/")) {
    const commandFilter = commandList.filter(
      (com) =>
        com.name.startsWith(inputValue.slice(1)) &&
        !defaultSuggestions.some((def: any) => def.name === com.name)
    );
    newSuggestion = commandFilter.slice(0, 10).map((com) => ({
      name: com.name,
      description: com.description,
      args: "",
    }));
  }

  return (
    <>
      {inputValue.length > 0 && newSuggestion.length > 0 && (
        <div className="w-full flex flex-col justify-center items-start mt-2 gap-1.5">
          {newSuggestion.map((item, i) => (
            <div
              key={i}
              className="flex items-center gap-2 cursor-pointer py-0.5 bg-black/65 overflow-hidden whitespace-nowrap text-ellipsis max-w-[440px] group pr-4 pl-1 border-l-4 border-l-black/30"
            >
              <div className="sug-icon">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="12"
                  height="12"
                  viewBox="0 0 6 9"
                  fill="none"
                >
                  <path
                    fillRule="evenodd"
                    clipRule="evenodd"
                    d="M3.00054 6.87157C3.63856 6.87157 4.15602 7.34815 4.15602 7.93578C4.15602 8.52342 3.63856 9 3.00054 9C2.36251 9 1.84505 8.52342 1.84505 7.93578C1.84505 7.34815 2.36251 6.87157 3.00054 6.87157Z"
                    fill="white"
                    fillOpacity="0.18"
                  />
                  <path
                    fillRule="evenodd"
                    clipRule="evenodd"
                    d="M0.00358194 2.63888C0.036922 1.94798 0.348401 1.29809 0.87933 0.809308C1.4436 0.28961 2.2022 0 3.00031 0C3.79841 0 4.55701 0.28961 5.12128 0.809308C5.68555 1.3288 6 2.02769 6 2.76275C6 3.26331 5.85225 3.75041 5.57297 4.17967C5.29392 4.60873 4.89179 4.96101 4.41292 5.1972C4.27499 5.26534 4.1567 5.36167 4.07609 5.48597C3.99526 5.61005 3.96146 5.7537 3.96146 5.89735V6.11798C3.96146 6.19748 3.89113 6.26226 3.80504 6.26226H2.19558C2.10949 6.26226 2.03915 6.19748 2.03915 6.11798V5.89735C2.03915 5.43128 2.17023 4.97889 2.43033 4.57907C2.69065 4.17841 3.06402 3.8602 3.51023 3.64C3.68264 3.55503 3.82696 3.42715 3.92743 3.27257C4.02768 3.11819 4.07746 2.94237 4.07746 2.76275C4.07746 2.49859 3.96489 2.24789 3.7621 2.06113C3.5591 1.87436 3.28712 1.77068 3.00031 1.77068C2.71349 1.77068 2.44129 1.87436 2.23851 2.06113C2.05605 2.22917 1.9453 2.45043 1.92612 2.68746L1.92064 2.75455C1.91447 2.8309 1.84505 2.88937 1.76193 2.8881L0.153841 2.86265C0.109996 2.86181 0.0725456 2.84667 0.0426309 2.81723C0.0124878 2.78778 -0.00167027 2.75245 0.000156587 2.71207L0.00358194 2.63888Z"
                    fill="white"
                    fillOpacity="0.18"
                  />
                </svg>
              </div>
              <h1 className="text-white/65 text-ellipsis overflow-hidden lowercase group-hover:text-white">
                /{item.name}{" "}
                <span className="ml-0.5 text-sm text-white/50 group-hover:text-white">
                  {item.description}
                </span>
              </h1>
            </div>
          ))}
        </div>
      )}
    </>
  );
};
