{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

	conabio.url = "github:emilianovago99/NixOs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, conabio, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
        overlays = [
          (final: prev: {
			 # ciscoPacketTracer8 = prev.ciscoPacketTracer8.overrideAttrs (old: {
			 # src = /nix/store/6hjgf7b5vg9nqa4hl150pxdcs8xf4i15-CiscoPacketTracer822_amd64_signed.deb;
			 # sha256 = "0bgplyi50m0dp1gfjgsgbh4dx2f01x44gp3gifnjqbgr3n4vilkc";
#			});
          })
        ];
      };

      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.home-manager
      ];
    };
  };
}
