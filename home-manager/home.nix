# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  font-simfamily = pkgs.callPackage ../packages/simfamily { };
in
{
  # You can import other home-manager modules here
  imports = [
    ../common/zsh.nix
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  # nixpkgs = {
  #   # You can add overlays here
  #   overlays = [
  #     # If you want to use overlays exported from other flakes:
  #     # neovim-nightly-overlay.overlays.default

  #     # Or define it inline, for example:
  #     # (final: prev: {
  #     #   hi = final.hello.overrideAttrs (oldAttrs: {
  #     #     patches = [ ./change-hello-to-hi.patch ];
  #     #   });
  #     # })
  #   ];
  #   # Configure your nixpkgs instance
  #   config = {
  #     # Disable if you don't want unfree packages
  #     allowUnfree = true;
  #     # Workaround for https://github.com/nix-community/home-manager/issues/2942
  #     allowUnfreePredicate = _: true;
  #   };
  # };

  # TODO: Set your username
  home = {
    username = "edwardsu";
    homeDirectory = "/home/edwardsu";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  home.packages = with pkgs; [
    vim
    wget
    fastfetch
    nixos-generators

    # shell usage
    thefuck

    # dev
    (python312.withPackages (python-pkgs: with python-pkgs; [
      requests
      typer
    ]))
    # for nix-ide
    nil
    nixpkgs-fmt
    
    gcc
    gnumake
    uv

    # fonts
    liberation_ttf
    font-simfamily
  ];

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Edward Su";
    userEmail = "zentialeds@gmail.com";
    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };


  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
