{ config, pkgs, ... }:

{
	services.polybar = {

		enable = true;

		config = {
			"bar/monitor1" = {
				monitor = "HDMI-1";
				monitor-fallback = "eDP-1";

				width = "100%";
				height = "2.5%";
				radius = 10;

				fixed-center = true;
				background = "#00000000";

				module-margin = 2;

				modules-center = "workspaces";
				modules-left = [
					"text"
					"date"
				];

				modules-right = [
					"battery"
					"alsa"
					"network"
				];

				padding = 2;

				font-0 = "JetBrainsMono Nerd Font:weight=semibold;size=12";
				font-1 = "FontAwesome6Free:size=10";
				font-2 = "JetBrainsMono Nerd Font:weight=semibold;size=16";
				font-3 = "JetBrainsMono Nerd Font:weight=semibold;size=14";
			};
			
			"module/date" = {
				type = "internal/date";
				internal = 1;
				date = "%m-%d-%y";
				time = "%I:%M";
				label = "  %date%  %time% ";
				label-font = 4;
				label-foreground = "#B8C0E0";
			};

			"module/workspaces" = {
				type = "internal/xworkspaces";

				group-by-monitor = false;
				enable-click = true;
				enable-scroll = false;

				icon-0 = "1;󰎤";
				icon-1 = "2;󰎧";
				icon-2 = "3;󰎪";
				icon-3 = "4;󰎭";
				icon-4 = "5;󰎱";
				icon-5 = "6;󰎳";
				icon-6 = "7;󰎶";
				icon-7 = "8;󰎹";
				icon-8 = "9;󰎼";

				icon-default = "󰿉";

				format = "<label-state>";
				format-background = "#0024273A";
				format-border-size = 3;
				format-border-color = "#B8C0E0";

				label-active = "%icon%"; 
				label-active-foreground = "ffffff";
				label-active-padding = 1;
				label-active-underline = "#B8C0E0";
				label-active-font = 3;

				label-occupied = "%icon%";
				label-occupied-foreground = "a3abc8";
				label-occupied-padding = 1;
				label-occupied-underline = "#B8C0E0";
				label-occupied-font = 4;

				label-empty = "%icon%";
				label-empty-padding = 1;
				label-empty-foreground = "#9aa2be";
				label-empty-underline = "#9aa2be";
				label-empty-font = 4;


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
				format-charging-foreground = "#99d098";

				format-discharging = "<ramp-capacity> <label-discharging>";
				format-discharging-foreground = "#B8C0E0";

				label-full = "󱟢";
				format-full = "<label-full>";
				format-full-foreground = "#B8C0E0";

				label-low = "󱃍";
				format-low = "<label-low>";
				format-low-foreground = "#e98594";
			};	

			"module/alsa" = {
				type = "internal/alsa";
				master-soundcard = "default";
				master-mixer = "Master";

				label-muted = "󰸈";
				format-muted = "<label-muted>";

				ramp-volume-0 = "";
				ramp-volume-1 = "";
				ramp-volume-2 = "";

				format-volume = "<ramp-volume> <label-volume>";
				format-volume-foreground = "#7ec9da";
			};

			"module/network" = {
				type = "internal/network";
				interface = "wlp0s20f3";

				interface-type = "wireless";

				format-connected = "<ramp-signal> <label-connected>";
				format-connect-padding = 5;
				format-connect-underline = "#494c63";
				label-connected = "%essid%";
				label-connected-foreground = "#89abf0";

				format-disconnected = "<label-disconnected>";
				label-disconnected = "󰤫";
				label-disconnected-foreground = "#d793a1";

				ramp-signal-0 = "󰤟";
				ramp-signal-1 = "󰤢";
				ramp-signal-2 = "󰤥";
				ramp-signal-3 = "󰤨";
				ramp-signal-4 = "󰤨";
				ramp-signal-foreground = "#89abf0";
			};

			"module/text" = {
				type = "custom/text";
				format = "<label>";
				label = "";
				label-foreground = "#7ec9da";

			};

			"module/bluetooth" = {
				type = "custom/script";
				exec = "/home/julian-m/.nix-profile/bin/rofi-bluetooth --status";
				interval = 1;
				click-left = "/home/julian-m/.nix-profile/bin/rofi-bluetooth";
			};

		};

		script = ''
			#!/bin/sh
			polybar monitor2 &
			polybar monitor1 &

		'';
	};
}