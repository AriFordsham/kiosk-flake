{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  };
  outputs = {self, nixpkgs, ...}@attrs: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          boot.loader.grub.enable = false;
          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;
        }
        /etc/nixos/hardware-configuration.nix
        ./netfree.nix
        ./kiosk.nix
      ];
      specialArgs = attrs;
    };

    packages."x86_64-linux".default = self.nixosConfigurations."nixos".config.system.build.toplevel;
  };
} 