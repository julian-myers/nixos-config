{ config, pkgs, ... }:
let
  transparent = "#00000000";
	bg = "#32302f";
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
	services.polybar = {
		enable = true;

		config = {
			"global/wm" = {
				margin-bottom = 5;
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
				padding = 5;

				# fonts
				font-0 = "JetBrainsMono Nerd Font:weight=semibold:size=12";
				font-1 = "JetBrainsMono Nerd Font:weight=semibold:size=14";
				font-2 = "JetBrainsMono Nerd Font:weight=semibold:size=16";
				font-3 = "JetBrainsMono Nerd Font:weight=semibold:size=18";
				font-4 = "JetBrainsMono Nerd Font:weight=semibold:size=25";
				font-5 = "JetBrainsMono Nerd Font:weight=semibold:size=8";

				# modules
				modules-left = [
					"workspaces"	
					"space"
					"marginleft"
					"brightness"
					"marginright"
				];

				modules-center = [
					"marginleft"
					"time"
					"marginright"
				];

				modules-right = [

					"marginleft"
					"alsa"
					"marginright"
					"space"
					"marginleft"
					"battery"
					"margincenter"
					"network"
					"margincenter"
					"nixos"
					"marginright"
					"space"
					"power"
				];
				
			};

			"bar/monitor2" = {
				# monitor settings
				monitor = "DP-1";

				offset-y = "5pt";

				# bar settings
				width = "100%";
				height = "25pt";
				background = transparent;
				padding = 5;

				# fonts
				font-0 = "JetBrainsMono Nerd Font:weight=semibold:size=12";
				font-1 = "JetBrainsMono Nerd Font:weight=semibold:size=14";
				font-2 = "JetBrainsMono Nerd Font:weight=semibold:size=16";
				font-3 = "JetBrainsMono Nerd Font:weight=semibold:size=18";
				font-4 = "JetBrainsMono Nerd Font:weight=semibold:size=25";
				font-5 = "JetBrainsMono Nerd Font:weight=semibold:size=8";

				# modules
				modules-left = [
					"workspaces"	
					"space"
					"marginleft"
					"brightness"
					"marginright"
				];

				modules-center = [
					"marginleft"
					"time"
					"marginright"
				];

				modules-right = [

					"marginleft"
					"alsa"
					"marginright"
					"space"
					"marginleft"
					"battery"
					"margincenter"
					"network"
					"margincenter"
					"nixos"
					"marginright"
					"space"
					"power"
				];
				
			};
			# margins modules that look real nice 
			# these are for copying and pasting faster   󰝤 󰨓  󰿠

			"module/marginleft" = {
				type = "custom/text";

				format = "<label>";
				format-background = transparent;
				label = "";
				label-font = 5;
				label-foreground = bg; 
				format-padding = 0;
			};

			"module/marginright" = {
				type = "custom/text";

				format = "<label>";
				format-background = transparent;
				label = "";
				label-font = 5;
				label-foreground = bg; 
				format-padding = 0;
			};

			"module/margincenter" = {
				type = "custom/text";

				format = "<label>";
				format-background = bg;
				label = "󰿠";
				label-font = 5;
				label-foreground = bg; 
				format-padding = 2;
				format-spacing = 5;
			};

			# ----- module configs -------


			"module/workspaces" = {
				type = "internal/xworkspaces";

				pin-workspaces = true;

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
				format-background = transparent;

				label-active = "";
				label-active-foreground = yellow-alt;
				label-active-font = 2;
				label-active-padding = 1;

				label-occupied = "%icon%";
				label-occupied-foreground = magenta;
				label-occupied-font = 2;
				label-occupied-padding = 1;
			};

			"module/time" = {
				type = "internal/date";
				internal = 1;

				time = "%I:%M";

				label = " %time%";
				label-foreground = white;
				label-font = 1;
				
				format = "<label>";
				format-background = bg;
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
				format-charging-foreground = green;
				format-charging-background = bg;

				format-discharging = "<ramp-capacity> <label-discharging>";
				format-discharging-foreground = white;
				format-discharging-background = bg;

				label-full = "󱟢";
				format-full = "<label-full>";
				format-full-foreground = green;
				format-full-background = bg;

				label-low = "󱃍";
				format-low = "<label-low>";
				format-low-foreground = red;
				format-low-background = bg;
			};

			"module/network" = {
				type = "internal/network";
				interface = "wlp0s20f3";

				interface-type = "wireless";

				format-connected = "<ramp-signal> <label-connected>";
				format-connected-background = bg;
				format-connected-foreground = blue;
				label-connected = " '%essid%' ";
				label-connected-foreground = white;

				format-disconnected = "<label-disconnected>";
				format-disconnected-background = bg;
				format-disconnected-foreground = red;
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
				format-muted = "<label-muted> <bar-volume>";
				format-muted-foreground = white;
				format-muted-background = bg;
				format-muted-padding = 1;

				ramp-volume-0 = "";
				ramp-volume-1 = "";
				ramp-volume-2 = "";

				bar-volume-format = "%fill%%empty%";
				bar-volume-fill = "";
				bar-volume-foreground = white; 
				bar-volume-empty = "";
				bar-volume-width = 10;

				label-volume-foreground = white;
				label-volume-padding-right = 2;
				label-volume-font = 2;
				format-volume = "<ramp-volume> <bar-volume>";
				format-volume-foreground = white;
				format-volume-background = bg;
				format-volume-padding = 1;
			};

			"module/spotify" = {
				type = "custom/script";
				interval = 1;
				exec = "~/Code/spotify-status.py";
			};

			"module/power" = {
				type = "custom/script";

				double-click-right = "~/scripts/reboot.sh reboot";
				double-click-left = "~/scripts/reboot.sh sleep";
				double-click-middle = "~/scripts/reboot.sh shutdown";

				exec = "echo ";
				
				label = "";
				label-font = 1;
				label-padding = 1;
				label-spacing = 1;
				label-minlen = 3;
				label-alignment = "center";
				format-prefix = "";
				format-prefix-foreground = red;
				format-prefix-background = transparent;
				format-prefix-font = 5;
				format-suffix = "";
				format-suffix-foreground = red;
				format-suffix-background = transparent;
				format-suffix-font = 5;
				format-background = red;

				format = "<label>";
				format-font = 5;
			};

			"module/brightness" = {
				type = "internal/backlight";
				card = "nvidia_wmi_ec_backlight";
				
				label = "%percentage%";
				bar-format = "%fill%%empty%";
				bar-fill = "";
				bar-foreground = white; 
				bar-empty = "";
				bar-width = 10;

				format = "<bar> <label>";
				format-prefix = "  ";
				format-prefix-foreground = white;
				format-prefix-background = bg;
				format-foreground = white;
				format-background = bg;
				format-padding = 1;
			};

			"module/space" = {
				type = "custom/text";

				label = "foo";

				format = "<label>";
				format-background = transparent;
				format-foreground = transparent;
				format-margin = 3;
			};

			"module/nixos" = {
				type = "custom/text";

				label = "  %{F${white}}Gruvbox%{F-}";
				label-font = 2;
				label-minlen = 2;
				label-alignment = "center";

				format = "<label>";
				format-foreground = blue;
				format-background = bg;
				format-padding = 1;
			};



		};
		
		script = ''
			#!/bin/sh
			polybar monitor1 &
			polybar monitor2 &
		'';
	};
}
