{ config, pkgs, ... }:
{
	services.kanshi = {
		enable = true;
		package = pkgs.kanshi;
		settings = [
			{ profile.name = "docked";
				profile.outputs = [
					{
						criteria = "eDP-1";
						
					}
				];
			}
		];
		extraConfig = ''
			profile {
				output eDP-1 mode 2560x1600 position 0,0 scale 1.6
			}

			profile {
				output eDP-1 disable
				output HDMI-A-1 enable mode 2560x1440 position 2560,0
				output DP=1 enable mode 2560x1440 position 0,0
			}
		'';
	};
}
