{ config, pkgs, ... }:
let
	darkbg = "#1A1B29ff";
  bg = "#282a36ff";
  fg = "#f8f8f2ff";
  cyan = "#8be9fdff";
  green = "#50fa7bff";
  orange = "#ffb86cff";
  pink = "#ff79c6ff";
  purple = "#bd93f9ff";
  red = "#ff5555ff";
  yellow = "#f1fa8cff";
	black = "#5B6078ff";
in 
{
	programs.hyprlock = {
		enable = true;
		settings = {

			general = {
				disable_loading_bar = true;
				grace = 30;
				hide_cursor = true;
				no_fade_in = false;
			};

			background = [
				{
					path = "~/Personal/pics/wallpapers/drac/eyes_.jpg";
					blur_passes = 4;
					blur_size = 8;
					brightness = 0.4;
				}
			];

			input-field = [
				{
					size = "150, 40";
					position = "0, -80";
					monitor = "";
					dots_center = true;
					fade_on_empty = false;
					font_family = "JetBrainsMono Nerd Font";
					font_color = "rgb(91, 96, 120)"; # black
					inner_color = "rgb(40, 42, 54)"; # bg
					outer_color ="rgb(91, 96, 120)";
					outline_thickness = 1;
					placeholder_text = "<i>Password:</i>";
					shadow_passes = 2;
				}
			];

			label = [
				{
					monitor = "";
					text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
					color = "rgb(91, 96, 120)"; # black
					font_size = 64;
					font_family = "JetBrainsMono Nerd Font";
					position = "0, 200";
					halign = "center";
					valign = "center";
				}
			];
		};
	};
}
