{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };
  outputs = {self, nixpkgs, ...}@attrs: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./virtualbox-demo.nix
        ./netfree.nix
      ];
      specialArgs = attrs;
    };

    packages."x86_64-linux".default = self.nixosConfigurations."nixos".config.system.build.toplevel;
  };
} 