{pkgs, ... }:
{
  # Bootloader.
  boot = {
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
  };

  environment.variables = {
    CARGO_TARGET_DIR = "/tmp/cargo/";
  };

  services = {
    tailscale.enable = true;
    logind = {
      lidSwitch = "suspend"; 
      lidSwitchDocked = "suspend";
      lidSwitchExternalPower = "suspend";
      powerKey = "suspend";
    };
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
      settings.KbdInteractiveAuthentication = true;
    };
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.autoSuspend = false;
      desktopManager.gnome.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
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
      pkgs.libu2f-host
    ];
    udev.extraRules = builtins.readFile ./99-adafruit-boards.rules; 
  };
  networking = {
    hostName = "e490";
    networkmanager.enable = true;
    firewall.enable = false;
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
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [ 
      intel-media-driver
      intel-ocl
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };
  #security.rtkit.enable = true;

  services.power-profiles-daemon.enable = false;  
  services.tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "ondemand";
          CPU_SCALING_GOVERNOR_ON_BAT = "ondemand";
  
          START_CHARGE_THRESH_BAT0 = 70;
          STOP_CHARGE_THRESH_BAT0 = 75;
        };
  };
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    tmux
    eza
    rustup
    tailscale
    virt-manager
    virtiofsd
    gdk-pixbuf
    speechd
    libraw
    firefox
    rawtherapee
    vlc
    exiftool
    
    alacritty
    vscode
    gimp
    texliveFull
    texstudio
    biber
    direnv
    gcc
    clang
    cmake
  
    iperf3
    espflash
    flip-link
    cargo-generate
    sigrok-cli
    pulseview
    picocom

    vmware-horizon-client
    file
    usbutils
    cargo-hf2
    probe-rs
    pkg-config
    texstudio
    doas
    
    nixd
    lua-language-server
    intel-media-driver

  ];
 
  programs.dconf = {
    enable = true;
  };  
 
  # Install firefox.
  programs.firefox.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.fish.enable = true;

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
  };
  
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      dina-font
      nerdfonts
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  nix = {
    package = pkgs.nixFlakes;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d --max-freed $((64 * 1024**3))";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  users = {
    mutableUsers = true;
    users.dun = {
      isNormalUser = true;
      description = "dun";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" "kvm" "dialout" "plugdev"];
      initialPassword = "1";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF0HlKHrsmTtRpA77+TOINuolA/W1qo6zn7A3zLSJPoV u0_a348@localhost"
      ];
      packages = with pkgs; [
        vim
        wget
        git
        tmux
        eza
        rustup
        tailscale
        virt-manager
        virtiofsd
        gdk-pixbuf
        speechd
        libraw
        firefox
        rawtherapee
        vlc
        exiftool
        
        alacritty
        vscode
        gimp
        texliveFull
        texstudio
        biber
        direnv
        gcc
        clang
        cmake
  
        iperf3
        espflash
        flip-link
        cargo-generate
        sigrok-cli
        pulseview
        picocom

        vmware-horizon-client
        file
        usbutils
        cargo-hf2
        probe-rs
        pkg-config
        texstudio
        doas
        
        nixd
        lua-language-server
        intel-media-driver

        wget
        git
        tmux
        eza
        rustup
        tailscale
        virt-manager
        virtiofsd
        gdk-pixbuf
        speechd
        libraw
        firefox
        rawtherapee
        vlc
        exiftool
        
        alacritty
        vscode
        gimp
        texliveFull
        texstudio
        biber
        direnv
        gcc
        clang
        cmake
  
        iperf3
        espflash
        flip-link
        cargo-generate
        sigrok-cli
        pulseview
        picocom

        vmware-horizon-client
        file
        usbutils
        cargo-hf2
        probe-rs
        pkg-config
        texstudio
        doas
        
        nixd
        lua-language-server
        intel-media-driver

      ];
    };
  };

  hardware.enableAllFirmware = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}
