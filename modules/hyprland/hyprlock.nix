{ config, pkgs, ... }:
let
	colors = {
		rosewater = "rgb(245, 224, 220)";
		flamingo = "rgb(242, 205, 205)";
		pink = "rgb(245, 194, 231)";
		mauve = "rgb(203, 166, 247)";
		red = "rgb(243, 139, 168)";
		maroon = "rgb(235, 160, 172)";
		peach = "rgb(250, 179, 135)";
		yellow = "rgb(249, 226, 175)";
		green = "rgb(166, 227, 161)";
		teal = "rgb(166, 227, 161)";
		sky = "rgb(137, 220, 235)";
		sapphire = "rgb(116, 199, 236)";
		blue = "rgb(137, 180, 250)";
		lavender = "rgb(180, 190, 254)";
		text = "rgb(205, 214, 244)";
		subtext1 = "rgb(186, 194, 222)";
		subtext0 = "rgb(166, 173, 200)";
		overlay2 = "rgb(147, 153, 178)";
		overlay1 = "rgb(127, 132, 156)";
		overlay0 = "rgb(108, 112, 134)";
		surface2 = "rgb(88, 91, 112)";
		surface1 = "rgb(69, 71, 90)";
		surface0 = "rgb(49, 50, 68)";
		base = "rgb(30, 30, 46)";
		mantle = "rgb(24, 24, 37)";
		crust = "rgb(17, 17, 27)";
	};
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
					path = "~/Personal/pics/wallpapers/gimpmade/shapeurworld.png";
					vibrancy = 0.2;
					vibrancy_darkness = 0.2;
					blur_size = 5;
					blur_passes = 3;
					noise = 0.0117;
					brightness = 0.5;
				}
			];

			input-field = [
				{
					size = "250, 40";
					position = "0, -80";
					monitor = "";
					dots_center = true;
					fade_on_empty = false;
					font_family = "JetBrainsMono Nerd Font";
					font_color = "${colors.text}"; # fg
					inner_color = "${colors.base}"; # bg
					outer_color ="${colors.lavender}";
					outline_thickness = 1;
					placeholder_text = "<i>Password:</i>";
					shadow_passes = 2;
				}
			];

			label = [
				{
					monitor = "";
					text = "cmd[update:1000] echo \"$(date +\"%-I:%M\")\"";
					color = "${colors.mauve}"; # fg 
					font_size = 96;
					font_family = "JetBrainsMono Nerd Font";
					position = "0, 200";
					halign = "center";
					valign = "center";
				}

				{
					monitor = "";
					text = "cmd[update:10000] fortune" ;
					color = "${colors.text}";
					font_family = "JetBrainsMono Nerd Font";
					font_size = 24;
					halign = "left";
					valign = "top";
					position = "25, -50";
				}
			];
		};
	};
}
