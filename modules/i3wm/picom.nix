{ config, pkgs, ... }:

{

	services.picom = {
		enable = true;

		activeOpacity = 0.95;
		inactiveOpacity = 0.8;
		menuOpacity = 0.8;

		fade = true;
		fadeDelta = 5;

		shadow = true;

		backend = "glx";
		settings = {
			blur = {
				method = "dual_kawase";
				strength = 6;
			};
			unredir-if-possible = true;
			glx-swap-method = -1;
			corner-radius = 10;

			blur-background-exclude = [ "class_g = 'Polybar'" ];
		};

		shadowExclude = [ "class_g = 'Polybar'" ];

	};

}
