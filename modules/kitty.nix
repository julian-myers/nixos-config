{ config, pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono";
			size = 14;
		};

		themeFile = "gruvbox_light";
		shellIntegration.enableZshIntegration = true;

		keybindings = {
		};
	};
}
