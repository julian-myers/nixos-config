{ config, pkgs, ... }:

{
	programs.starship = {
		enable = true;
		settings = {
			# Add a newline before each prompt
			add_newline = true;

			# Format string - order of modules in prompt
			format = "$all";

			# Character module (the prompt symbol)
			character = {
				success_symbol = "[➜](bold green)";
				error_symbol = "[➜](bold red)";
			};

			# Directory module
			directory = {
				truncation_length = 3;
				truncate_to_repo = true;
				style = "bold #89b4fa";
			};

			# Git branch
			git_branch = {
				symbol = " ";
				style = "bold #cba6f7";
			};

			# Git status
			git_status = {
				style = "bold #f9e2af";
				conflicted = "🏳";
				ahead = "⇡\${count}";
				behind = "⇣\${count}";
				diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
				untracked = "🤷";
				stashed = "📦";
				modified = "📝";
				staged = "[++($count)](#a6e3a1)";
				renamed = "👅";
				deleted = "🗑";
			};

			# Show Nix shell environment
			env_var.IN_NIX_SHELL = {
				symbol = " ";
				format = "[$symbol$env_value]($style) ";
				style = "bold #b4befe";
			};

			# Rust
			rust = {
				symbol = " ";
				style = "bold #f38ba8";
			};

			# Python
			python = {
				symbol = "󰌠 ";
				style = "bold #a6e3a1";
			};

			# Node.js
			nodejs = {
				symbol = "󰎙 ";
				style = "bold #a6e3a1";
			};

			# Time
			time = {
				disabled = false;
				format = "[$time]($style) ";
				style = "bold white";
				time_format = "%T";
			};

			# Command duration
			cmd_duration = {
				min_time = 500;
				format = "took [$duration]($style) ";
				style = "bold #f9e2af";
			};

			# Package version
			package = {
				disabled = false;
				symbol = "📦 ";
			};
		};
	};
}
