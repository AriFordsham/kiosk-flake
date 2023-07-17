{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/hyperv-guest.nix>
    /etc/nixos/hardware-configuration.nix
    ./netfree.nix
    ./kiosk.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}