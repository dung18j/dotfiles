{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    tmux
    exa
    rustup
    tailscale
    virt-manager
  ];
}
