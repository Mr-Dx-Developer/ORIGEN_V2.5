import Emotes from "../components/Emotes";
import HeaderEmotesList from "../components/HeaderEmotesList";

const EmotesList: React.FC<{
    emotes: any;
    searchValue: any;
}> = ({
    emotes,
    searchValue
}) => {
    return (
        <>
            <div style={{
                position: "relative",
                width: "100%",
                height: "73%",

                background: "rgba(0, 0, 0, 0.35)",
            }}>
                <HeaderEmotesList emotes={emotes} />
                <Emotes emotes={emotes} searchValue={searchValue} />
            </div>
        </>
    )
}

export default EmotesList;