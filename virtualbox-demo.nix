{ lib, pkgs, nixpkgs, ... }:

with lib;

{
  imports =
    [ (nixpkgs + /nixos/modules/virtualisation/virtualbox-image.nix)
    ];

  users.mutableUsers = false;

  users.users.demo =
    { isNormalUser = true;
      description = "Demo user account";
      extraGroups = [ "wheel" ];
      password = "demo";
      uid = 1000;
    };

  # FIXME: UUID detection is currently broken
  boot.loader.grub.fsIdentifier = "provided";

  # Add some more video drivers to give X11 a shot at working in
  # VMware and QEMU.
  services.xserver.videoDrivers = mkOverride 40 [ "virtualbox" "vmware" "cirrus" "vesa" "modesetting" ];

  powerManagement.enable = false;
  system.stateVersion = mkDefault "18.03";

  users.users.root.password = "12345";
}
