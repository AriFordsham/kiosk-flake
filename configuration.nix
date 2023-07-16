{
  imports = [
    ./hardware-configuration.nix
    "${builtins.fetchTarball https://github.com/AriFordsham/kiosk-flake/archive/master.tar.gz}"
  ];
}