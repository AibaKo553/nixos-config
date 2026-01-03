# /etc/nixos/packages.nix

{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # Desktop apps
    chromium
    # telegram-desktop
    # obs-studio
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU

    # CLI utils
    fastfetch
    wget
    tree
    htop

    # Language runtimes & toolchains
    # python314
    # virtualenv

    # Code editor
    # jetbrains.pycharm-oss
    vscode.fhs
  ];
  
  # List fonts.
  fonts.packages = with pkgs; [
    times-newer-roman
  ];
}
