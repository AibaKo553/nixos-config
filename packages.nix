# /etc/nixos/packages.nix

{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    vlc

    # KDE

    # CLI utils

    # Language runtimes & toolchains

    # Code editor
  ];
  
  fonts.packages = with pkgs; [
    times-newer-roman
  ];
}
