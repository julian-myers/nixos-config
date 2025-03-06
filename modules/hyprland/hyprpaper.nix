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
				"~/Personal/pics/wallpapers/gimpmade/shapeurworld.png"
				"~/Personal/pics/wallpapers/desk.png"
				"~/Personal/pics/wallpapers/drac/city.png"
				"~/Personal/pics/wallpapers/moon.jpg"
				"~/Personal/pics/wallpapers/rosepineputers.png"
				"~/Personal/pics/wallpapers/rpcity.png"
			];

			wallpaper = [
				"eDP-1, ~/Personal/pics/wallpapers/rpcity.png"
				"DP-1, ~/Personal/pics/wallpapers/rpcity.png"
				"DP-2, ~/Personal/pics/wallpapers/rpcity.png"
			];
		};
		package = pkgs.hyprpaper;
	};
}
