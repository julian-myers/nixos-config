{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		rofi-power-menu
		rofi-calc
		rofi-bluetooth
	];
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;
		plugins = with pkgs; [
			rofi-bluetooth
			rofi-power-menu
			rofi-calc
		];

		extraConfig = {
			display-drun = " ";
			display-window = "Windows: ";
			drun-display-format = " {icon} {name} ";
			font = "JetBrainsMono Nerd Font Semibold 12";
			modi = "drun,window,keys,run";
			show-icons = true;
			icon-theme = "Papirus";
			window-format = "{w}{t}";
		};
		theme = "~/.config/rofi/theme.rasi";
	};

	home.file.".config/rofi/theme.rasi" = {
		text = ''
			@theme "/dev/null"
			* {
				bg: #1A1B29;
				bg-alt: #282a36;
				fg: #f8f8f2;
				fg-alt: #665c54;
				black1: #5B6078;
				black2: #928374;
				red: #ff5555;
				green: #50fa7b;
				yellow: #f1fa8c;
				blue: #bd93f9;
				magenta: #ff79c6; 
				cyan: #8be9fd;
				white: #d4be98;

				background-color: @bg;
				border: 0px;
				margin: 0px;
				padding: 0px;
				spacing: 0px;
			}

			window {
				location: center;
				border-radius: 15px;
				transparency: "real"
				height: 33em;
				width: 63em;
			}

			mainbox {
				background-color: transparent;
				border: 2px solid;
				border-color: @fg;
				border-radius: 15px;
				orientation: horizontal;
				children: [ "dummywall", "listbox"];
			}

			dummywall {
				width: 37em;
				expand: false;
				orientation: horizontal;
				background-color: transparent;
				background-image: url("~/Personal/pics/wallpapers/bwdune.png", height);
			}

			mode-switcher {
				orientation: vertical;
				enabled: true;
				width: 3.8em;
				padding: 9.2em 0.5em 9.2em 0.5em;
				spacing: 1.2em;
				background-color: transparent;
			}

			button {
				cursor: pointer;
				vertical-align: 0.50;
				horizontal-align: 0.45;
				border-radius: 2em;
				background-color: @bg;
				text-color: @fg;
			}

			button selected {
				background-color: @fg;
				text-color: @bg;
			}

			inputbar {
				enabled: true;
				children: [ "entry" ];
				background-color: transparent;
			}

			entry {
				background-color: @fg;
				text-color: @bg;
			}

			listbox {
					spacing:                     0em;
					padding:                     2em;
					children:                    [ "dummy" , "listview" , "dummy" ];
					background-color:            transparent;
			}
			listview {
					enabled:                     true;
					spacing:                     0em;
					padding:                     0em;
					columns:                     1;
					lines:                       8;
					cycle:                       true;
					dynamic:                     true;
					scrollbar:                   false;
					layout:                      vertical;
					reverse:                     false;
					expand:                      false;
					fixed-height:                true;
					fixed-columns:               true;
					cursor:                      "default";
					background-color:            transparent;
					text-color:                  @main-fg;
			}
			dummy {
					background-color:            transparent;
			}


			// Elements //
			element {
					enabled:                     true;
					spacing:                     1em;
					padding:                     0.4em;
					cursor:                      pointer;
					background-color:            transparent;
					text-color:                  @main-fg;
			}
			element selected.normal {
					background-color:            @select-bg;
					text-color:                  @select-fg;
			}
			element-icon {
					size:                        2.8em;
					cursor:                      inherit;
					background-color:            transparent;
					text-color:                  inherit;
			}
			element-text {
					vertical-align:              0.5;
					horizontal-align:            0.0;
					cursor:                      inherit;
					background-color:            transparent;
					text-color:                  inherit;
			}
		'';
	};
}
