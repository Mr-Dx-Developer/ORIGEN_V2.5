import { useEffect, useState } from "react";
import emoteContainer from "../assets/emoteContainer.png";
import emoteContainer_hover from "../assets/emoteContainer_hover.png";
import imageTemplate from "../assets/imageTemplate.png";
import { useNavigationState } from "../atoms/navigationAtom";
import { fetchNui } from "../utils/fetchNui";
import { Draggable } from "react-beautiful-dnd";
import { StrictModeDroppable } from "./StrictModeDroppable";
import RenderIfVisible from 'react-render-if-visible'
import "./Emotes.scss"

const Emotes: React.FC<{
    emotes: any;
    searchValue: any;
}> = ({
    emotes,
    searchValue,
}) => {

    const [navigationState, setNavigationState] = useNavigationState();

    const [hoveredEmote, setHoveredEmote] = useState<any>(null);

    return (
        <div style={{
            width: "100%",
            height: "90%",

            overflowY: "scroll",
        }}
        >
            <div style={{
                display: "grid",
                gridTemplateColumns: "repeat(auto-fill, minmax(30vh,1fr))",
                gridColumnGap: "1.2%",
                gridRowGap: "2vh",

                paddingLeft: "2%",
                paddingRight: "2%",
                paddingTop: "1%",
            }}
            >
                {
                    Object.entries(emotes[navigationState.path])
                    .sort(([keyA, emoteA]: [any, any], [keyB, emoteB]: [any, any]) => {
                        if (keyA < keyB) {
                            return -1;
                        }
                        if (keyA > keyB) {
                            return 1;
                        }
                        return 0;
                    })
                    .filter(([key, emote]: [any, any]) => {
                        return key.toLowerCase().includes(searchValue.toLowerCase());
                    })
                    .map(([key, emote]: [any, any], index) => {
                        return (
                            <StrictModeDroppable droppableId={`emote-${index}`}>
                            {(provided, snapshot) => (
                                <div style={{
                                    width: "30vh",
                                    height: "20.5vh",
                                    
                                    cursor: "pointer",
                                }}
                                    onClick={() => {fetchNui("playEmote", {emoteName: key, type: navigationState.path})}}
                                    {...provided.droppableProps}  
                                    ref={provided.innerRef}  
                                    >
                                    <RenderIfVisible defaultHeight={500}>
                                    <div className="container">                                    
                                        <div style={{
                                            width: "100%",
                                            height: "100%",
                                            
                                            display: "flex",
                                            flexDirection: "column",
                                            justifyContent: "space-between",
                                            alignItems: "center",
                                        }}>
                                            <div style={{
                                                fontFamily: "SVRP",
                                                fontWeight: "400",
                                                fontSize: "2.2vh",
                                                textTransform: "uppercase",

                                                marginRight: "90%",
                                                marginTop: "2%",

                                                userSelect: "none",
                                            }}>
                                                {index + 1}
                                            </div>

                                                <Draggable key={key} draggableId={key} index={index}>  
                                                {(provided, snapshot) => (
                                                    <div style={{
                                                        width: "8vh",
                                                        height: "10vh",
                                                        backgroundImage: `url(${imageTemplate})`,
                                                        backgroundSize: "contain",
                                                        backgroundRepeat: "no-repeat",
                                                        backgroundPosition: "center",

                                                        marginBottom: "15%",
                                                    }}
                                                    ref={provided.innerRef}
                                                    {...provided.draggableProps}
                                                    {...provided.dragHandleProps}
                                                    >
                                                        <div style={{
                                                            width: "8vh",
                                                            height: "10vh",
                                                            backgroundImage: `url(${imageTemplate})`,
                                                            backgroundSize: "contain",
                                                            backgroundRepeat: "no-repeat",
                                                            backgroundPosition: "center",

                                                            marginBottom: "15%",
                                                        }}>
                                                        </div>
                                                    </div>
                                                )}
                                                </Draggable>

                                            <div style={{
                                                width: "15vh",

                                                fontFamily: "SVRP",
                                                fontWeight: "400",
                                                fontSize: "2.2vh",
                                                textTransform: "uppercase",

                                                color: "#FFFFFF",

                                                marginRight: "40%",
                                                marginBottom: "4.6%",

                                                userSelect: "none",
                                            }}>
                                                {navigationState.path === "Walks" ? "/walk" : "/e"} {key}
                                            </div>
                                        </div>
                                    </div>
                                    </RenderIfVisible>
                                    </div>

                            )}

                            </StrictModeDroppable>
                        )}
                    )
                }
            </div>
        </div>
    )
}

export default Emotes;