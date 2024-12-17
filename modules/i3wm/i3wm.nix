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
			menu = "rofi -show run";

			startup = [
				{ command = "systemctl --user restart polybar"; always = true; notification = false; }
				{ command = "feh --bg-scale ~/Personal/pics/wallpapers/foggymountains.png"; always = true; notification = false; }
			];

			bars = [];

			keybindings = {
				# restart i3 in place
				"Mod1+Shift+r" = "restart";

				# open terminal
				"Mod1+Return" = "exec kitty";

				# these two switch my monitor setup for me
				"Mod1+Shift+d" = "exec autorandr --load docked";
				"Mod1+Shift+u" = "exec autorandr --load undocked";

				# split windows
				"Mod1+v" = "split v";
				"Mod1+b" = "split h";

				# focus --- vim bindings
				"Mod1+l" = "focus right";
				"Mod1+h" = "focus left";
				"Mod1+k" = "focus up";
				"Mod1+j" = "focus down";

				# move to scratchpad
				"Mod1+Shift+minus" = "move scratchpad"; 
				"Mod1+minus" = "scratchpad show";

				# move workspace between monitors
				"Mod1+Control+h" = "move workspace to output left"; 
				"Mod1+Control+l" = "move workspace to output right"; 

				# toggle floating/tiling window
				"Mod1+space" = "floating toggle";

				# switching workspaces
				"Mod1+1" = "workspace 1";
				"Mod1+2" = "workspace 2";
				"Mod1+3" = "workspace 3";
				"Mod1+4" = "workspace 4";
				"Mod1+5" = "workspace 5";
				"Mod1+6" = "workspace 6";
				"Mod1+7" = "workspace 7";
				"Mod1+8" = "workspace 8";
				"Mod1+9" = "workspace 9";

				# move window to work space
				"Mod1+Shift+1" = "move container to workspace 1";
				"Mod1+Shift+2" = "move container to workspace 2";
				"Mod1+Shift+3" = "move container to workspace 3";
				"Mod1+Shift+4" = "move container to workspace 4";
				"Mod1+Shift+5" = "move container to workspace 5";
				"Mod1+Shift+6" = "move container to workspace 6";
				"Mod1+Shift+7" = "move container to workspace 7";
				"Mod1+Shift+8" = "move container to workspace 8";
				"Mod1+Shift+9" = "move container to workspace 9";

				# rofi 
				"Mod1+d" = '' exec "rofi -show run" '';
				
			};

		}; 
	};
}
