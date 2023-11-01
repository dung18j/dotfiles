{ pkgs, ...}:
{ 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dun = {
    isNormalUser = true;
    description = "dun";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox
      alacritty
      neovim
    #  thunderbird
    ];
  };
}
