{pkgs, ...}:{
  security.pki.certificateFiles = [ "${pkgs.fetchurl {
    url = "http://api.internal.netfree.link/ca/netfree-ca.crt";
    hash = "sha256-xcx4fwUMXom65iEowsTU2UeUBiX/l96KSo3NQnA9Hac=";
  }}"];
}