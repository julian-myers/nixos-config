{ config, pkgs, ... }:
{
	xsession.windowManager.i3 = {
		enable = true;

		config = {

			gaps = {
				outer = 0;
				inner = 10;
			};

			terminal = "kitty";

			startup = [
				{ command = "systemctl --user restart polybar"; always = true; notification = false; }
				{ command = "feh --bg-scale ~/Personal/pics/wallpapers/foggymountains.png"; always = true; notification = false; }
			];

			bars = [];

			#keybindings = {
				#"Mod1+Shift+d" = "exec autorandr --load docked";
				#"Mod1+Shift+u" = "exec autorandr --load undocked";
			#};

		}; 
	};
}
