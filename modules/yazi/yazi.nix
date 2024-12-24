{ config, pkgs, ... }:
{
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;

		flavors = {
			gruvbox-dark = ./gruvbox-dark;
		};

	};
}
