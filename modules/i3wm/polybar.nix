{ config, pkgs, ... }:

{
	services.polybar = {
		enable = true;

		config = {
			"bar/main" = {
				monitor = "HDMI-1";
				monitor-fallback = "eDP-1";
				width = "95%";
				height = "2%";
				radius = 10;
				background = "#222222";
				modules-center = "date";
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
		};

		script = ''
			#!/bin/sh
			polybar main &
		'';
	};
}
