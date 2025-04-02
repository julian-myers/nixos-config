{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		eww
		lutgen
		drawing
		networkmanagerapplet
		grim
		hyprpicker
		waybar
		kanshi
		wl-clipboard
		catppuccinifier-gui
		catppuccinifier-cli
	];
}
