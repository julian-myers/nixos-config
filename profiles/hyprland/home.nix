{ config, pkgs, inputs, spicetify-nix, lib, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
	sources = import ./npins;
in 
{
	imports = [
		../../modules/packages/packages_all.nix
		../../modules/packages/hyprland_packages.nix
		../../modules/dunst.nix 
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
		spicetify-nix.homeManagerModules.default
		(sources.catppuccin + "modules/home-manager")
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
		style = {
			name = "Dracula";
			package = pkgs.dracula-qt5-theme;
		};
		platformTheme.name = "adwaita";
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



	systemd.user.services.waybar = {
		Install.WantedBy = [ "graphical-session.target" ]; 
		ServiceConfig = {
			Description = "Waybar for all connected monitors";
			After = [ "graphical-session.target" ];
			Wants = [ "graphical-session.target" ];
			ExecStartPre = "${pkgs.coreutils}/bin/pkill waybar || true";
			ExecStart = "${pkgs.bash}/bin/bash -c 'for mon in $(${pkgs.hyprland}/bin/hyprctl monitors | grep \"Monitor\" | awk \"{print $2}\"); do WAYBAR_MONITOR=$mon ${pkgs.waybar}/bin/waybar & done'";
			Restart = "always";
		};

	};

	catppuccin = {
		enable = true;
		gtk.enable = true;
		gtk.accent = "blue";
		gtk.flavor = "mocha";
		gtk.icon.accent = "blue";
		gtk.icon.enable = true;
	};
}
