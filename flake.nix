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

			profile = "i3";
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
					(./. + "/profiles" + ("/" + profile) + "/home.nix")
				];
			};
		};

	};

}
