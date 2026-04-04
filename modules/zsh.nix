{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    histSize = 10000;
    shellAliases = {

    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh.enable = true;
    ohMyZsh.theme = "zhann";
    ohMyZsh.plugins = [
      "git"
    ];
  };

  users.defaultUserShell = pkgs.zsh;
}
