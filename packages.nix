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
    probe-rs
    pkg-config
    texstudio
    doas
    
    nixd
    lua-language-server
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

 
}
