{ config, pkgs, ... }:

{
	services.picom = {
		enable = true;

		activeOpacity = 0.95;
		inactiveOpacity = 0.8;
		menuOpacity = 0.8;
		opacityRules = [
			"100:class_g = 'firefox'"
		];

		fade = true;
		fadeDelta = 5;

		backend = "glx";
		vSync = true;

		settings = {
			blur = {
				method = "dual_kawase";
				strength = 10;
			};

			blur-background-exclude = [ 
				"class_g = 'Polybar'"
				"class_g = 'firefox'"
			];

			unredir-if-possible = true;
			glx-swap-method = -1;
			corner-radius = 10;
		};

		shadowExclude = [ "class_g = 'Polybar'" ];
		shadow = true;

	};
}
