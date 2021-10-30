{ pkgs, ...}:
{
  # Allow Unfree software
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    rustup
    rust-analyzer
    wget
    htop
    firefox
    alacritty
    tmux
    git
    dropbox
    exa
    bat
    wpsoffice
    cargo-edit
    cargo-embed
    trunk
    sqlx-cli
    probe-run
    gcc
    gcc-arm-embedded
    rnix-lsp
    sumneko-lua-language-server
  ];
}
