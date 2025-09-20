{
  description = "Flake for making my bash scripts executable from anywhere";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
	let
		system = "x86_64-linux";
	  pkgs = import nixpkgs {  system="x86_64-linux"; };
		script-name = "texinit";
		texinit = (pkgs.writeScriptBin script-name (builtins.readFile ./tex_proj/tex_proj.sh));
	in 
	rec {
		defaultPackage = packages.${system}.texinit;
		packages.${system}.texinit = pkgs.symlinkJoin{
			name = script-name;
			paths = [ texinit ];
			buildInputs = [ pkgs.makeWrapper ];
			postBuild = "wrapProgram $out/bin/${script-name} --prefix PATH : $out/bin";
		};
  };
}
