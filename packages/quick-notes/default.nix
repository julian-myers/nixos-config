{stdenv, cmake, lib, ncurses, sqlite, spdlog, tomplusplus, gtest}:
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
		tomplusplus
		gtest
		ncurses
  ];
  meta = {
    description = "...";
    homepage = "";
    license = lib.licenses.mit;
  };
})
