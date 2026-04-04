# /etc/nixos/packages.nix

{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vlc
  ];
  
  fonts.packages = with pkgs; [

  ];
}
