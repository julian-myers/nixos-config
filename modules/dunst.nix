{ config, pkgs, ... }:
let
	darkbg = "#1A1B29aa";
  bg = "#282a36";
  fg = "#f8f8f2";
  cyan = "#8be9fd";
  green = "#50fa7b";
  orange = "#ffb86c";
  pink = "#ff79c6";
  purple = "#bd93f9";
  red = "#ff5555";
  yellow = "#f1fa8c";
	black = "#5B6078";
in 
{
	services.dunst = {
		enable = true;

		iconTheme = {
			name = "Papirus";
			package = pkgs.papirus-icon-theme;
			size = "32x32";
		};

		settings = {
			global = {
				width = 200;
				height = 200;
				origin = "top-left";
				transparency = 10;
				font = "JetBrainsMono Normal Light 12";
				corner_radius = 10;
				layer = "top";
				frame_width = 1;
			};
			urgency_low = {
				background = "${darkbg}";
				foreground = "${fg}";
				frame_color = "${fg}";
			};
			urgency_normal = {
				background = "${darkbg}";
				foreground = "${fg}";
				frame_color = "${fg}";
			};
			urgency_critical = {
				background = "${darkbg}";
				foreground = "${fg}";
				frame_color = "${fg}";
			};
		};
	};
}
