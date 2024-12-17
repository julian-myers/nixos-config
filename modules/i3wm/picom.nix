{ config, pkgs, ... }:

{

	services.picom = {
		enable = true;

		activeOpacity = 1.0;

		inactiveOpacity = 0.8;

		menuOpacity = 0.8;

		shadow = true;
	};

}
