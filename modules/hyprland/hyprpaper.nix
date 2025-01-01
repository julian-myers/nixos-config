{ config, pkgs, ... }:
{
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [
				"~/Personal/pics/wallpapers/gruvbox/ss.png"
			];

			wallpaper = [
				"eDP-1, ~/Personal/pics/wallpapers/gruvbox/ss.png"
				"DP-1, ~/Personal/pics/wallpapers/gruvbox/ss.png"
				"HDMI-A-1, ~/Personal/pics/wallpapers/gruvbox/ss.png"
			];
		};
		package = pkgs.hyprpaper;
	};
}
