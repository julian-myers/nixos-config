{ config, pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono";
			size = 14;
		};
		shellIntegration.enableZshIntegration = true;

		themeFile = "GruvboxMaterialDarkSoft";
	};
}
