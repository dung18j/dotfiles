{ config, pkgs, ... }:
{
  # Bootloader.
  boot = {
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "e490";
    networkmanager.enable = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ bamboo ];
    };
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  time.timeZone = "Asia/Ho_Chi_Minh";

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  

  system.stateVersion = "24.05"; # Did you read the comment?
}
