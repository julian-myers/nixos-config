{
	description = "My flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.11";
		home-manager.url = "github:nix-community/home-manager/release-24.11";
		spicetify-nix.url = "github:Gerg-L/spicetify-nix";
		spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
	};


	outputs = { self, nixpkgs, home-manager, spicetify-nix, ... }: 
		let
		  lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
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
				];
			};
		};

	};

}
