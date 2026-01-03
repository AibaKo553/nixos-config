{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;

    autoConfig = ''
      lockPref("browser.search.separatePrivateDefault", false);
      lockPref("full-screen-api.warning.timeout", 0);
    '';

    policies = {
      AppUpdateURL = "https://localhost";
      DisableAppUpdate = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DisableSystemAddonUpdate = true;
      DisableProfileImport = false;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisableFeedbackCommands = true;
      DisablePocket = true;
      DisableSetDesktopBackground = false;
      DisableDeveloperTools = false;
      NoDefaultBookmarks = true;

      SearchEngines = {
        PreventInstalls = false;
        Remove = [
          "Wikipedia (en)"
          "Википедия (ru)"
          "Bing"
          "Amazon.com"
          "eBay"
          "Twitter"
          "Perplexity"
        ];
        Default = "DuckDuckGo";
      };

      SupportMenu = {
        Title = "LibreWolf Issue Tracker";
        URL = "https://codeberg.org/librewolf/issues";
      };

      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
          private_browsing = true;
        };

        # Dark Reader
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
          private_browsing = true;
        };

        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # Return YouTube Dislike
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
          installation_mode = "force_installed";
        };

        # Vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
          private_browsing = true;
        };
      };
    };
  };

  environment.etc."firefox/policies/policies.json".target = "librewolf/policies/policies.json";

  xdg.mime.defaultApplications = {
    "text/html" = "librewolf.desktop";
    "x-scheme-handler/http" = "librewolf.desktop";
    "x-scheme-handler/https" = "librewolf.desktop";
  };

  environment.sessionVariables = {
    BROWSER = "librewolf";
  };
}
