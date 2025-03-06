{ config, pkgs, ... }:
{
	gtk = {
		enable = true;

		font = {
			name = "JetBrainsMono Nerd Font";
			package = (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; });
			size = 12;
		};

		iconTheme = {
			name = "rose-pine-moon";
			package = pkgs.rose-pine-icon-theme;
		};

		theme = {
			name = "rose-pine-moon";
			package = pkgs.rose-pine-gtk-theme;
		};

		cursorTheme = {
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
		};
	};
}
