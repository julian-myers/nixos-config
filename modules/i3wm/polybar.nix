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
				background = "#222222";
				modules-center = "date";
				modules-left = [
					"workspaces"
				];
				modules-right = [
					"battery"
					"alsa"
				];
				border-size = 3;
				border-color = "#ffffff";
				padding = 10;
			};

			"bar/monitor2" = {
				monitor = "DP-1";
				width = "100%";
				height = "2%";
				radius = 10;
				background = "#222222";
				modules-center = "date";
				modules-left = [
					"workspaces"
				];
				modules-right = [
					"battery"
					"alsa"
				];
				border-size = 3;
				border-color = "#ffffff";
				padding = 10;
			};

			"module/date" = {
				type = "internal/date";
				internal = 1;
				date = "%m|%d|%y";
				time = "%H:%M";
				label = "%time%  %date%";
			};

			"module/workspaces" = {
				type = "internal/xworkspaces";
				pin-workspaces = true;
			};

			"module/battery" = {
				type = "internal/battery";
				low-at = 20;
				full-at = 99;
			};	

			"module/alsa" = {
				type = "internal/alsa";
				master-soundcard = "default";
				master-mixer = "Master";
			};
		};

		script = ''
			#!/bin/sh
			polybar monitor2 &
			polybar monitor1 &

		'';
	};
}
