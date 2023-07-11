{ pkgs, ... }: {
  hardware.opengl.enable = true;

  users.mutableUsers = false;

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    password = "demo";
    uid = 1000;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7r1762nBE9yTHQNv9FhyQHj3YFiu+gzO92Fr8owqsKET6nC7sOGvpOu3uCjf5HuY6Xm7InBTODt07efAD1JdsX3INAw/5RA+csTdTcYuAaff5CzL8IhjXWYv1JfXCaORqyZgIoyDxxD2bfbgTWosqgt3kfmEFovuyMCny+TwpaP65vG2nI6NTPYxKUlEYykJ6YwHI9LwVjOSSFWLv+xNlux4FlmUS8WU1V6trAvB/nIw+QeqjJsn34CKSUrQ2GOvFIRUkExnjhKQaYqW78taU7qKEEMbVfEvC9d5//veVIP8nVpSdJ1u9KRsI6DBUsDAW8Kp3luIdRVFcoRHOyYp+lV9G8zgdc8KqjZBvWWxW9xd05rMQyBO4XWjbNfF84NSlBxAcBy8dNW9in7D7xn3G+O1fa0hVe+DBiEaEt5jOWSQYJh1ahz/cwUjvosjTVERFOPtsABgn+4N2pt5FRdoxxv1V9rzshiee+GIxP4AciLxWAUxa7rKyaUJ4aI+e730= ari"
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users.kiosk = { isNormalUser = true; };

  services.cage = {
    enable = true;
    user = "kiosk";
    program = "${pkgs.chromium}/bin/chromium";
  };
}
