{pkgs, ... }:
{
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
        firefox
        alacritty
        rawtherapee
        vlc
        neovim
        rustup
        exiftool
    
        vim
        wget
        git
        tmux
        eza
        tailscale
        virt-manager
        virtiofsd
        gdk-pixbuf
        speechd
        
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
    };
  };
}
