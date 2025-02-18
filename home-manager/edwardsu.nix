{ pkgs, ... }:
{
  users.users.edwardsu = {
    isNormalUser = true;
    home = "/home/edwardsu";
    password = "wsledsu";
    extraGroups = [ "wheel"];
    shell = pkgs.zsh;
  };
}
