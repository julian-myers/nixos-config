{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		hyprpicker
		waybar
		nwg-displays
	];
}
