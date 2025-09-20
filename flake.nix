{
	description = "My flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		spicetify-nix.url = "github:Gerg-L/spicetify-nix";
		spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
		catppuccin.url = "github:catppuccin/nix";
		spinning-cube.url = "path:/home/julian-m/Code/spinning-cube/";
		spinning-cube.inputs.nixpkgs.follows = "nixpkgs";
		texinit.url = "path:/home/julian-m/.dotfiles/scripts/";
	};

	outputs = { self, nixpkgs, home-manager, spicetify-nix, catppuccin, spinning-cube, nixpkgs-unstable, texinit, ... }: 
		let
		  lib = nixpkgs.lib;
			system = "x86_64-linux";
			overlays = [
				spinning-cube.overlays.default
				(final: prev:
					let u = import nixpkgs-unstable { inherit (final) system; };
					in {
						neovim = u.neovim;
						neovim-unwrapped = u.neovim-unwrapped;
					})
			];
			pkgs = import nixpkgs {
				inherit system overlays;
			};
			profile = "hyprland";
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
				extraSpecialArgs = {inherit spicetify-nix;};
				modules = [
					(./. + "/profiles" + ("/" + profile) + "/home.nix")
					catppuccin.homeModules.catppuccin
					{ programs.neovim.enable = true; }
				];
			};
		};

	};

}
