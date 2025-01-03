{ config, pkgs, ... }:
let
  bg = "282a36ff";
  fg = "f8f8f2ff";
  cyan = "8be9fdff";
  green = "50fa7bff";
  orange = "ffb86cff";
  pink = "ff79c6ff";
  purple = "bd93f9ff";
  red = "ff5555ff";
  yellow = "f1fa8cff";
	black = "5b6078ff";
in 
{
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"$terminal" = "kitty";
			"$browser" = "firefox";

			# ---- KeyBinds -----
			bind = [
				# programs
				"ALT, T, exec, kitty"
				"ALT, F, exec, firefox"
				"ALT, D, exec, rofi -show drun"
				"ALT, space, togglefloating"
				"ALT, backspace, killactive,"

				# windows
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

				"CONTROL_ALT, 1, focusworkspaceoncurrentmonitor, 1"
				"CONTROL_ALT, 2, focusworkspaceoncurrentmonitor, 2"
				"CONTROL_ALT, 3, focusworkspaceoncurrentmonitor, 3"
				"CONTROL_ALT, 4, focusworkspaceoncurrentmonitor, 4"
				"CONTROL_ALT, 5, focusworkspaceoncurrentmonitor, 5"

				"ALT, S, togglespecialworkspace, magic"
				"ALT_SHIFT, S, movetoworkspace, special:magic"

				"SUPER, D, exec, kanshictl switch \"docked\""
				"SUPER, U, exec, kanshictl switch \"undocked\""
				"SUPER, H, exec, hyprctl reload"
				"SUPER, W, exec, pkill waybar && waybar &"
				"SUPER, B, exec, systemctl --user restart hyperpaper.service"
			];

			# workspace rules:
			workspace = [
				"1, persistent:true"
				"2, persistent:true"
				"3, persistent:true"
				"4, persistent:true"
				"5, persistent:true"
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
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

				", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
				", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
			];

			# window rules
			windowrule = [
				"opaque, title:(Firefox)(.*)"
				"noblur, title:(Firefox)(.*)"
			];

			# startup apps
			exec-once = [
				"waybar"
				"hyprpaper"
				"kanshi"
				"flameshot"
			];

			# ----- Decorations --------
			decoration = {
				rounding = 10;
				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					color = "rgba(181926aa)";
				};
				blur = {
					enabled = true;
					size = 8;
					passes = 3;
				};
				active_opacity = 0.95;
				inactive_opacity = 0.85;
			};

		 # ------ General -------
			general = {
				gaps_in = 5;
				gaps_out = 15;
				border_size = 1;
				"col.active_border" = "rgba(${green}) rgba(${purple}) 45deg";
				"col.inactive_border" = "rgba(${black})";
				layout = "dwindle";
		 	};

			# ----- Animations ------
			animations = {
				enabled = "yes";
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];

				animation = [
					"global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, slide"
          "workspacesIn, 1, 1.21, almostLinear, slide"
          "workspacesOut, 1, 1.94, almostLinear, slide"
				];
			};
			xwayland = {
				force_zero_scaling = true;
			};
		};
	};
}
