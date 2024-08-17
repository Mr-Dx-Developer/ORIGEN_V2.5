import { useState } from "react";
import searchBar from "../assets/searchBar.png";
import { useNavigationState } from "../atoms/navigationAtom";

const Header: React.FC<{
    emotes: any;
    setEmotes: any;
    searchValue: any;
    setSearchValue: any;
}> = ({
    emotes,
    setEmotes,
    searchValue,
    setSearchValue,
}) => {

    const [navigationState, setNavigationState] = useNavigationState();

    return (
        <>
            <div style={{
                width: "100%",
                height: "16%",
                /* backgroundColor: "rgba(255, 255, 255, 0.5)", */
            }}>
                <div style={{
                    display: "flex",
                    flexDirection: "row",
                    justifyContent: "flex-start",
                    alignItems: "center",
                    height: "100%",
                    width: "100%",

                    paddingLeft: "3.5%",
                    paddingTop: "1.4%",

                    gap: "4vh",
                }}>
                    <div style={{
                        fontFamily: "SVRP",
                        fontWeight: "400",
                        fontSize: "7.95vh",
                        textTransform: "uppercase",

                        color: "#FFFFFF",

                        userSelect: "none",
                    }}>Emote Menu</div>

                    <div style={{
                        backgroundImage: `url(${searchBar})`,
                        backgroundSize: "contain",
                        backgroundRepeat: "no-repeat",
                        backgroundPosition: "center",
                        width: "42vh",
                        height: "6.5vh",

                        marginBottom: "0.5%",

                        display: "flex",
                        flexDirection: "row",
                        justifyContent: "flex-start",
                        alignItems: "center",
                    }}>
                        <input type="text"
                            style={{
                                fontFamily: "SVRP",
                                fontWeight: "400",
                                fontSize: "1.9vh",
                                textTransform: "uppercase",
    
                                color: searchValue.length > 0 ? "#FFFFFF" : "rgba(255, 255, 255, 0.5)",
    
                                marginLeft: "5.5%",

                                width: "100%",

                                backgroundColor: "transparent",
                                border: "none",

                                outline: "none",

                            }}
                            onChange={(e) => {
                                setSearchValue(e.target.value);
                            }}

                            placeholder="Search Emote"
                            value={searchValue}
                        />
                    </div>
                </div>
            </div>
        </>
    )
}

export default Header;