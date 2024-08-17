import { useState } from "react";
import favorite_emotes from "../assets/favorite_emotes.png";
import favorite_emotes_active from "../assets/favorite_emotes_active.png";
import { StrictModeDroppable } from "../components/StrictModeDroppable";
import imageTemplate from "../assets/imageTemplate.png";

const FavoriteEmotes: React.FC = () => {
    /* localStorage.clear() */

    return (
            <div style={{
                width: "100%",
                height: "37%",

                /* backgroundColor: "rgb(0, 255, 255, 0.5)", */

                display: "flex",
                flexDirection: "row",
                justifyContent: "flex-start",
                alignItems: "flex-start",

                paddingTop: "3%",
                paddingLeft: "1%",

                gap: "0.7%",
            }}
            >
                {
                    [1, 2, 3, 4, 5, 6, 7, 8, 9].map((item, index) => {
                        return (
                        <StrictModeDroppable droppableId={`hotbar-${index}`}>
                        {(provided, snapshot) => (
                            <div style={{
                                width: "13.5vh",
                                height: "13.5vh",
                                
                                backgroundImage: localStorage.getItem(`hotbar-${index}`) ? `url(${favorite_emotes_active})` : `url(${favorite_emotes})`,
                                backgroundSize: "contain",
                                backgroundRepeat: "no-repeat",
                                backgroundPosition: "center",

                                display: "flex",
                                flexDirection: "column",
                                justifyContent: "flex-start",
                                alignItems: "center",
                            }}
                            {...provided.droppableProps}  
                            ref={provided.innerRef}  
                            >
                                <div style={{
                                    fontFamily: "SVRP",
                                    fontWeight: "400",
                                    fontSize: "2.2vh",
                                    textTransform: "uppercase",


                                    marginTop: "5%",
                                    marginLeft: "47.5%",

                                    color: "#FFFFFF",
                                    userSelect: "none",
                                }}>
                                    ALT+{index + 1}
                                </div>

                                
                                {
                                    localStorage.getItem(`hotbar-${index}`) && (
                                        <div style={{
                                            width: "100%",
                                            height: "100%",
                                            display: "flex",
                                            flexDirection: "column",
                                            justifyContent: "center",
                                            alignItems: "center",
                                        }}>
                                            <div style={{
                                                width: "5vh",
                                                height: "7vh",
                                                backgroundImage: `url(${imageTemplate})`,
                                                backgroundSize: "contain",
                                                backgroundRepeat: "no-repeat",
                                                backgroundPosition: "center",

                                                marginTop: "-5%"
                                            }}>
                                            </div>

                                            <div style={{
                                                fontFamily: "SVRP",
                                                fontWeight: "400",
                                                fontSize: "2vh",
                                                textTransform: "uppercase",

                                                color: "#FFFFFF",

                                                userSelect: "none",
                                            }}>
                                                {localStorage.getItem(`hotbar-${index}`)}
                                            </div>
                                        </div>
                                    )
                                }
                            </div>
                        )}
                        </StrictModeDroppable>
                        )
                    })
                }
            </div>
    )
}

export default FavoriteEmotes;