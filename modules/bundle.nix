# /modules/bundle.nix

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./librewolf.nix
    ./chromium.nix
    ./vscode.nix
    ./steam.nix
  ];
}
