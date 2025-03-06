{ config, pkgs, ... }:
let
  transparent = "#00000000";
	bg = "#24273A";
	fg = "#CAD3F5";
	black = "#494d64";
	black-alt = "#5b6078";
	red = "#ED8796";
	green = "#A6da95";
	yellow = "#EED49F";
	blue = "#8AADF4";
	magenta = "#F5BDE6";
	cyan = "#8BD5CA";
	white = "#B8C0E0";
	white-alt = "#A5ADCB";
in 
{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono";
			size = 12;
		};

		shellIntegration.enableZshIntegration = true;
		themeFile = "rose-pine";
		keybindings = {
			"super+1" = "goto_tab 1";
			"super+2" = "goto_tab 2";
			"super+3" = "goto_tab 3";
			"super+4" = "goto_tab 4";
			"super+shift+f" = "toggle_fullscreen";
		};

		settings = {
			tab_bar_style = "powerline";
			tab_bar_edge = "top";
			active_tab_foreground = "#181926";
			inactive_tab_foreground = fg;
			active_tab_background = fg;
			inactive_tab_background = "#1E2030";
			tab_bar_background = "#181926";

			# background = "#1a1b29";
		};
	};

}
