{ pkgs, inputs, ... }:
{

	catppuccin = {
		gtk = {
			enable = true;
			flavor = "mocha";
			accent = "blue";
			icon = {
				enable = true;
				accent = "lavender";
				flavor = "mocha";
			};
		};

		zathura = {
			enable = true;
			flavor = "mocha";
		};

		btop = {
			enable = true;
			flavor = "mocha";
		};

		cava = {
			enable = true;
			flavor = "mocha";
		};

		dunst = {
			enable = true;
			flavor = "mocha";
		};
	};

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
