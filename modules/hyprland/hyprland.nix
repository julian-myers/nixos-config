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
	black = "000000b0";

	base = "191724";
	surface = "1f1d2e";
	overlay = "26233a";
	muted = "6e6a86";
	subtle = "908caa";
	text = "e0def4";
	love = "eb6f92";
	gold = "f6c177";
	rose = "ebbcba";
	pine = "31748f";
	foam = "9ccfd8";
	iris = "c4a7e7";
	hlow = "2a283e";
	hmed = "44415a";
	hhigh = "56526e";

	colors = import ./colorscheme.nix;
in 
{
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"$terminal" = "kitty";
			"$browser" = "firefox";

			monitor = [
				"eDP-1, preferred, 0x0, 1.3333"
				"desc:Dell Inc. DELL S2725DS 4DGBS44, preferred, -1280x-1600, 1"
				"desc:Dell Inc. DELL S3222DGM FZPYJK3, preferred, 1280x-1600, 1"
			];

			# ---- KeyBinds -----
			bind = [
				# programs
				"ALT, Return, exec, kitty"
				"ALT, F, exec, firefox"
				"ALT, D, exec, rofi -show drun"
				"ALT, R, exec, rofi -show run"
				"ALT_SHIFT, B, exec, rofi-bluetooth"
				"ALT, space, togglefloating"
				"ALT, P, pseudo"
				"ALT, O, togglesplit"
				"ALT, backspace, killactive,"
				"SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
				"ALT_SHIFT, P, exec, grim"

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


				"SUPER, H, exec, hyprctl reload"
				"SUPER, W, exec, pkill waybar && waybar &"
				"SUPER, B, exec, systemctl --user restart hyperpaper.service"

				", XF86HomePage, exec, hyprlock &"
				", XF86Favorites, exec, hyprlock &"
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
				"opaque, title:(Minecraft* 1.21.3)(.*)"
				"noblur, title:(Minecraft* 1.21.3)(.*)"
				"opaque, title:(Julian's App)(.*)"
				"noblur, title:(Julian's App)(.*)"
				"float, title:(Julian's App)(.*)"
			];

			layerrule = [
				"blur,rofi"
				# "ignorezero,rofi"
				"dimaround,rofi"
				"animation popin, rofi"
				"blur, waybar"
				"ignorezero, waybar"
			];

			# startup apps
			exec-once = [
				"hyprpaper"
				"hypridle"
				"wl-paste --type text --watch cliphist store"
				"wl-paste --type image --watch cliphist store"
			];

			# ----- Decorations --------
			decoration = {
				rounding = 10;
				shadow = {
					enabled = true;
					range = 6;
					render_power = 1;
					color = "rgb(${colors.Mantle})";
					offset = "1.0 1.0";
				};
				
				blur = {
					enabled = true;
					size = 9;
					passes = 3;
					ignore_opacity = true;
					new_optimizations = true;
					xray = false;
					noise = 0.0117;
					contrast = 0.8916;
					brightness = 0.8172;
					vibrancy = 0.1696;
					vibrancy_darkness = 0.0;
					special = true;
					popups = false;
					popups_ignorealpha = 0.2;
				};

				active_opacity = 0.9;
				inactive_opacity = 0.8;
			};

			cursor = {
				enable_hyprcursor = false;
			};

		 # ------ General -------
			general = {
				gaps_in = 5;
				gaps_out = 15;
				border_size = 2;
				"col.active_border" = "rgb(${colors.Blue}) rgb(${colors.Text}) 45deg";
				"col.inactive_border" = "rgb(${colors.Lavender})";
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
          "windowsOut, 1, 1.49, easeOutQuint, popin 87%"
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

			opengl = {
				nvidia_anti_flicker = true;
				force_introspection = 0;
			};

			input = {
				kb_options = "caps:swapescape";
			};

			env = [
				"LIBVA_DRIVER_NAME,nvidia"
				"__GLX_VENDOR_LIBRARY_NAME,nvidia"
				"HYPRCURSOR_THEME, Bibata-Modern-Ice"
				"HYPRCURSOR_SIZE, 24"
				"XCURSOR_THEME, Bibata-Modern-Ice"
				"XCURSOR_SIZE, 24"
			];
			
			render = {
				explicit_sync = 0;
			};

		};
	};
}
