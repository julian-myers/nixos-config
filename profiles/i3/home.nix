{ config, pkgs, ... }:
let
  powercontrols = import ../../scripts/powercontrols.nix { inherit pkgs; };
in 
{
	imports = [
		../../modules/zsh.nix
		../../modules/i3wm/i3wm.nix
		../../modules/i3wm/polybar.nix
		../../modules/i3wm/picom.nix
		../../modules/i3wm/rofi.nix
		../../modules/autorandr.nix
		../../modules/dunst.nix
		../../modules/kitty.nix
		../../modules/yazi/yazi.nix
		../../modules/packages/i3_packages.nix
		../../modules/packages/packages_all.nix
	];

  home.username = "julian-m";
  home.homeDirectory = "/home/julian-m";
  home.stateVersion = "24.11";

	nixpkgs.config = {
		allowUnfree = true;
	};

	programs.autorandr = {
		enable = true;
	};

	programs.git = {
		enable = true;
		userName = "julian-myers";
		userEmail = "myers254@marshall.edu";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

  home.sessionVariables = {
		EDITOR = "nvim";
		RASPI = "pi@192.168.6.216";
  };

  programs.home-manager.enable = true;
}
