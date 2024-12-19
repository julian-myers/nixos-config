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
				bg: #24273A;
				bg-alt: #F4DBD6;

				fg: #CAD3F5;
				fg-alt: #494D64;

				black1: #494D64;
				black2: #5B6078;

				red1: #ED8796;

				green1: #A6DA95;

				yellow1: #EED49F;

				blue1: #8AADF4;

				magenta1: #F5BDE6; 

				cyan1: #8BD5CA;

				white1: #B8C0E0;
				white2: #A5ADCB;

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
				text-color: @white1;
			}

			element selected {
				text-color: @blue1;
				background-color: @black2;
			}

			element-text {
				background-color: inherit;
				text-color: inherit;
				vertical-align: 0.5;
			}

			element-icon {
				size: 30;
			}

			entry {
				background-color: @white1;
				padding: 12;
			text-color: @black2;
			}

			inputbar {
				children: [prompt, entry];
			}

			listview {
				background-color: @bg;
				columns: 1;
				lines: 8;
			}

			mainbox {
				background-color: @bg;
				children: [inputbar, listview];
				border: 3px solid;
				border-color: @white1;
			}

			prompt {
				background-color: @white1;
				enable: true;
				padding: 12 0 0 12;
				text-color: @black1;
			}
		'';
	};
}
