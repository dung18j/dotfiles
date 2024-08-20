{ config, pkgs, ... }:
{
  # Bootloader.
  boot = {
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
  };

  services = {
    logind = {
      extraConfig = "HandlePowerKey=suspend";
      lidSwitch = "suspend"; 
    };
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };
    tailscale.enable = true;
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    gnome.tracker-miners.enable = false;
    gnome.tracker.enable = false;
    udev.packages = [
      (pkgs.writeTextFile {
        name = "probe-rs-rules";
        text = builtins.readFile ./69-probe-rs.rules;
        destination = "/etc/udev/rules.d/69-probe-rs.rules";
      })
      (pkgs.writeTextFile {
        name = "logic2-rules";
        text = builtins.readFile ./90-logic2.rules;
        destination = "/etc/udev/rules.d/90-logic2.rules";
      })
    ];
    udev.extraRules = builtins.readFile ./99-vincss.rules;
    #printing.enable = true;
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

  hardware.pulseaudio.enable = false;
  sound.enable = true;
  hardware.opengl.enable = true;
  #security.rtkit.enable = true;

  services.power-profiles-daemon.enable = false;  
  services.tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  
          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
  
          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 100;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 20;
  
         #Optional helps save long term battery health
         START_CHARGE_THRESH_BAT0 = 60; # 40 and bellow it starts to charge
         STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
  
        };
  };
  hardware.enableAllFirmware = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}
