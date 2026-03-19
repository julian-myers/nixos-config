{stdenv, cmake, lib, ncurses, sqlite, spdlog, tomlplusplus, gtest}:
stdenv.stdenv.mkDerivation (finalAttrs: {
  pname = "quick-notes";
  version = "0.1.0";

  src = "~/Code/projects/TuiNotes/";

  nativeBuildInputs = [
   cmake 
  ];
  buildInputs = [
		spdlog
		sqlite
		tomlplusplus
		gtest
		ncurses
  ];
  meta = {
    description = "...";
    homepage = "";
    license = lib.licenses.mit;
  };
})
