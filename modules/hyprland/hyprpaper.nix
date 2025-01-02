{ config, pkgs, ... }:
{
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [
				"~/Personal/pics/wallpapers/gruvbox/ss.png"
				"~/Personal/pics/wallpapers/drac/eyes.jpg"
				"~/Personal/pics/wallpapers/drac/eyes_.jpg"
				"~/Personal/pics/wallpapers/drac/moon-clouds.jpg"
				"~/Personal/pics/wallpapers/drac/totalwork.jpg"
			];

			wallpaper = [
				"eDP-1, ~/Personal/pics/wallpapers/drac/eyes_.jpg"
				"DP-1, ~/Personal/pics/wallpapers/drac/eyes_.jpg"
				"HDMI-A-1, ~/Personal/pics/wallpapers/drac/eyes_.jpg"
			];
		};
		package = pkgs.hyprpaper;
	};
}
