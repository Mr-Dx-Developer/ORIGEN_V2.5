import { useState } from "react";

export const LoagImage: React.FC<{ src: string }> = ({ src }) => {
  const [loaded, setLoaded] = useState(false);

  return (
    <>
      {!loaded && <h1 className="text-white/80">...</h1>}
      <img
        style={{ display: loaded ? "block" : "none" }}
        className="max-w-96 max-h-96 w-full h-full"
        src={src}
        onLoad={() => setLoaded(true)}
        alt="custom-image"
      />
    </>
  );
};
