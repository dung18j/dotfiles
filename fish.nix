{ pkgs, ...}:
{
  # Enable fish
  programs.fish.enable = true;
  programs.fish.shellAbbrs = {
    ls = "exa";
    l = "exa";
    la = "exa -a";
    cat = "bat";
  };

}
