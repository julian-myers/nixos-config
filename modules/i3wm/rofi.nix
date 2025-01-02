{ config, pkgs, ... }:
{
	home.file.".config/rofi/config.rasi" = {
		text = ''
			configuration {
				display-drun: "Apps: ";
				display-window: "Windows: ";
				drun-display-format: "{icon} {name}";
				font: "JetBrainsMono Nerd Font Semibold 12";
				modi: "drun,filebrowser,window,keys,run";
				show-icons: true;
				icon-theme: "Papirus";
			}

			@theme "/dev/null"

			* {
				bg: #1A1B29;
				bg-alt: #282a36;

				fg: #f8f8f2;
				fg-alt: #665c54;

				black1: #5B6078;
				black2: #928374;

				red1: #ff5555;

				green1: #50fa7b;

				yellow1: #f1fa8c;

				blue1: #bd93f9;

				magenta1: #ff79c6; 

				cyan1: #8be9fd;

				white1: #d4be98;
				white2: #d4be98;

				background-color: @bg;

				border: 0;
				margin: 0;
				padding: 0;
				spacing: 0;
			}

			window {
				width: 45%;
			}

			element {
				padding: 12;
				text-color: @fg;
			}

			element selected {
				text-color: @yellow1;
				background-color: @black1;
			}

			element-text {
				background-color: inherit;
				text-color: inherit;
				vertical-align: 0.5;
			}

			element-icon {
				size: 40;
			}

			entry {
				background-color: @bg;
				padding: 12;
				text-color: @blue1;
			}

			inputbar {
				children: [prompt, entry];
			}

			listview {
				background-color: @bg-alt;
				columns: 1;
				lines: 8;
			}

			mainbox {
				background-color: @bg-alt;
				children: [inputbar, listview];
				border: 3px solid;
				border-color: @blue1;
			}

			prompt {
				background-color: @bg;
				enable: true;
				padding: 12 0 0 12;
				text-color: @magenta1;
			}
		'';
	};
}
