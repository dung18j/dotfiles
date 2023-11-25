{config, pkgs, ...}:
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
    virtiofsd
    gdk-pixbuf
    speechd
  ];

  programs = {
    dconf.enable = true;
    fish.enable = true ; 
    neovim = {
      enable = true ; 
      defaultEditor = true;
    };
  };
 
}
