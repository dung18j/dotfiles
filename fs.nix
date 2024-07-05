{ config, pkgs, ... }:
{
  fileSystems."/data" = { 
      device = "/dev/disk/by-label/data";
      fsType = "ext4";
  };
}
