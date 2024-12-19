{ config, pkgs, ... }:

{

	services.picom = {
		enable = true;

		activeOpacity = 0.98;

		inactiveOpacity = 0.9;

		menuOpacity = 0.9;

		fade = true;

		shadow = true;

		backend = "glx";

		settings = {
			blur = {
				method = "dual_kawase";
				strength = 10;
			};

			unredir-if-possible = true;
			glx-swap-method = -1;
			corner-radius = 10;
		};

	};

}
