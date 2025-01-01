{ config, pkgs, ... }:
{
	programs.waybar = {
		enable = true;
		package = pkgs.waybar;
		settings = {
			layer = "top";
			position = "top";
			height= 30;
			output = [ "eDP-1" "HDMI-A-1" "DP-1"];

			modules-left = [ "hyprland/workspaces" ];



			"hyprland/workspaces" = {
				format = "{icon}";
				format-icons = {
							1 = " 󰲡 ";
							2 = " 󰲣 ";
							3 = " 󰲥 ";
							4 = " 󰲧 ";
							5 = " 󰲩 ";
							6 = " 󰲫 ";
							7 = " 󰲭 ";
							8 = " 󰲯 ";
							9 = " 󰲱 ";
							active = " ";
							default = " ";
				};
			};

		};	
	};
}
