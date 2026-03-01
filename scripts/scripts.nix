{ pkgs, ... }:
{
	home.packages = [
		(pkgs.writeShellScriptBin "texinit" (builtins.readFile ./texinit.sh))
		(pkgs.callPackage ./cpp_init.nix {})
	];
}
