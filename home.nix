{ config, pkgs, ... }:
let
  powercontrols = import ./scripts/powercontrols.nix { inherit pkgs; };
in 
{
	imports = [
		./modules/zsh.nix
		./modules/i3wm/i3wm.nix
		./modules/i3wm/polybar.nix
		./modules/i3wm/picom.nix
		./modules/i3wm/rofi.nix
		./modules/autorandr.nix
		./modules/dunst.nix
		./modules/kitty.nix
		./modules/yazi/yazi.nix
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
		lua-language-server
		jdk
		nix-output-monitor
		nvd
		gnumake
		openssh
		snowmachine
		ffmpeg
		zathura
		yazi
		powercontrols
		kitty-themes
		cava
		spotify-player
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

  home.sessionVariables = {
		EDITOR = "nvim";
		RASPI = "pi@192.168.6.216";
  };

  programs.home-manager.enable = true;
}
