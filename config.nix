# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "thinkpad"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables network support via networkmanager.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;
  networking.interfaces.wlp5s0.useDHCP = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # inputMethod
  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ bamboo ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dungph = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.fish;
  };
  services.udev.packages = [ pkgs.stlink ];

  # Enable fish
  programs.fish.enable = true;
  programs.fish.shellAbbrs = {
    ls = "exa";
    l = "exa";
    la = "exa -a";
    cat = "bat";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = [
    pkgs.gnome.cheese
    pkgs.gnome.gnome-music
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gedit
    pkgs.epiphany
    pkgs.gnome.gnome-characters
    pkgs.gnome.totem
    pkgs.gnome-tour
    pkgs.gnome.gnome-calendar
    pkgs.gnome.gnome-weather
    pkgs.gnome.gnome-clocks
    pkgs.gnome.gnome-maps
    pkgs.gnome.simple-scan
    pkgs.gnome.gnome-contacts
  ];

  # Configure keymap in X11
  services.xserver.layout = "us";
  #services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Allow Unfree software
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Rust
    rustup
    rust-analyzer
    cargo-edit
    cargo-embed
    trunk
    sqlx-cli
    probe-run
    gcc
    gcc-arm-embedded

    # Other langs
    clang-tools
    rnix-lsp
    sumneko-lua-language-server
    jdk11

    # markdown preview
    glow

    # env
    alacritty
    tmux
    git


    # utils
    wget
    htop
    firefox
    dropbox
    exa
    bat
    transmission
    gimp
    obs-studio
    vlc
    teams
    eclipses.eclipse-java
  ];
  
  environment.variables.JDTLS_HOME = "/home/dungph/.jdt";

    # Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
          luafile /home/dungph/.dotfiles/nvim/settings.lua
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [
          # ident vertical line
          indentLine

          # auto complete
          nvim-cmp
          cmp-nvim-lsp
          cmp-path
          cmp-buffer
          cmp-vsnip
          vim-vsnip

          # Lsp stuff
          vim-nix
          nvim-lspconfig
          rust-tools-nvim
          popup-nvim
          plenary-nvim
          telescope-nvim
          nvim-dap
          lspsaga-nvim
          rust-vim

          # color
          nord-vim
          nvim-treesitter

          # nvim tree
          nvim-web-devicons
          nvim-tree-lua

          # markdown preview
          glow-nvim
        ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}

