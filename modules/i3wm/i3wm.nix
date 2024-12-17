{ config, pkgs, ... }:
{
	xsession.windowManager.i3 = {
		enable = true;
		config = {
			gaps = {
				outer = 15;
				inner = 10;
			};
			terminal = "kitty";
			startup = [
				{ command = "systemctl --user restart polybar"; always = true; notification = false; }
				{ command = "feh --bg-scale ~/Personal/pics/wallpapers/foggymountains.png"; always = true; notification = false; }
			];
		}; 
	};
}
