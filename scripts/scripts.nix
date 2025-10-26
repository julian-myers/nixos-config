{ pkgs, ... }:
{
	home.packages = [
		(pkgs.writeShellScriptBin "texinit" (builtins.readFile ./texinit.sh))
	];
}
