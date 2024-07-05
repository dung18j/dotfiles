{config, pkgs, ...}:
{
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
    
    alacritty
    vscode
    gimp
    texliveFull
    texstudio
    biber
  ];
 
  programs.dconf = {
    enable = true;
  };  
 
  # Install firefox.
  programs.firefox.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

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

 
}
