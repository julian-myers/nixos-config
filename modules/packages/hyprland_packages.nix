{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		drawing
		networkmanagerapplet
		grim
		hyprpicker
		waybar
		kanshi
	];
}
