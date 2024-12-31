{ config, pkgs, ... }:
{
	xsession.windowManager.i3 = {
		enable = true;


		config = {

			gaps = {
				outer = 15;
				inner = 15;
				top = 12;
			};

			terminal = "kitty";
			menu = "rofi -show run";

			window = {
				commands = [
					{
						command = "border pixel 5";
						criteria = {
							class = ".*";
						};
					}
				];
			};
			colors = {
				background = "#B8C0E0";

				unfocused = {
					background = "#d4be98";
					border = "#d4be98";
					childBorder = "#d4be98";
					indicator = "#d4be98";
					text = "#d4be98";
				};

				focused = {
					background = "#a89984";
					border = "#a89984";
					childBorder = "#a89984";
					indicator = "#a89984";
					text = "#a89984";
				};

				focusedInactive = {
					background = "#a89984";
					border = "#a89984";
					childBorder = "#a89984";
					indicator = "#a89984";
					text = "#FFFFFF";
				};

				urgent = {
					background = "#ff0000";
					border = "#ff0000";
					childBorder = "#ff0000";
					indicator = "#ff0000";
					text = "#ff0000";
				};

				placeholder = {
					background = "#FFFFFF";
					border = "#FFFFFF";
					childBorder = "#FFFFFF";
					indicator = "#FFFFFF";
					text = "#FFFFFF";
				};

			};

			startup = [
				{ command = "systemctl --user restart polybar"; always = true; notification = false; }
				{ command = "exec picom -b"; always = true; notification = false; }
				{ command = "feh --bg-scale ~/Personal/pics/wallpapers/gruvbox/city.png"; always = true; notification = false; }
				{ command = "exec flameshot"; always = true; notification = false; }
				{ command = "exec dunst"; always = true; notification = false; }
			];

			bars = [];

			keybindings = {

				# controls for settings and such
				"XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
				"XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
				"XF86MonBrightnessUp" = "exec brightnessctl set +25";
				"XF86MonBrightnessDown" = "exec brightnessctl set 25-";

				# restart i3 in place
				"Mod1+Shift+r" = "restart";
				# open terminal
				"Mod1+Return" = "exec kitty";
				# screen shot
				"Mod4+Print" = "exec flameshot gui";
				# bluetooth menu
				"Mod4+b" = "exec rofi-bluetooth";
				# close window 
				"Mod1+BackSpace" = "kill";

				# switch layouts
				"Mod1+s" = "layout stacking;exec notify-send 'Layout: stacked'";
				"Mod1+w" = "layout tabbed;exec notify-send 'Layout: tabbed'";
				"Mod1+e" = "layout toggle split;exec notify-send 'Layout: tiled'";

				# move window
				"Mod1+Shift+h" = "move left";
				"Mod1+Shift+l" = "move right";
				"Mod1+Shift+k" = "move up";
				"Mod1+Shift+j" = "move down";

				# these two switch my monitor setup for me
				"Mod1+Shift+d" = "exec autorandr --load docked";
				"Mod1+Shift+u" = "exec autorandr --load undocked";
				"Mod1+Shift+c" = "exec autorandr --change";

				# split windows
				"Mod1+v" = "split v;exec notify-send 'tile vertically'";
				"Mod1+b" = "split h;exec notify-send 'tile horizontally'";

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
				"Mod1+d" = '' exec "rofi -show drun" '';
				"Mod4+d" = '' exec "rofi -show run" '';
				
			};

		}; 

	};
}
