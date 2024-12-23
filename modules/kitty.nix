{ config, pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono";
			size = 12;
		};
		shellIntegration.enableZshIntegration = true;

		themeFile = "GruvboxMaterialDarkHard";
	};
}
