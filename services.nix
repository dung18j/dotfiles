{ config, pkgs, ... }:
{
  services = {
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
    udev.extraRules = ''
      ACTION!="add|change|move", GOTO="mm_usb_device_blacklist_end"
      SUBSYSTEM!="usb", GOTO="mm_usb_device_blacklist_end"
      ENV{DEVTYPE}!="usb_device",  GOTO="mm_usb_device_blacklist_end"
      
      # VinCSS FIDO2 Touch 1
      ATTRS{idVendor}=="0483",ATTRS{idProduct}=="a2ca", ENV{ID_MM_DEVICE_IGNORE}="1"
      # VinCSS FIDO2 VOS Aris Pro
      ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4ee1", ENV{ID_MM_DEVICE_IGNORE}="1"
      # VinCSS FIDO2 VOS Aris
      ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4ee7", ENV{ID_MM_DEVICE_IGNORE}="1"
      
      LABEL="mm_usb_device_blacklist_end"
      
      # VinCSS FIDO2 Touch 1
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="a2ca", TAG+="uaccess"
      # VinCSS FIDO2 VOS Aris Pro
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4ee1", TAG+="uaccess"
      # VinCSS FIDO2 VOS Aris
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4ee7", TAG+="uaccess"
    '';

    #printing.enable = true;
  };
}
