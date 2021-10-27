{ pkgs, ... }:
{
  # inputMethod
  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ bamboo ];

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";
} 
