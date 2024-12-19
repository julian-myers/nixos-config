{ config, pkgs, ... }:

{
	imports = [
		./modules/zsh.nix
		./modules/i3wm/i3wm.nix
		./modules/i3wm/polybar.nix
		./modules/i3wm/picom.nix
		./modules/i3wm/rofi.nix
		./modules/autorandr.nix
		./modules/qutebrowser.nix
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
		ripgrep
		xclip
		flameshot
		texliveFull
		cmatrix
		unzip
		btop
		conky
		papirus-icon-theme
		dunst
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

  home.sessionVariables = {
		EDITOR = "neovim";
  };

  programs.home-manager.enable = true;
}
