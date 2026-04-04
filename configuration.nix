# /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/bundle.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" "v4l2loopback" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  time.timeZone = "Asia/Bishkek";

  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ky_KG";
    LC_IDENTIFICATION = "ky_KG";
    LC_MEASUREMENT = "ky_KG";
    LC_MONETARY = "ky_KG";
    LC_NAME = "ky_KG";
    LC_NUMERIC = "ky_KG";
    LC_PAPER = "ky_KG";
    LC_TELEPHONE = "ky_KG";
  };

  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    settings = {
      Theme = {
        Current = "breeze";
        ThemeDir = "/etc/nixos/theme";
      };
    };
  };

  # KDE Exclusions.
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.konsole
  ];

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:caps_toggle";
  };

  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.aiba = {
    isNormalUser = true;
    description = "aiba";
    home = "/home/aiba";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [];
  };

  virtualisation.docker.enable = true;

  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.stateVersion = "25.11";
}
