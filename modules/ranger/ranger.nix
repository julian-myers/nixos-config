{ config, pkgs, ... }:
{
	home.file.".config/ranger/rc.conf".source = ./rc.conf;
	home.file.".config/ranger/rifle.conf" = {
		source = ./rifle.conf;
		executable = true;
	};
	home.file.".config/ranger/scope.sh" = {
		source = ./scope.sh;
		executable = true;
	};
	home.file.".config/ranger/commands.py" = {
		source = ./commands.py;
		executable = true;
	};
	home.file.".config/ranger/colorschemes/gruvbox.py" = {
		source = ./colorshemes/gruvbox.py;
		executable = true;
	};
}
