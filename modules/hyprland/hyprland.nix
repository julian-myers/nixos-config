{ config, pkgs, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			"$terminal" = "kitty";
			"$browser" = "firefox";

			bind = [
				# programs
				"ALT, T, exec, kitty"
				"ALT, F, exec, firefox"
				"ALT, D, exec, rofi -show drun"

				# windows
				"ALT, backspace, killactive,"

				"ALT, h, movefocus, l"
				"ALT, l, movefocus, r"
				"ALT, k, movefocus, u"
				"ALT, j, movefocus, d"

				"ALT_SHIFT, h, movewindow, l"
				"ALT_SHIFT, l, movewindow, r"
				"ALT_SHIFT, k, movewindow, u"
				"ALT_SHIFT, j, movewindow, d"

				# workspaces
				"ALT, 1, workspace, 1"
				"ALT, 2, workspace, 2"
				"ALT, 3, workspace, 3"
				"ALT, 4, workspace, 4"
				"ALT, 5, workspace, 5"
				"ALT, 6, workspace, 6"
				"ALT, 7, workspace, 7"
				"ALT, 8, workspace, 8"
				"ALT, 9, workspace, 9"

				"ALT_SHIFT, 1, movetoworkspace, 1"
				"ALT_SHIFT, 2, movetoworkspace, 2"
				"ALT_SHIFT, 3, movetoworkspace, 3"
				"ALT_SHIFT, 4, movetoworkspace, 4"
				"ALT_SHIFT, 5, movetoworkspace, 5"
				"ALT_SHIFT, 6, movetoworkspace, 6"
				"ALT_SHIFT, 7, movetoworkspace, 7"
				"ALT_SHIFT, 8, movetoworkspace, 8"
				"ALT_SHIFT, 9, movetoworkspace, 9"
			];

			# mouse to resize windows and stuff
			bindm = [
				"ALT, mouse:272, movewindow"
				"ALT, mouse:273, resizewindow"
			];

			# extra keyboard button controls for volume and such.
			bindel = [
				", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
			];
		};

		extraConfig = ''
exec-once = waybar
exec-once = hyprpaper
source = ~/.config/hypr/monitors.conf
		'';
	};
}
