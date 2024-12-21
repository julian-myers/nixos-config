{ config, pkgs, ... }:

{
	imports = [
		./modules/zsh.nix
		./modules/i3wm/i3wm.nix
		./modules/i3wm/polybar3.nix
		./modules/i3wm/picom.nix
		./modules/i3wm/rofi.nix
		./modules/autorandr.nix
		./modules/qutebrowser.nix
		./modules/dunst.nix
	];

  home.username = "julian-m";
  home.homeDirectory = "/home/julian-m";

  home.stateVersion = "24.11";

	nixpkgs.config = {
		allowUnfree = true;
	};

	programs.autorandr = {
		enable = true;
	};

	programs.git = {
		enable = true;
		userName = "julian-myers";
		userEmail = "myers254@marshall.edu";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};

  home.packages = with pkgs;[
		mpd
		mopidy
		rofi-bluetooth
		systemdUkify
		libnotify
		qutebrowser
		xcolor
		obsidian
		ripgrep
		xclip
		flameshot
		texliveFull
		xorg.xev
		fortune
		findutils
		cmatrix
		unzip
		btop
		conky
		papirus-icon-theme
		autorandr
		brightnessctl
		pciutils
		discord
		spotify
		fzf
		screenkey
		read-edid
		cargo
		tree-sitter
		i3
		feh
		polybar
		wget
		rofi
		curl
		neofetch
		tree
		picom
		font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  home.sessionVariables = rec {
		EDITOR = "neovim";
  };

  programs.home-manager.enable = true;
}
