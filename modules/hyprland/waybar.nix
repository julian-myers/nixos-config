{ config, pkgs, ... }:
let
	darkbg = "#1A1B29";
  bg = "#282a36";
  fg = "#5B6078"; # "#f8f8f2";
  cyan = "#8be9fd";
  green = "#50fa7b";
  orange = "#ffb86c";
  pink = "#ff79c6";
  purple = "#bd93f9";
  red = "#ff5555";
  yellow = "#f1fa8c";
	black = "#5B6078";

	base = "#191724";
	surface = "#1f1d2e";
	overlay = "#26233a";
	muted = "#6e6a86";
	subtle = "#908caa";
	text = "#e0def4";
	love = "#eb6f92";
	gold = "#f6c177";
	rose = "#ebbcba";
	pine = "#31748f";
	foam = "#9ccfd8";
	iris = "#c4a7e7";
	hlow = "#2a283e";
	hmed = "#44415a";
	hhigh = "#56526e";
in 
{
	home.packages = with pkgs; [
		jsoncpp
		glib
		wayland
		wlroots
	];

	programs.waybar = {
		enable = true;
		package = pkgs.waybar;
		settings = {
			mainBar = {
				position = "bottom";
				margin-left = 15;
				margin-right = 15;
				modules-left = [ "custom/nix" "hyprland/workspaces" "hyprland/window" ];
				modules-center = [ "clock" ];
				modules-right = [  "wireplumber" "cava" "network" "bluetooth" "battery" "idle_inhibitor" "tray" "custom/power" ];

				outputs = [ "DP-1" "eDP-1" ];
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
					persistent-workspaces = {
						"DP-2" = [ "1" "2" "3" "4" "5"];
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
					format = "{icon} {capacity}%";
					format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
					format-charging = "󰂅 {capacity}%";
				};

				"network" = {
					format = "{ifname}";
					format-wifi = " {icon}";
					format-icons = [ "󰤟" "󰤢" "󰤥" "󰤨" "󰤨" ];
					format-disconnected = "󰤮";
					max-length = 50;
					tooltip = true;
					tooltip-format-wifi = "{essid} -- Strength:{signalStrength}%,  {bandwidthUpBytes} B/s,  {bandwidthDownBytes} B/s";
					tooltip-format-disconnected = "Disconnected";
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
					format = ""; 
					format-connected = " {device_alias}"; 
					format-connected-battery = " {device_alias} {device_battery_percentage}%"; 
					on-click = "rofi-bluetooth";
					on-click-right = "bluetoothctl power off";
					on_click_middle = "bluetoothctl power on";
					tooltip = true;
					tooltip-format-off = "{status}";
					tooltip-format-on = "{status}";
					tooltip-format-enumerate-connected = "{device_enumerate}";
					tooltip-format-enumerate-connected-battery = "{device_enumerate} {device_battery_percentage}%";
				};

				"idle_inhibitor" = {
					format = "{icon}";
					format-icons = {
						activated = "󰅶 ";
						deactivated = "󰛊 ";
					};
				};
			};	
		};	

		style = ''
			* {
				font-family: JetBrainsMono Nerd Font;
				font-size: 12px;
				font-weight: bold;
				opacity: 0.95;
				padding-top: 2px;
				padding-bottom: 2px;
			}

			window#waybar {
				background-color: ${base};
				opacity: 0.7;
				color: ${rose};
				border: 1px solid ${rose};
				border-radius: 10px;
			}

			#workspaces {
				padding:0.1em 0.6em;
				background-color: ${overlay};
				border:1px solid ${rose};
				border-radius: 10;
				margin:0.0em 0.8em;
			}

			#window {
				color: ${rose};
				padding-left: 10px;
				padding-right: 10px;
				margin-left: 15px;
				font-size: 14;
			}

			#workspaces button {
				padding: 0.0 0.4em;
				background-color: transparent;
				color: ${rose};
				margin: 0.0em 0.2em;
			}

			#workspaces button.visible {
				color: ${rose};
			}

			#workspaces button.active {
				color: ${foam};
			}

			#clock {
				background: ${overlay};
				padding: 0.1em 0.4em;
				color: ${rose};
				margin: 0.0em 0.8em;
				border: 1px solid ${rose};
				border-radius: 10;
			}

			#battery {
				background: ${overlay};
				padding-right: 20px;
				padding-left: 0px;
				color: ${rose};
				margin-left: 0px;
				margin-right: 0px;
				border-right: 0px solid ${rose};
				border-top: 1px solid ${rose};
				border-bottom: 1px solid ${rose};
				border-left: 0px solid;
				border-radius: 0px;
			}

			#battery.charging {
				color: ${muted};
			}

			#battery.good {
				color: ${rose};
			}

			#battery.warning {
				color: ${gold}
			}

			#battery.critical {
				color: ${love}
			}

			#network {
				background: ${overlay};
				padding-right: 20px;
				padding-left: 10px;
				margin-left: 5px;
				margin-right: 0px;
				color: ${rose};
				border-top: 1px solid ${rose};
				border-bottom: 1px solid ${rose};
				border-right: 0px;
				border-left: 1px solid ${rose};
				border-radius: 10px 0px 0px 10px;
			}

			#network.disabled {
				color: ${rose};
			}

			#network.wifi {
				color: ${rose};
			}

			#network.disconnected {
				color: ${gold};
			}


			#wireplumber {
				background: ${overlay};
				padding: 0.1em 0.4em;
				color: ${rose};
				border-right: 0px;
				border-left: 1px solid ${rose};
				border-top: 1px solid ${rose};
				border-bottom: 1px solid ${rose};
				border-radius: 10px 0px 0px 10px;
				margin-left: 15px;
				margin-right: 0px;
			}

			#tray {
				background: ${overlay};
				padding-right: 15px;
				color: ${rose};
				margin-left: 0px;
				margin-right: 5px;
				border-right: 1px solid ${rose};
				border-top: 1px solid ${rose};
				border-bottom: 1px solid ${rose};
				border-left: 0px solid;
				border-radius: 0px 10px 10px 0px;
			}

			#custom-nix {
				background: transparent;
				color: ${foam};
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 15px;
				margin-right: 10px;
				font-size: 18;
			}

			#custom-power {
				background: ${love};
				padding-right: 12px;
				padding-left: 10px;
				padding-top: 0;
				padding-bottom: 0;
				color: ${overlay};
				border: 1px solid ${overlay};
				border-radius: 10;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 5px;
				margin-right: 15px;
			}

			#cava {
				background: ${overlay};
				color: ${rose};
				font-size: 10;
				border-radius: 0px 10px 10px 0px;
				border-left: 0px;
				border-right: 1px solid ${rose};
				border-top: 1px solid ${rose};
				border-bottom: 1px solid ${rose};
				padding-right: 10px;
				padding-left: 10px;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 0px;
				margin-right: 5px;
			}

			#bluetooth {
				background: ${overlay};
				padding-right: 20px;
				padding-left: 0px;
				color: ${rose};
				margin-left: 0px;
				margin-right: 0px;
				border-right: 0px solid ${rose};
				border-top: 1px solid ${rose};
				border-bottom: 1px solid ${rose};
				border-left: 0px solid;
				border-radius: 0px;
			}

			#bluetooth.off {
				color: ${rose};
			} 

			#bluetooth.on {
				color: ${rose};
			}

			#bluetooth.connected {
				color: ${rose};
			}

			#idle_inhibitor {
				color: ${rose};
				background: ${overlay};
				border-radius: 0px;
				border-left: 0px;
				border-right: 0px;
				border-top: 1px solid ${rose};
				border-bottom: 1px solid ${rose};
				padding-left: 0px;
				padding-right: 20px;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 0px;
				margin-right: 0px;
			}

			#idle_inhibitor.activated {
				color: ${rose};
			}

			#idle_inhibitor.deactivated {
				color: ${rose};
			}
		'';
	};
}
