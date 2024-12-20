{ config, pkgs, ... }:
{
	services.polybar = {
		enable = true;

		config = {

			"colors" = {
				
				background = "#00000000";
				foreground = "#cad3f5";

				black1 = "#494d64";
				black2 = "5b6078";

				red = "#ed8796";
				green = "#a6da95";
				yellow1 = "#eed49f";
				yellow2 = "#e09a25";
				blue = "#8aadf4";
				magenta = "#f5bde6";
				cyan = "#8bd5ca";

				white1 = "#b8c0e0";
				white2 = "#a5adcb";
			};

			"bar/monitor1" = {

				# monitor settings
				monitor = "HDMI-1";
				monitor-fallback = "eDP-1";

				# bar settings
				width = "100%";
				height = "2.5%";
				radius = 10;
				background = "${colors.background}";

				# fonts
				font-0 = "JetBrainsMono Nerd Font:weight=semibold:size=12";
				font-1 = "JetBrainsMono Nerd Font:weight=semibold:size=14";
				font-2 = "JetBrainsMono Nerd Font:weight=semibold:size=16";
				font-3 = "JetBrainsMono Nerd Font:weight=semibold:size=18";

				# modules
				modules-left = [
					"i3"	
				];
			};

			# ----- module configs -------


			"module/i3" = {
				type = internal/i3;
				index-sort = true;

				# workspace icons/names
				ws-icon-0 = "1;󰎤";
				ws-icon-1 = "2;󰎧";
				ws-icon-2 = "3;󰎪";
				ws-icon-3 = "4;󰎭";
				ws-icon-4 = "5;󰎱";
				ws-icon-5 = "6;󰎳";
				ws-icon-6 = "7;󰎶";
				ws-icon-7 = "8;󰎹";
				ws-icon-8 = "9;󰎼";
				ws-icon-default = "󰿉";

				# formatting
				format = "<label-state>";

				label-focused = "%icon%";
				label-focused-foreground = "${colors.yellow2}";

			};

		};
		
		script = ''
			#!/bin/sh
			polybar monitor1 &
		'';
	};
}
