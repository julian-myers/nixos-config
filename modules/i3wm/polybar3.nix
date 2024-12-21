{ config, pkgs, ... }:
{
	services.polybar = {
		enable = true;

		config = {

			"colors" = {
				
				background = "#00000000";
				foreground = "#cad3f5";
				 # 353349

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

				offset-y = "5pt";

				# bar settings
				width = "100%";
				height = "25pt";
				background = "#00000000";
				padding = 3;

				# fonts
				font-0 = "JetBrainsMono Nerd Font:weight=semibold:size=12";
				font-1 = "JetBrainsMono Nerd Font:weight=semibold:size=14";
				font-2 = "JetBrainsMono Nerd Font:weight=semibold:size=16";
				font-3 = "JetBrainsMono Nerd Font:weight=semibold:size=18";
				font-4 = "JetBrainsMono Nerd Font:weight=semibold:size=25";

				# modules
				modules-left = [
					"workspaces"	
				];

				modules-center = [
					"marginleft"
					"time"
					"marginright"
				];

				modules-right = [

					"marginleft"
					"alsa"
					"margincenter"
					"battery"
					"margincenter"
					"network"
					"marginright"
				];
				
			};

			# margins modules that look real nice 
			# these are for copying and pasting faster   󰝤 󰨓  󰿠

			"module/marginleft" = {
				type = "custom/text";

				format = "<label>";
				format-background = "#00000000";
				label = "";
				label-font = 5;
				label-foreground = "#353349"; 
				format-padding = 0;
			};

			"module/marginright" = {
				type = "custom/text";

				format = "<label>";
				format-background = "#00000000";
				label = "";
				label-font = 5;
				label-foreground = "#353349"; 
				format-padding = 0;
			};

			"module/margincenter" = {
				type = "custom/text";

				format = "<label>";
				format-background = "#353349";
				label = "󰿠";
				label-font = 5;
				label-foreground = "#353349"; 
				format-padding = 2;
				format-spacing = 5;
			};

			# ----- module configs -------


			"module/workspaces" = {
				type = "internal/xworkspaces";

				# workspace icons/names
				icon-0 = "1;";
				icon-1 = "2;";
				icon-2 = "3;";
				icon-3 = "4;";
				icon-4 = "5;";
				icon-5 = "6;";
				icon-6 = "7;";
				icon-7 = "8;";
				icon-8 = "9;";
				icon-default = "";

				# formatting
				format = "<label-state>";
				format-background = "#00000000";

				label-active = "";
				label-active-foreground = "#eed49f";
				label-active-font = 2;
				label-active-padding = 1;

				label-occupied = "%icon%";
				label-occupied-foreground = "#f1bae2";
				label-occupied-font = 2;
				label-occupied-padding = 1;
			};

			"module/time" = {
				type = "internal/date";
				internal = 1;

				time = "%I:%M";

				label = " %time%";
				label-foreground = "#cdc7d2";
				label-font = 1;
				
				format = "<label>";
				format-background = "#353349";
			};

			"module/battery" = {
				type = "internal/battery";
				low-at = 10;
				full-at = 99;

				ramp-capacity-0 = "󰁺";
				ramp-capacity-1 = "󰁻";
				ramp-capacity-2 = "󰁼";
				ramp-capacity-3 = "󰁽";
				ramp-capacity-4 = "󰁾";
				ramp-capacity-5 = "󰁿";
				ramp-capacity-6 = "󰂀";
				ramp-capacity-7 = "󰂁";
				ramp-capacity-8 = "󰂂";
				ramp-capacity-9 = "󰁹";

				animation-charging-0 = "󰢜";
				animation-charging-1 = "󰂆";
				animation-charging-2 = "󰂇";
				animation-charging-3 = "󰂈";
				animation-charging-4 = "󰢝";
				animation-charging-5 = "󰂉";
				animation-charging-6 = "󰢞";
				animation-charging-7 = "󰂊";
				animation-charging-8 = "󰂋";
				animation-charging-9 = "󰂅";
				animation-charging-framerate = "200";

				label-charging = "%percentage%%";
				label-discharging = "%percentage%%";

				format-charging = "<animation-charging> <label-charging>";
				format-charging-foreground = "#a6da95";
				format-charging-background = "#353349";

				format-discharging = "<ramp-capacity> <label-discharging>";
				format-discharging-foreground = "#cdc7d2";
				format-discharging-background = "#353349";

				label-full = "󱟢";
				format-full = "<label-full>";
				format-full-foreground = "#a6da95";
				format-full-background = "#353349";

				label-low = "󱃍";
				format-low = "<label-low>";
				format-low-foreground = "#ed8796";
				format-low-background = "#353349";
			};

			"module/network" = {
				type = "internal/network";
				interface = "wlp0s20f3";

				interface-type = "wireless";

				format-connected = "<ramp-signal> <label-connected>";
				format-connected-background = "#353349";
				format-connected-foreground = "#89abf0";
				label-connected = " '%essid%' ";
				label-connected-foreground = "#cdc7d2";

				format-disconnected = "<label-disconnected>";
				format-disconnected-background = "#353349";
				format-disconnected-foreground = "#494c63";
				label-disconnected = "󰤫";

				ramp-signal-0 = "󰤟";
				ramp-signal-1 = "󰤢";
				ramp-signal-2 = "󰤥";
				ramp-signal-3 = "󰤨";
				ramp-signal-4 = "󰤨";
			};

			"module/alsa" = {
				type = "internal/alsa";
				master-soundcard = "default";
				master-mixer = "Master";

				label-muted = "󰸈";
				format-muted = "<label-muted>";
				format-muted-foreground = "#f1bae2";
				format-muted-background = "#353349";
				format-muted-padding = 1;

				ramp-volume-0 = "";
				ramp-volume-1 = "";
				ramp-volume-2 = "";

				label-volume-foreground = "#cdc7d2";
				label-volume-padding = 1;
				format-volume = "<ramp-volume> <label-volume>";
				format-volume-foreground = "#f1bae2";
				format-volume-background = "#353349";
				format-volume-padding = 1;
			};

			"module/spotify" = {
				type = "custom/script";
				interval = 1;
				exec = "~/Code/spotify-status.py";
			};

		};
		
		script = ''
			#!/bin/sh
			polybar monitor1 &
		'';
	};
}
