import plugin from "tailwindcss/plugin";

/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        dark: "#121212",
        "4B": "#4B4B4B",
        "0B": "#0B0B0B",
        43: "#434343",
        "7B": "#7BFF98",
        "7C": "#7C7C7C",
        FF7B7B: "#FF7B7B",
        "45FFBC": "#45FFBC",
        FF5A5A: "#FF5A5A",
        fea71c: "#fea71c",
      },
    },
  },
  plugins: [
    plugin(function ({ addUtilities }) {
      const newUtilities = {
        ".scrollbar-hide::-webkit-scrollbar": { display: "none" },
        ".scrollbar-hide": {
          "scrollbar-width": "none",
          "-ms-overflow-style": "none",
        },
      };
      addUtilities(newUtilities);
    }),
  ],
};
