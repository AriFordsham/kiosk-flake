{ lib, pkgs, nixpkgs, ... }: {
  imports = [ (nixpkgs + /nixos/modules/virtualisation/virtualbox-image.nix) ];

  # FIXME: UUID detection is currently broken
  boot.loader.grub.fsIdentifier = "provided";

  powerManagement.enable = false;
  system.stateVersion = lib.mkDefault "18.03";
}
