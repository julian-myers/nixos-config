{ config, pkgs, ... }:
{
	programs.yazi = {
		enable = true;
		enableZshIntergration = true;
	};
}
