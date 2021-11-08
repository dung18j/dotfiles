{ pkgs, ...}:
{
  # Allow Unfree software
  nixpkgs.config.allowUnfree = true;

  # Obs wayland
  environment.variables.QT_QPA_PLATFORM = "wayland";

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
