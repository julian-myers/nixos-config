{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		qalculate-gtk
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
		plantuml
	];
}
