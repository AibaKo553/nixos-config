{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
in

{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.aiba = {
    home.stateVersion = "25.11";
    imports = [
      ./home-manager/bundle.nix
    ];
  };
}
