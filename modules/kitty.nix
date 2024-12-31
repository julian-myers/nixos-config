{ config, pkgs, ... }:
let
  transparent = "#00000000";
	bg = "#222526";
	#bg = "#32302f";
	fg = "#d4be98";
	black = "#665c54";
	black-alt = "#928374";
	red = "#ea6962";
	green = "#a9b665";
	yellow = "#e78a4e";
	yellow-alt = "#d8a657";
	blue = "#7daea3";
	magenta = "#d3869b";
	cyan = "#89b482";
	white = "#d4be98";
in 
{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono";
			size = 12;
		};

		shellIntegration.enableZshIntegration = true;
		themeFile = "GruvboxMaterialDarkHard";
		keybindings = {
			"super+1" = "goto_tab 1";
			"super+2" = "goto_tab 2";
			"super+3" = "goto_tab 3";
			"super+4" = "goto_tab 4";
		};

		settings = {
			tab_bar_style = "powerline";
			tab_bar_edge = "top";
			active_tab_foreground = fg;
			inactive_tab_foreground = fg;
			active_tab_background = black;
			inactive_tab_background = black-alt;
		};
	};

}
