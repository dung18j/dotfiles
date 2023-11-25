{ config, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = true;
    users.dun = {
      isNormalUser = true;
      description = "dun";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu-libvirtd" "kvm"];
      shell = pkgs.fish;
      initialPassword = "1";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEhFdmGsgSWcGab8mnNzpnASvdrNGovbFeE2e2e32VOR dun"
      ];
      packages = with pkgs; [
        firefox
        alacritty
        neovim
        wget
        git
        tmux
        exa
        rustup
        tailscale
        virt-manager
        virtiofsd
        exiftool
        wpsoffice
      ];
    };
  };
}
