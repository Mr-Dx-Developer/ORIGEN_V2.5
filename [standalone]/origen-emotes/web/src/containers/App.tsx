import React from "react";
import { debugData } from "../utils/debugData";
import Main from "./Main";

import backgroundDev from "../assets/backgroundDev.png";
import background from "../assets/background.png";
import background2 from "../assets/background2.png";

// This will set the NUI to visible if we are
// developing in browser
debugData([
	{
		action: "setVisible",
		data: true,
	},
]);

const App: React.FC = () => {
	return <div className="flex flex-col min-h-screen" style={{
		backgroundImage: `url(${background2})`,
		backgroundSize: "100% 100%",
		backgroundRepeat: "no-repeat",
		backgroundPosition: "center",
	}}><Main /></div>;
};

export default App;
