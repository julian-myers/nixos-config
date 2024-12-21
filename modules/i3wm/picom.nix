{ config, pkgs, ... }:

{

	services.picom = {
		enable = true;

		activeOpacity = 0.98;
		inactiveOpacity = 0.85;
		menuOpacity = 0.85;

		fade = true;
		fadeDelta = 5;

		shadow = true;

		backend = "glx";
		settings = {
			blur = {
				method = "dual_kawase";
				strength = 10;
			};
			unredir-if-possible = true;
			glx-swap-method = -1;
			corner-radius = 15;

			blur-background-exclude = [ "class_g = 'Polybar'" ];
		};

		shadowExclude = [ "class_g = 'Polybar'" ];

	};

}
