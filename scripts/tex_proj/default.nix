{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "tex_proj";
  version = "0.1.0";

  src = ./.;

  buildPhase = ''
    runHook preBuild
    patchShebangs scripts
    runHook postBuild
  '';

	installPhase = ''
		runHook preInstall
		install -Dm755 ./tex_proj.sh "$out/bin/texinit"
		runHook postInstall
	'';
})
