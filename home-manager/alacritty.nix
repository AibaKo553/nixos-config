{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.7;
      };

      colors = {
        primary = {
          background = "#1E1E1E";
        };

        normal = {
          black   = "#2e3436";
          red     = "#e20800";
          green   = "#00bf00";
          yellow  = "#f3c300";
          blue    = "#2b76c7";
          magenta = "#e85290";
          cyan    = "#17b2b2";
          white   = "#d3d7cf";
        };

        bright = {
          black   = "#777979";
          red     = "#bf0303";
          green   = "#37a42b";
          yellow  = "#ffd500";
          blue    = "#2b74c7";
          magenta = "#ff80e0";
          cyan    = "#54ffff";
          white   = "#f3f3f3";
        };
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = "alacritty.desktop";
  };
}
