{ pkgs, inputs, ... }:
{
	gtk = {
		enable = true;
		font = {
			name = "JetBrainsMono Nerd Font";
			package = (pkgs.nerdfonts.override { fonts = ["JetBrainsMono"]; });
			size = 12;
		};

		#catppuccin = {
		#	enable = true;
		#	flavor = "mocha";
		#	accent = "blue";
		#	size = "standard";
		#	tweaks = [ "normal" ];
		#};

		cursorTheme = {
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
		};
	};

}
