import React, { useEffect, useState } from "react";
import { DragDropContext } from "react-beautiful-dnd";
import { useNavigationState } from "../atoms/navigationAtom";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { fetchNui } from "../utils/fetchNui";
import EmotesList from "./EmotesList";
import FavoriteEmotes from "./FavoriteEmotes";
import Header from "./Header";
import NavBar from "./NavBar";

const Main = () => {
	const [navigationState, setNavigationState] = useNavigationState();

	const [emotesList, setEmotesList] = useState<any>(undefined);

	useNuiEvent("setPage", (data) => {
		setNavigationState({path: data});
	});

	useNuiEvent("setEmotes", (data) => {
		setEmotesList(data);

		if (!navigationState.path) {
			setNavigationState({path: "Dances"})
		}
	})

	useNuiEvent("hotBar", (data) => {
		fetchNui("playEmote", {emoteName: localStorage.getItem(data.key), type: localStorage.getItem(`${data.key}-type`)})
	});

	const onDragEnd = (result: any) => {
		if (result.destination && result.destination.droppableId.startsWith("hotbar-")) {
			const hotbarIndex = parseInt(result.destination.droppableId.split("-")[1]);
			const emoteIndex = result.draggableId;

			localStorage.setItem(`hotbar-${hotbarIndex}`, emoteIndex.toString());
			localStorage.setItem(`hotbar-${hotbarIndex}-type`, navigationState.path);
		}
	}

	const [searchValue, setSearchValue] = useState("");

	return (
		<>
			<div style={{
				position: "absolute",
				width: "100%",
				height: "100%",
				/* backgroundColor: "rgba(0, 0, 0, 0.5)", */

				display: "flex",
				flexDirection: "column",
				justifyContent: "flex-start",
				alignItems: "flex-start",
			}}>
				<Header emotes={emotesList} setEmotes={setEmotesList} searchValue={searchValue} setSearchValue={setSearchValue} />

				<div style={{
					width: "100%",
					height: "84%",

					display: "flex",
					flexDirection: "row",
					justifyContent: "flex-start",
					alignItems: "flex-start",
				}}>
					{
						emotesList && <NavBar emotes={emotesList} />
					}


					<DragDropContext onDragEnd={onDragEnd}>
						<div style={{
							width: "100%",
							height: "100%",

							display: "flex",
							flexDirection: "column",
							justifyContent: "flex-start",
							alignItems: "flex-start",

							/* backgroundColor: "rgb(255, 0, 0, 0.5)", */

							marginLeft: "0.35%",
							marginRight: "3.5%",
						}}>
							{
								emotesList && (
									<>
										<EmotesList emotes={emotesList} searchValue={searchValue} />
										<FavoriteEmotes />
									</>
								)
							}
						</div>
					</DragDropContext>
				</div>
			</div>
		</>
	);
};

export default Main;
