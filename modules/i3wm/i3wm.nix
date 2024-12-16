{ config, pkgs, ... }:
{
	
	services.xserver.windowManager.i3 = {
		enable = true;
		extraPackages = with pkgs;[
			dmenu
			i3lock
			i3status
			polybar
			feh
		];
	};

}
