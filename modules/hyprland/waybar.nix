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
				modules-left = [ "hyprland/workspaces" "hyprland/window" ];
				modules-center = [ "clock" ];
				modules-right = [ "wireplumber" "network" "battery" ];

				"hyprland/workspaces" = {
					format = "{icon}";
					format-icons = {
							"1"="";
							"2"="";
							"3"="";
							"4"="";
							"5"="";
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
				border:1px solid ${black};
				border-radius: 10;
				margin:0.0em 0.8em;
			}

			#window {
				color: ${purple};
				background-color: ${darkbg};
				border: 1px solid ${black};
				border-radius: 10;
				padding-left: 10px;
				padding-right: 10px;
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
				color: ${pink};
				margin: 0.0em 0.8em;
				border: 1px solid ${black};
				border-radius: 10;
			}

			#battery {
				background: ${darkbg};
				padding: 0.1em 0.4em;
				color: ${cyan};
				margin: 0.0em 0.8em;
				border: 1px solid ${black};
				border-radius: 10;
			}

			#battery.good {
				color: ${cyan};
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
				color: ${yellow};
				margin: 0.0em 0.8em;
				border: 1px solid ${black};
				border-radius: 10;
			}

			#network.wifi {
				color: ${yellow};
			}

			#wireplumber {
				background: ${darkbg};
				padding: 0.1em 0.4em;
				color: ${orange};
				margin: 0.0em 0.8em;
				border: 1px solid ${black};
				border-radius: 10;
			}
		'';
	};
}
