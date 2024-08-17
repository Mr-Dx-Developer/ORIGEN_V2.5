import plugin from "tailwindcss/plugin";

/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        dark: "#121212",
        "0f": "#0f0f0f",
        46: "#464646",
        "2d": "#2d2d2d",
        "1db954": "#1db954",
        "0c0c0c": "#0c0c0c",
      },
      backgroundImage: {
        "gradient-15":
          "linear-gradient(180deg, rgba(15, 15, 15, 0.65) 0%, rgba(15, 15, 15, 0.65) 100%)",
      },
      fontFamily: {
        HighriseBold: "HighriseBold",
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
