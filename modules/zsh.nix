{ config, pkgs, ... }:
{	

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		syntaxHighlighting = {
			enable = true;
		};

		autosuggestion.enable = true;
		oh-my-zsh = {
			enable = true;
			theme = "refined";
		};

		shellAliases = {
			ll = "ls-l";
			".." = "cd ..";
			la = "ls -a";
		};

		zsh-abbr = {
			enable = true;
			abbreviations = {
				hms = "home-manager switch --flake .";
				nrs = "nixos-rebuild switch --flake .";
			};
		};


	};
}
