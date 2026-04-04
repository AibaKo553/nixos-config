{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        {
          key = "OS Age";
          type = "disk";
          folders = "/";
          format = "{create-time:10} ({days} days)";
        }
        "packages"
        "shell"
        {
          key = "display";
          type = "display";
        }
        "de"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "colors"
      ];
    };
  };
}
