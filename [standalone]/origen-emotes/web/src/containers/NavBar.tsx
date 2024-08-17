import { useState } from "react";
import navbutton1 from "../assets/navbutton1.png";
import navbutton2 from "../assets/navbutton2.png";
import navbutton1_hover from "../assets/navbutton1_hover.png";
import navbutton2_hover from "../assets/navbutton2_hover.png";
import number from "../assets/number.png";
import number_hover from "../assets/number_hover.png";
import { useNavigationState } from "../atoms/navigationAtom";

const NavBar: React.FC<{
    emotes: any;
}> = ({
    emotes
}) => {
    const [activeButton, setActiveButton] = useState<number | boolean>(false);

    const [navigationState, setNavigationState] = useNavigationState();

    return (
        <div style={{
            width: "44vh",
            minWidth: "32vh",
            height: "100%",
            marginLeft: "3.65%",
            /* backgroundColor: "rgba(255, 0, 0, 0.5)", */

            overflowY: "scroll",
        }}>
            {
                Object.entries(emotes)
                .sort(([keyA, buttonA]: [any, any], [keyB, buttonB]: [any, any]) => {
                    if (keyA < keyB) {
                        return -1;
                    }
                    if (keyA > keyB) {
                        return 1;
                    }
                    return 0;
                })
                .map(([key, button]: [any, any], index) => {
                    return (
                        <>
                            <div style={{
                                backgroundImage: activeButton === key || navigationState.path === key ? `url(${index % 2 > 0 ? navbutton2_hover : navbutton1_hover})` : `url(${index % 2 > 0 ? navbutton2 : navbutton1})`,
                                backgroundSize: "contain",
                                backgroundRepeat: "no-repeat",
                                backgroundPosition: "center",
                                width: "100%",
                                height: "13.8%",
                                marginBottom: index % 2 > 0 ? "1%" : "-2%",

                                cursor: "pointer",

                                display: "flex",
                                flexDirection: "row",
                                justifyContent: "space-between",
                                alignItems: "center",
                            }}
                            onMouseEnter={() => setActiveButton(key)}
                            onMouseLeave={() => setActiveButton(false)}
                            onClick={() => setNavigationState({path: key})}
                            >
                                <div style={{
                                    fontFamily: "SVRP",
                                    fontWeight: "400",
                                    fontSize: "3.35vh",
                                    textTransform: "uppercase",

                                    color: activeButton === key || navigationState.path === key ? "#2D3342" : "#FFFFFF",

                                    marginLeft: "4vh",

                                    userSelect: "none",
                                }}>
                                    {key}
                                </div>

                                <div style={{
                                    backgroundImage: activeButton === key || navigationState.path === key ? `url(${number_hover})` : `url(${number})`,
                                    backgroundSize: "contain",
                                    backgroundRepeat: "no-repeat",
                                    backgroundPosition: "center",
                                    width: "6vh",
                                    height: "6vh",

                                    marginRight: "1.5vh",

                                    display: "flex",
                                    justifyContent: "center",
                                    alignItems: "center",
                                }}>
                                    <div style={{
                                        fontFamily: "SVRP",
                                        fontWeight: "400",
                                        fontSize: "2vh",
                                        textTransform: "uppercase",

                                        color: "#FFFFFF",

                                        marginRight: "2vh",

                                        userSelect: "none",
                                    }}>
                                        {Object.entries(button).length}
                                    </div>
                                </div>
                            </div>
                        </>
                    )
                })
            }
        </div>
    )
}

export default NavBar;