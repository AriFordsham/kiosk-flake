{ lib, pkgs, nixpkgs, ... }: {
  imports = [ (nixpkgs + /nixos/modules/virtualisation/virtualbox-image.nix) ];

  users.users.demo = {
    isNormalUser = true;
    description = "Demo user account";
    extraGroups = [ "wheel" ];
    password = "demo";
    uid = 1000;
  };

  # FIXME: UUID detection is currently broken
  boot.loader.grub.fsIdentifier = "provided";

  powerManagement.enable = false;
  system.stateVersion = lib.mkDefault "18.03";

  users.users.root.password = "12345";
}
