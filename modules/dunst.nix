{ config, pkgs, ... }:
{
	services.dunst = {
		enable = true;

		iconTheme = {
			name = "Papirus";
			package = pkgs.papirus-icon-theme;
			size = "32x32";
		};

		settings = {
			global = {
				width = 200;
				height = 200;

				origin = "top-right";
				transparency = 10;
				font = "JetBrainsMono";
				
			};

		};

	};

}
