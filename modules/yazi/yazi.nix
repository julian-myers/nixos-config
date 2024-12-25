{ config, pkgs, ... }:
let
	yazi-flavors = pkgs.fetchFromGitHub {
		owner = "bennyyip";
		repo = "gruvbox-dark.yazi";
		rev = "main";
		sha256 = "00s8vif09xhfw9rxnm8acbji9l8c517rqd5zxaipdfh9zmf4g5pm";
	};
in 
{
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;

		flavors = {
			gruvbox-dark = yazi-flavors; 
		};

		theme = {
			flavor = {
				dark = "gruvbox-dark";
				light = "gruvbox-dark";
			};
		};

		settings = {
			manager = {
				ratio = [ 1 3 4 ];
				sort_by = "alphabetical";
				sort_dir_first = true;
				linemode = "mtime";
				title_format = "cwd";
			};
			preview = {
				wrap = "no";
			};
			opener = {
				edit = [
						{ run = "$EDITOR $1"; orphan = false; block = true; }
				];
			};

		};

	};
}
