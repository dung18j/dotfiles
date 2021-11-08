# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./nvim/nvim.nix
  ];
  
  # Allow Unfree software
  nixpkgs.config.allowUnfree = true;

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
    java-language-server
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
  ];

}

