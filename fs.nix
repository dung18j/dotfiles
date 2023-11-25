{ config, pkgs, ... }:
{
  fileSystems = {
    "/" = {
        options = [ "noatime" "nodiratime"];
    };
    "/data" = { 
      device = "/dev/disk/by-label/data";
      fsType = "ext4";
    };
  };

}
