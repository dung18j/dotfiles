{ pkgs, ...}:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = [ 
    pkgs.gnome.cheese
    pkgs.gnome.gnome-music
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gedit
    pkgs.epiphany
    pkgs.gnome.gnome-characters
    pkgs.gnome.totem
    pkgs.gnome-tour
    pkgs.gnome.gnome-calendar
    pkgs.gnome.gnome-weather
    pkgs.gnome.gnome-clocks
    pkgs.gnome.gnome-maps
    pkgs.gnome.simple-scan
    pkgs.gnome.gnome-contacts
  ];

  # Configure keymap in X11
  services.xserver.layout = "us";
  #services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

}
