import ReactDOM from "react-dom/client";
import App from "./components/App";
import { VisibilityProvider } from "./providers/VisibilityProvider";
import RouterProvider from "./providers/RouterProvider";
import LocaleProvider from "./providers/LocaleProvider";
import { DataProvider } from "./providers/DataProvider";
import "./index.css";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <>
    <VisibilityProvider>
      <RouterProvider>
        <LocaleProvider>
          <DataProvider>
            <App />
          </DataProvider>
        </LocaleProvider>
      </RouterProvider>
    </VisibilityProvider>
  </>
);
