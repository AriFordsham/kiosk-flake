{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };
  outputs = {nixpkgs, ...}: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {};
  };
} 