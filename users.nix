{ config, pkgs, ... }:
{
  users = {
    mutableUsers = true;
    users.dun = {
      isNormalUser = true;
      description = "dun";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" "kvm" "dialout" "plugdev"];
      initialPassword = "1";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEhFdmGsgSWcGab8mnNzpnASvdrNGovbFeE2e2e32VOR dun"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEnXaWIDs9P3PTfJfI1mv7KD0cppoeObD/MA7R8nJ92V u0_a419@localhost"
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
