{ config, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
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
        wget
        git
        tmux
        eza
        rustup
        tailscale
        virt-manager
        virtiofsd
        exiftool
      ];
    };
  };
}
