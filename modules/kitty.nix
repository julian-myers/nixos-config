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
		#themeFile = "catppuccin-mocha";
		keybindings = {
			"super+1" = "goto_tab 1";
			"super+2" = "goto_tab 2";
			"super+3" = "goto_tab 3";
			"super+4" = "goto_tab 4";
			"super+shift+f" = "toggle_fullscreen";
		};

		settings = {
			tab_bar_edge = "top";
			tab_powerline_style = "angled";
		};

		extraConfig = ''
			# vim:ft=kitty


			# The basic colors
			foreground              #cdd6f4
			background              #1e1e2e
			selection_foreground    #1e1e2e
			selection_background    #f5e0dc

			# Cursor colors
			cursor                  #f5e0dc
			cursor_text_color       #1e1e2e

			# URL underline color when hovering with mouse
			url_color               #f5e0dc

			# Kitty window border colors
			active_border_color     #b4befe
			inactive_border_color   #6c7086
			bell_border_color       #f9e2af

			# OS Window titlebar colors
			wayland_titlebar_color system
			macos_titlebar_color system

			# Tab bar colors
			active_tab_foreground   #11111b
			active_tab_background   #cba6f7
			inactive_tab_foreground #cdd6f4
			inactive_tab_background #181825
			tab_bar_background      #11111b

			# Colors for marks (marked text in the terminal)
			mark1_foreground #1e1e2e
			mark1_background #b4befe
			mark2_foreground #1e1e2e
			mark2_background #cba6f7
			mark3_foreground #1e1e2e
			mark3_background #74c7ec

			# The 16 terminal colors

			# black
			color0 #45475a
			color8 #585b70

			# red
			color1 #f38ba8
			color9 #f38ba8

			# green
			color2  #a6e3a1
			color10 #a6e3a1

			# yellow
			color3  #f9e2af
			color11 #f9e2af

			# blue
			color4  #89b4fa
			color12 #89b4fa

			# magenta
			color5  #f5c2e7
			color13 #f5c2e7

			# cyan
			color6  #94e2d5
			color14 #94e2d5

			# white
			color7  #bac2de
			color15 #a6adc8
		'';
			# background = "#1a1b29";

	};

}
