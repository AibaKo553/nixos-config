# /etc/nixos/packages.nix

{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    chromium
    telegram-desktop
    gimp
    discord
    winbox4
    media-downloader
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU
    qbittorrent
    cpu-x
    vlc
    droidcam
    mangohud
    element-desktop
    prismlauncher

    # KDE
    kdePackages.kdenlive

    # CLI utils
    wget
    tree
    htop
    mcrcon
    docker-compose
    mc

    # Language runtimes & toolchains
    # python314
    # virtualenv
    # jdk

    # # Code editor
    # jetbrains.pycharm-oss
    # jetbrains.idea-oss
    # vscode.fhs
  ];
  
  fonts.packages = with pkgs; [
    times-newer-roman
  ];

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "aiba" ];
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  programs.kdeconnect.enable = true;
}
