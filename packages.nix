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
    firefox
    alacritty
    tmux
    git
    dropbox
    exa
    bat
  ];
}
