{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		watershot
		hyprpicker
		waybar
		nwg-displays
		kanshi
	];
}
