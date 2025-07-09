{ config, pkgs, ... }:
{
	services.hyprpaper = {
		enable = true;
		settings = {
			preload = [
				"~/Personal/pics/wallpapers/toast.png"
				"~/Personal/pics/wallpapers/aesthetic.jpg"
			];

			wallpaper = [
				"eDP-1, ~/Personal/pics/wallpapers/aesthetic.jpg"
				"DP-1, ~/Personal/pics/wallpapers/aesthetic.jpg"
				"DP-2, ~/Personal/pics/wallpapers/aesthetic.jpg"
			];
		};
		package = pkgs.hyprpaper;
	};
}
