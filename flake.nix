{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };
  outputs = {nixpkgs, ...}: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs + "/nixos/modules/installer/virtualbox-demo.nix"
      ];
    };
  };
} 