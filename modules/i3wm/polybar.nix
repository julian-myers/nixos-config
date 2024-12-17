{ config, pkgs, ... }:

{
	services.polybar = {
		enable = true;

		config = {
			"bar/main" = {
				monitor = "\${env:MONITOR:eDP1}";
				width = "95%";
				height = "3%";
				radius = 0;
				background = "#222222";
				foreground = "#ffffff";
				modules-center = "date";
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
