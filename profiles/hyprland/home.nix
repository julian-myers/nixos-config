{ config, pkgs, inputs, spicetify-nix, lib, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in 
{
	imports = [
		../../modules/packages/packages_all.nix
		../../modules/packages/hyprland_packages.nix
		#../../modules/dunst.nix 
		../../modules/kitty.nix 
		../../modules/zsh.nix 
		../../modules/yazi/yazi.nix
		../../modules/hyprland/rofi.nix
		../../modules/hyprland/hyprland.nix
		../../modules/hyprland/waybar.nix
		../../modules/hyprland/hyprpaper.nix
		../../modules/hyprland/hyprlock.nix
		../../modules/hyprland/hypridle.nix
		../../modules/gtk.nix
		../../modules/steam.nix
		spicetify-nix.homeManagerModules.default
	];
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

	services.cliphist = {
		enable = true;
		package = pkgs.cliphist;
		allowImages = true;
	};

	qt = {
		enable = true;
	};
	
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
 	];

	programs.spicetify = {
		enable = true;
		theme = spicePkgs.themes.dribbblish;
		colorScheme = "catppuccin-mocha";
	};

	xdg.desktopEntries = {
		spotify = {
			name = "Spiced Spotify";
			exec = "spotify";
			icon = "spotify";
			type = "Application";
		};
	};
}
