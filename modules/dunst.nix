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
				width = 300;
				height = 300;

				origin = "center";
				transparency = 10;
				frame-color = "b5bddd";
				font = "JetBrainsMono";
				
				frame-width = "3";
				corner-radius = "10";
			};

		};

	};

}
