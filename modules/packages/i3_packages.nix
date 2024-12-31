{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		polybar
		rofi
		picom
		feh
		i3
	];
}
