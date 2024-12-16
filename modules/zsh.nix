{ config, pkgs, ... }:
let
  myAliases = {
		ll = "ls -l";
		".." = "cd ..";
		la = "ls -a";
	};
in {	
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
		shellAliases = myAliases;
	};
}
