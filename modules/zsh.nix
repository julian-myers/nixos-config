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
			mth428 = "cd ~/School/spring2025/mth428";
			mth440 = "cd ~/School/spring2025/mth440";
			mth430 = "cd ~/School/spring2025/mth430";
			mth452 = "cd ~/School/spring2025/mth452";
			cs120 = "cd ~/School/spring2025/cs120";

			nixconf = "cd ~/.dotfiles && nvim";
		};

		zsh-abbr = {
			enable = true;
			abbreviations = {
				hms = "home-manager switch --flake .#julian-m";
				nrs = "nixos-rebuild switch --flake .";
			};
		};

	};


}
