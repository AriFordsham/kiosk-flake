{pkgs, ...}:{
    users.mutableUsers = false;

    users.users.kiosk = {
      isNormalUser = true;
    };

    services.cage = {
      enable = true;
      user = "kiosk";
      program = "${pkgs.chromium}/bin/chromium";
    };
}