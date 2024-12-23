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
				bg: #3c3836;
				bg-alt: #32302f;

				fg: #d4be98;
				fg-alt: #665c54;

				black1: #665c54;
				black2: #928374;

				red1: #EA6962;

				green1: #a9b665;

				yellow1: #e78a4e;

				blue1: #7daea3;

				magenta1: #d3869b; 

				cyan1: #89b482;

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
				text-color: @white1;
			}

			element selected {
				text-color: @yellow1;
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
