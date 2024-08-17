import { useNavigationState } from "../atoms/navigationAtom";

const HeaderEmotesList: React.FC<{
    emotes: any
}> = ({
    emotes
}) => {
    const [navigationState, setNavigationState] = useNavigationState();

    return (
        <>
            <div style={{
                width: "100%",
                height: "10%",
                
                /* backgroundColor: "rgba(0, 255, 0, 0.5)", */

                display: "flex",
                justifyContent: "flex-start",
                alignItems: "center",
            }}>
                <div style={{
                    fontFamily: "SVRP",
                    fontWeight: "400",
                    fontSize: "3.35vh",
                    textTransform: "uppercase",

                    color: "#FFFFFF",

                    marginLeft: "2.5vh",
                    marginTop: "1.6vh",

                    userSelect: "none",
                }}>
                    {navigationState.path} — {Object.entries(emotes[navigationState.path]).length}
                </div>
            </div>
        </>
    )
}

export default HeaderEmotesList;