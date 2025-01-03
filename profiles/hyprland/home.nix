{ config, pkgs, inputs, ... }:
{
	imports = [
		../../modules/packages/packages_all.nix
		../../modules/packages/hyprland_packages.nix

		../../modules/dunst.nix 
		../../modules/kitty.nix 
		../../modules/zsh.nix 
		../../modules/yazi/yazi.nix
		../../modules/i3wm/rofi.nix

		../../modules/hyprland/hyprland.nix
		../../modules/hyprland/waybar.nix
		../../modules/hyprland/hyprpaper.nix
	];

	security.pam.services.hyprlock = {};

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	home.username  = "julian-m";
	home.homeDirectory = "/home/julian-m";
	home.stateVersion = "24.11";
	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		userName = "julian-myers";
		userEmail = "myers254@marshall.edu";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

	nixpkgs.config = {
		allowUnfree = true;
	};
}
