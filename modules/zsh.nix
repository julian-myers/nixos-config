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
			enable = false;
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
			analysis-book = "cd ~/School/spring2025/mth428/ && open primer-real-analysis.pdf";
			anvilcomp = "cd ~/School/TLR-2025 && ssh -i supercomputer x-jmyers4@login03.anvil.rcac.purdue.edu";
			deltacomp = "cd ~/School/TLR-2025 && ssh -l jmyers4 dtai-login.delta.ncsa.illinois.edu -o PreferredAuthentications=keyboard-interactive,password";
			bsc104 = "cd ~/School/fall2025/bsc104";
			cs210 = "cd ~/School/fall2025/cs210";
			cs480 = "cd ~/School/fall2025/cs480";
			mth220 = "cd ~/School/fall2025/mth220";
			sta412 = "cd ~/School/fall2025/sta412";
			glocal = "ssh -i ~/.ssh/globallocal.pem julian-m@18.219.105.207";
		};

		zsh-abbr = {
			enable = true;
			abbreviations = {
				hms = "home-manager switch --flake .#julian-m";
				nrs = "nixos-rebuild switch --flake .";
			};
		};

		plugins = [
			{
				name = "zsh-nix-shell";
				file = "nix-shell.plugin.zsh";
				src = pkgs.fetchFromGitHub {
				  owner = "chisui";
				  repo = "zsh-nix-shell";
				  rev = "v0.8.0";
				  sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
				};
			}
		];
	};


}
