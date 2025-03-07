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
			display-window = " ";
			display-keys = " ";
			display-run = " ";
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
				bg: #1A1B29ff;
				bg-alt: #282a36e6;
				fg: #f8f8f2e6;
				fg-alt: #665c54e6;
				black1: #5B6078ff;
				black2: #928374ff;
				red: #ff5555ff;
				green: #50fa7bff;
				yellow: #f1fa8cff;
				blue: #bd93f9ff;
				magenta: #ff79c6ff; 
				cyan: #8be9fdff;
				white: #d4be98ff;

				base: #191724;
				surface: #1f1d2e;
				overlay: #26233a;
				muted: #6e6a86;
				subtle: #908caa;
				text: #e0def4;
				love: #eb6f92;
				gold: #f6c177;
				rose: #ebbcba;
				pine: #31748f;
				foam: #9ccfd8;
				iris: #c4a7e7;
				hlow: #2a283e;
				hmed: #44415a;
				hhigh: #56526e;

				border: 0px;
				margin: 0px;
				padding: 0px;
				spacing: 0px;
			}

			window {
				location: center;
				border-radius: 15px;
				transparency: "real";
				height: 33em;
				width: 63em;
				background-color: transparent;
			}

			mainbox {
				background-color: transparent;
				border: 2px solid;
				border-color: @rose;
				border-radius: 15px;
				orientation: horizontal;
				children: [ "dummywall" , "listbox" ];
			}

			dummywall {
				width: 5em;
				expand: false;
				orientation: horizontal;
				background-color: transparent;
				children: [ "mode-switcher" ];
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
				background-color: @base;
				text-color: @subtle;
				border: 2px solid;
				border-color: @subtle;
			}

			button selected {
				text-color: @foam;
			}

			inputbar {
				enabled: true;
				children: [ "prompt" , "entry" ];
				background-color: @text;
				text-color: @base;
				border: 0px;
				border-radius: 15px; 
				padding: 10px;
			}

			prompt {
				enable: true;
				background-color: @text;
				text-color: @base;
			}

			entry {
				background-color: @text;
				text-color: @base;
			}

			listbox {
					spacing:                     0em;
					padding:                     1em;
					children:                    [ "dummy" , "inputbar" , "listview" , "dummy" ];
					background-color:            transparent;
			}

			listview {
					enabled:                     true;
					spacing:                     0.1em;
					padding:                     0.2em;
					columns:                     2;
					lines:                       7;
					cycle:                       false;
					dynamic:                     true;
					scrollbar:                   false;
					layout:                      vertical;
					reverse:                     false;
					expand:                      false;
					fixed-height:                true;
					fixed-columns:               true;
					cursor:                      "default";
					background-color:            transparent;
					text-color:                  @text;
			}

			/**
			scrollbar {
				background-color: @base;
				handle-width: 10px;
				handle-color: @subtle;
				border: 1px solid;
				border-color: @text;
				border-radius: 10px;
			} */

			dummy {
					background-color:            transparent;
			}


			// Elements //
			element {
					enabled:                     true;
					spacing:                     1em;
					padding:                     0.4em;
					border: 1px solid;
					border-color: transparent;
					border-radius: 10px;
					cursor:                      pointer;
					background-color:            transparent;
					text-color:                  @text;
			}

			element selected.normal {
					background-color:            @base;
					text-color:                  @pine;
					border-color: @rose;
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
