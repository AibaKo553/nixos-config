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
          black   = "#2e3436";  # Hex code for rgb(46, 52, 54)
          red     = "#e20800";  # Hex code for rgb(226, 8, 0)
          green   = "#00bf00";  # Hex code for rgb(0, 191, 0)
          yellow  = "#f3c300";  # Hex code for rgb(243, 195, 0)
          blue    = "#2b76c7";  # Hex code for rgb(43, 118, 199)
          magenta = "#e85290";  # Hex code for rgb(232, 82, 144)
          cyan    = "#17b2b2";  # Hex code for rgb(23, 178, 178)
          white   = "#d3d7cf";
        };

        bright = {
          black   = "#777979";  # Hex code for rgb(119, 121, 121)
          red     = "#bf0303";  # Hex code for rgb(191, 3, 3)
          green   = "#37a42b";  # Hex code for rgb(55, 164, 43)
          yellow  = "#ffd500";  # Hex code for rgb(255, 213, 0)
          blue    = "#2b74c7";  # Hex code for rgb(43, 116, 199)
          magenta = "#ff80e0";  # Hex code for rgb(255, 128, 224)
          cyan    = "#54ffff";  # Hex code for rgb(84, 255, 255)
          white   = "#f3f3f3";  # Hex code for rgb(243, 243, 243)
        };
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = "alacritty.desktop";
  };
}
