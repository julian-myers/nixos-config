{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		rofi-power-menu
		rofi-calc
		rofi-bluetooth
	];
	programs.rofi = {
		enable = true;
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

				red1: #ff5555;

				green: #50fa7b;

				yellow1: #f1fa8c;

				blue1: #bd93f9;

				magenta1: #ff79c6; 

				cyan1: #8be9fd;

				white1: #d4be98;
				white2: #d4be98;

				background-color: @bg;

				border: 0px;
				margin: 0;
				padding: 0;
				spacing: 0;
			}

			window {
				location: center;
				width: 30%;
				border-radius: 15px;
				transparency: "real";
			}

			dummywall {
				spacing: 0em;
				padding: 0em;
				width: 37em;
				expand: false;
				orientation: horizontal;
				children: [ "mode-switcher" , "inputbar" ];
				background-color: transparent;
			}


			mode-switcher{
				orientation: vertical;
				enabled: true;
				width: 3.8em;
				padding: 9.2em 0.5em 9.2em 0.5em;
				spacing:  1.2em;
				background-color: transparent;
			}

			button {
				border-radius: 10px;
				background-color: @bg;
				text-color: @fg;
			}
			button selected {
				background-color: @fg;
				text-color: @black1;
			}

			element {
				margin: 2px 10px;
				text-color: @fg;
				padding: 10px;
				border: 1px solid;
				border-radius: 15px;
			}

			element selected {
				text-color: @black1;
				background-color: @black1;
				border: 1px solid;
				border-color: @black1;
			}

			element-text {
				background-color: inherit;
				text-color: @fg;
				vertical-align: 0.5;
			}

			element-icon {
				size: 40;
				horizontal-align: 0.5;
			}

			entry {
				background-color: @fg;
				text-color: @bg;
			}

			inputbar {
				children: [prompt, entry];
				padding: 10px;
				background-color: @fg;
				text-color: @bg;
				border-radius: 15px;
				margin: 10px;
				orientation: horizontal;
			}

			listbox {
				spacing:                     0em;
				padding:                     2em;
				children:                    [ "dummy" , "listview" , "dummy" ];
				background-color:            transparent;
			}

			listview {
				background-color: @bg-alt;
				columns: 1;
				lines: 8;
				scrollbar: true;
				scrollbar-width: 10px;
				cycle: false;
				layout: vertical;
			}

			dummy {
					background-color:            transparent;
			}

			scrollbar {
				background-color: @bg;
				handle-width: 10px;
				handle-color: @black1;
				border: 1px solid;
				border-color: @fg;
				border-radius: 10px;
			}

			mainbox {
				background-color: @bg-alt;
				border: 2px solid 2px solid 2px solid 2px solid;
				border-color: @fg;
				border-radius: 15px;
				children: [ "dummywall" , "listbox" ];
			}

			prompt {
				enable: true;
				background-color: @fg;
				text-color: @bg;
			}
		'';
	};
}
