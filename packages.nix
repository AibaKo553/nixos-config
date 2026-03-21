# /etc/nixos/packages.nix

{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # Desktop apps
    chromium
    telegram-desktop
    gimp
    obs-studio
    droidcam
    discord
    winbox4
    video-downloader
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU
    qbittorrent
    cpu-x
    mpv
    prismlauncher

    # KDE
    kdePackages.kdenlive

    # CLI utils
    fastfetch
    wget
    tree
    htop
    mcrcon
    docker-compose

    # Language runtimes & toolchains
    # python314
    # virtualenv
    # jdk

    # # Code editor
    # jetbrains.pycharm-oss
    # jetbrains.idea-oss
    # vscode.fhs
  ];
  
  # List fonts.
  fonts.packages = with pkgs; [
    times-newer-roman
  ];

  # Add KDE Connect.
  programs.kdeconnect.enable = true;
}
