# /modules/bundle.nix

{
  imports = [
    # Config packages
    ./git.nix
    ./zsh.nix
    ./librewolf.nix
    ./chromium.nix
    ./vscode.nix
  ];
}
