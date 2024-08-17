import ReactDOM from "react-dom/client";
import App from "./components/App";
import { VisibilityProvider } from "./providers/VisibilityProvider";
import RouterProvider from "./providers/RouterProvider";
import LocaleProvider from "./providers/LocaleProvider";
import { DataProvider } from "./providers/DataProvider";
import "./index.css";
import { DndProvider } from "react-dnd";
import { HTML5Backend } from "react-dnd-html5-backend";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <>
    <VisibilityProvider>
      <RouterProvider>
        <LocaleProvider>
          <DataProvider>
            <DndProvider backend={HTML5Backend}>
              <App />
            </DndProvider>
          </DataProvider>
        </LocaleProvider>
      </RouterProvider>
    </VisibilityProvider>
  </>
);
