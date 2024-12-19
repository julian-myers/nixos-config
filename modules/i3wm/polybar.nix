{ config, pkgs, ... }:

{
	services.polybar = {

		enable = true;

		config = {
			"bar/monitor1" = {
				monitor = "HDMI-1";
				monitor-fallback = "eDP-1";

				width = "100%";
				height = "2%";
				radius = 10;

				fixed-center = true;
				background = "#24273A";

				module-margin = 2;
				separator = "";

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

				border-size = 3;
				border-color = "#B8C0E0";
				padding = 5;

				font-0 = "JetBrainsMono Nerd Font:weight=semibold;size=11";
				font-1 = "FontAwesome6Free:size=10";
			};

			"bar/monitor2" = {
				monitor = "DP-1";

				width = "100%";
				height = "2%";
				radius = 10;

				fixed-center = true;
				background = "#24273A";
				
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

				border-size = 3;
				border-color = "#B8C0E0";
				padding = 5;

				font-0 = "JetBrainsMono Nerd Font:weight=semibold;size=11";
				font-1 = "FontAwesome6Free:size=10";
			};

			"module/date" = {
				type = "internal/date";
				internal = 1;
				date = "%m-%d-%y";
				time = "%I:%M";
				label = "  %date%  %time% ";
				label-font = 1;
			};

			"module/workspaces" = {
				type = "internal/xworkspaces";
				pin-workspaces = true;
				group-by-monitor = false;
				enable-click = false;
				enable-scroll = false;

				icon-0 = "one;󰬺";
				icon-1 = "two;󰬻";
				icon-2 = "three;󰬼";
				icon-3 = "four;󰬽";
				icon-4 = "five;󰬾";

				icon-default = "";

				format = "<label-state>";

				label-active = " %icon% %name%"; 
				label-occupied = "%name%";
				label-active-padding = 2;
			};

			"module/battery" = {

				type = "internal/battery";
				low-at = 20;
				full-at = 99;

				ramp-capacity-0 = "󰁺";
				ramp-capacity-1 = "󰁼";
				ramp-capacity-2 = "󰁾";
				ramp-capacity-3 = "󰂁";
				ramp-capacity-4 = "󱟢";

				label-charging = "%percentage%%";
				label-discharging = "%percentage%%";

				format-charging = "󰂄 <label-charging>";
				format-discharging = "<ramp-capacity> <label-discharging>";

			};	

			"module/alsa" = {
				type = "internal/alsa";
				master-soundcard = "default";
				master-mixer = "Master";

				label-muted = "";

				ramp-volume-0 = "";
				ramp-volume-1 = "";
				ramp-volume-2 = "";

				format-volume = "<ramp-volume> <label-volume>";
			};

			"module/network" = {
				type = "internal/network";
				interface = "wlan1";

				interface-type = "wireless";

				format-connected = "<label-connected>";
				label-connected = "";

				format-disconnected = "<label-disconnected>";
				label-disconnected = "󰖪";
			};

			"module/text" = {
				type = "custom/text";
				format = "<label>";
				label = "";

			};

		};

		script = ''
			#!/bin/sh
			polybar monitor2 &
			polybar monitor1 &

		'';
	};
}
