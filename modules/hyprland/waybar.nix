{ config, pkgs, ... }:
let
	darkbg = "#1A1B29";
  bg = "#282a36";
  fg = "#f8f8f2";
  cyan = "#8be9fd";
  green = "#50fa7b";
  orange = "#ffb86c";
  pink = "#ff79c6";
  purple = "#bd93f9";
  red = "#ff5555";
  yellow = "#f1fa8c";
	black = "#5B6078";
in 
{
	programs.waybar = {
		enable = true;
		package = pkgs.waybar;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				height= 30;
				output = [ "HDMI-A-1" "DP-1" "eDP-1" ];
				modules-left = [ "custom/nix" "hyprland/workspaces" "hyprland/window" ];
				modules-center = [ "clock" ];
				modules-right = [  "wireplumber" "cava" "network" "bluetooth" "battery" "tray" "custom/power" ];

				"hyprland/workspaces" = {
					format = "{icon}";
					format-icons = {
							"1"="";
							"2"="";
							"3"="";
							"4"="";
							"5"="";
							"6"="󰲫 ";
							"7"="󰲭 ";
							"8"="󰲯 ";
							"9"="󰲱 ";
							"default"= " ";
					};
					all-outputs = true;
					persistent-workspaces = {
						"HDMI-A-1" = [ "1" "2" "3" "4" "5"];
						"DP-1" = [ "1" "2" "3" "4" "5"];
						"eDP-1" = [ "1" "2" "3" "4" "5"];
					};
				};

				"hyprland/window" = {
					format = " {title}";
					max-length = 50;
					separate-outputs = true;
				};

				"clock" = {
					format = "   {:%I:%M}  ";
					format-alt = "  {:%A, %B %d, %Y   %R}";
					tooltip-format = "<tt><small>{calendar}</small></tt>";
					calendar = {
					  mode = "year";
						mode-mon-col = 3;
						week-pos = "right";
						on-scroll = 1;
						format = {
							months = "<span color='#f8f8f2'><b>{}</b></span>";
							days = "<span color='#f8f8f2'><b>{}</b></span>";
							weeks = "<span color='#f8f8f2'><b>W{}</b></span>";
							weekdays = "<span color='#f8f8f2'><b>{}</b></span>";
							today = "<span color='#f8f8f2'><b><u>{}</u></b></span>";
						};
					};
					actions = {
						on-click-right = "mode";
					};
				};

				
				"battery" = {
					bat = "BAT0";
					interval = 30;
					states = {
						"warning" = 25;
						"critical" = 10;
						"good" = 100;
					};
					format = "  {icon} {capacity}  ";
					format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
				};

				"network" = {
					format = "{ifname}";
					format-wifi = " {icon} {essid} {signalStrength}% ";
					format-icons = [ " " ];
					max-length = 50;
				};

				"wireplumber" = {
					format = " {icon} {volume} ";
					format-muted = "  "; 
					format-icons = [ "  " "  " ];
				};

				"tray" = {
					icon-size = 12;
					spacing = 15;
					show-passive-items = true;
				};

				"custom/nix" = {
					format = " 󱄅 ";
				};

				"custom/power" = {
					format = "  ";
					exec = "echo hello";
					on-click = "rofi -show power-menu -modi power-menu:rofi-power-menu";
				};

				"cava" = {
					framerate = 30;
					autosens = 1;
					stereo = false;
					bars = 14;
					lower_cutoff_freq = 20;
					higher_cutoff_freq = 10000;
					method = "pulse";
					source = "auto";
					reverse = false;
					bar_delimiter = 0;
					monstercat = false;
					waves = false;
					input_delay = 2;
					format-icons =  [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
					actions = {
						on-click-right = "mode";
					};
				};

				"bluetooth" = {
					format = " {status}"; 
					format-connected = " {device_alias}"; 
					format-connected-battery = " {device_alias} {device_battery_percentage}%"; 
				};
			};	
		};	

		style = ''
			* {
				font-family: JetBrainsMono Nerd Font;
				font-size: 12px;
				font-weight: bold;
			}

			window#waybar {
				background-color: transparent;
				color: ${fg};
				margin: 10px 15px;
				padding: 0px;
			}

			#workspaces {
				padding:0.1em 0.6em;
				background-color: ${darkbg};
				border:1px solid ${fg};
				border-radius: 10;
				margin:0.0em 0.8em;
			}

			#window {
				color: ${orange};
				padding-left: 10px;
				padding-right: 10px;
				margin-left: 15px;
				font-size: 14;
			}

			#workspaces button {
				padding: 0.0 0.4em;
				background-color: transparent;
				color: ${black};
				margin: 0.0em 0.2em;
			}

			#workspaces button.visible {
				color: ${fg};
			}

			#workspaces button.active {
				color: ${green};
			}

			#clock {
				background: ${darkbg};
				padding: 0.1em 0.4em;
				color: ${fg};
				margin: 0.0em 0.8em;
				border: 1px solid ${fg};
				border-radius: 10;
			}

			#battery {
				background: ${darkbg};
				padding: 0.1em 0.4em;
				color: ${fg};
				margin-left: 0px;
				margin-right: 0px;
				border-right: 0px solid ${fg};
				border-top: 1px solid ${fg};
				border-bottom: 1px solid ${fg};
				border-left: 0px solid;
				border-radius: 0px;
			}

			#battery.good {
				color: ${fg};
			}

			#battery.warning {
				color: ${yellow}
			}

			#battery.critical {
				color: ${red}
			}

			#network {
				background: ${darkbg};
				padding: 0.1em 0.4em;
				margin-left: 5px;
				margin-right: 0px;
				color: ${fg};
				border-top: 1px solid ${fg};
				border-bottom: 1px solid ${fg};
				border-right: 0px;
				border-left: 1px solid ${fg};
				border-radius: 10px 0px 0px 10px;
			}

			#network.wifi {
				color: ${fg};
			}

			#wireplumber {
				background: ${darkbg};
				padding: 0.1em 0.4em;
				color: ${fg};
				border-right: 0px;
				border-left: 1px solid ${fg};
				border-top: 1px solid ${fg};
				border-bottom: 1px solid ${fg};
				border-radius: 10px 0px 0px 10px;
				margin-left: 15px;
				margin-right: 0px;
			}

			#tray {
				background: ${darkbg};
				padding-right: 15px;
				color: ${fg};
				margin-left: 0px;
				margin-right: 5px;
				border-right: 1px solid ${fg};
				border-top: 1px solid ${fg};
				border-bottom: 1px solid ${fg};
				border-left: 0px solid;
				border-radius: 0px 10px 10px 0px;
			}

			#custom-nix {
				background: transparent;
				color: ${cyan};
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 15px;
				margin-right: 10px;
				font-size: 18;
			}

			#custom-power {
				background: ${red};
				padding-right: 12px;
				padding-left: 10px;
				padding-top: 0;
				padding-bottom: 0;
				color: ${darkbg};
				border: 1px solid ${darkbg};
				border-radius: 10;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 5px;
				margin-right: 15px;
			}

			#cava {
				background: ${darkbg};
				color: ${cyan};
				font-size: 10;
				border-radius: 0px 10px 10px 0px;
				border-left: 0px;
				border-right: 1px solid ${fg};
				border-top: 1px solid ${fg};
				border-bottom: 1px solid ${fg};
				padding-right: 10px;
				padding-left: 10px;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 0px;
				margin-right: 5px;
			}

			#bluetooth {
				background: ${darkbg};
				padding: 0.1em 0.4em;
				color: ${fg};
				margin-left: 0px;
				margin-right: 0px;
				border-right: 0px solid ${fg};
				border-top: 1px solid ${fg};
				border-bottom: 1px solid ${fg};
				border-left: 0px solid;
				border-radius: 0px;
			}
		'';
	};
}
