{
	description = "My flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
	};


	outputs = { self, nixpkgs, home-manager, ... }: 
		let
		  lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				inherit system;
				modules = [ 
					./configuration.nix
				];
			};
		};

		homeConfigurations = {
			julian-m = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home.nix
					./modules/zsh.nix
					./modules/i3wm/i3wm.nix
					./modules/i3wm/polybar.nix
					./modules/i3wm/picom.nix
					./modules/i3wm/rofi.nix
					./modules/autorandr.nix
					./modules/qutebrowser.nix
					./modules/dunst.nix
					./modules/kitty.nix
				];
			};

		};
	};

}
