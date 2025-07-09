{ config, pkgs, lib, ... }:
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

	colors = import ./colorscheme.nix;
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
				position = "top";
				modules-left = [ "hyprland/workspaces" "hyprland/window" ];
				modules-center = [ "clock" ];
				modules-right = [
					"cava"
					"network"
					#"bluetooth"
					"battery"
					"wireplumber"
					"idle_inhibitor"
					"custom/power"
					];

				# output = [
				#	 "eDP-1"
				# ];

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
				#	persistent-workspaces = {
				#		"*" = 5;
				#	};
				};

				"hyprland/window" = {
					format = " {title}";
					max-length = 50;
					separate-outputs = true;
				};

				"backlight/slider" = {
					min = 0;
					max = 100;
					orientation = "vertical";
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
				padding-top: 2px;
				padding-bottom: 2px;
			}

			window#waybar {
				background-color: transparent;
			}

			window#waybar > box {
				opacity: 0.9;
				border-radius: 15px;
				margin: 4px 8px 8px 8px;
				background-color: ${colors.Crust};
				box-shadow: 4px 4px 8px -2px #101010;
			}

			#workspaces {
				padding:0.1em 0.6em;
				background-color: ${colors.Base};
				border:2px solid ${colors.Lavender};
				border-radius: 10px;
				margin:0.0em 0.8em;
			}

			#window {
				color: ${colors.Peach};
				padding-left: 10px;
				padding-right: 10px;
				margin-left: 15px;
				font-size: 14px;
			}

			#workspaces button {
				padding: 0.0em 0.4em;
				background-color: transparent;
				color: ${colors.Text};
				margin: 0.0em 0.2em;
			}

			#workspaces button.visible {
				color: ${colors.Text};
			}

			#workspaces button.active {
				color: ${colors.Peach};
			}

			#clock {
				background: ${colors.Base};
				padding: 0.1em 0.4em;
				color: ${colors.Text};
				margin: 0.0em 0.8em;
				border: 2px solid ${colors.Lavender};
				border-radius: 10px;
			}

			#battery {
				background: ${colors.Base};
				padding-right: 20px;
				padding-left: 0px;
				color: ${colors.Text};
				margin-left: 0px;
				margin-right: 0px;
				border-right: 0px solid ${colors.Lavender};
				border-top: 2px solid ${colors.Lavender};
				border-bottom: 2px solid ${colors.Lavender};
				border-left: 0px solid;
				border-radius: 0px;
			}

			#battery.charging {
				color: ${colors.Green};
			}

			#battery.good {
				color: ${colors.Text};
			}

			#battery.warning {
				color: ${colors.Yellow}
			}

			#battery.critical {
				color: ${colors.Red}
			}

			#network {
				background: ${colors.Base};
				padding-right: 20px;
				padding-left: 10px;
				margin-left: 5px;
				margin-right: 0px;
				color: ${colors.Text};
				border-top: 2px solid ${colors.Lavender};
				border-bottom: 2px solid ${colors.Lavender};
				border-right: 0px;
				border-left: 2px solid ${colors.Lavender};
				border-radius: 10px 0px 0px 10px;
			}

			#network.disabled {
				color: ${colors.Text};
			}

			#network.wifi {
				color: ${colors.Text};
			}

			#network.disconnected {
				color: ${colors.Text};
			}


			#wireplumber {
				background: ${colors.Base};
				padding-right: 20px;
				padding-left: 0px;
				color: ${colors.Text};
				margin-left: 0px;
				margin-right: 0px;
				border-right: 0px solid ${colors.Lavender};
				border-top: 2px solid ${colors.Lavender};
				border-bottom: 2px solid ${colors.Lavender};
				border-left: 0px solid;
				border-radius: 0px;
			}

			#custom-power {
				background: ${colors.Red};
				padding-right: 12px;
				padding-left: 10px;
				padding-top: 0px;
				padding-bottom: 0px;
				color: ${colors.Base};
				border: 2px solid ${colors.Base};
				border-radius: 10px;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 5px;
				margin-right: 15px;
			}

			#cava {
				color: ${colors.Lavender};
				font-size: 10px;
				padding-right: 10px;
				padding-left: 10px;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 0px;
				margin-right: 5px;
			}

			#idle_inhibitor {
				color: ${colors.Text};
				background: ${colors.Base};
				padding-left: 0px;
				padding-right: 20px;
				margin-top: 0px;
				margin-bottom: 0px;
				margin-left: 0px;
				margin-right: 0px;
				border-right: 2px solid ${colors.Lavender};
				border-top: 2px solid ${colors.Lavender};
				border-bottom: 2px solid ${colors.Lavender};
				border-left: 0px solid;
				border-radius: 0px 10px 10px 0px;
			}

			#idle_inhibitor.activated {
				color: ${colors.Lavender};
			}

			#idle_inhibitor.deactivated {
				color: ${colors.Text};
			}

			#backlight-slider slider {
				min-height: 0px;
				min-width: 0px;
			}

			#backlight-slider trough {
				min-height: 80px;
				min-width: 10px;
			}

			#backlight-slider highlight {
				min-width: 10px;
				background-color: white;
			}
		'';
	};
}
