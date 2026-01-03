{ pkgs, ...}:

{
  # Config VSCode
  system.userActivationScripts.vscodeConfig = ''
    # Chek config vscode
    if [ -e "$HOME/.vscode/argv.json" ]; then
      echo "VSCode already configured for $USER"
    else

    # To install extensions in vscode
    extensions="bbenoist.nix 
    davidanson.vscode-markdownlint 
    ms-python.debugpy 
    ms-python.python 
    ms-python.vscode-pylance 
    ms-python.vscode-python-envs 
    pkief.material-icon-theme 
    ritwickdey.liveserver 
    zhuangtongfa.material-theme 
    ms-ceintl.vscode-language-pack-ru"

    # Install extensions from the list
    for ext in $extensions; do
        ${pkgs.vscode.fhs}/bin/code --install-extension "$ext"
    done

    # Changing settings in vscode
    mkdir -p $HOME/.config/Code/User
    mkdir -p $HOME/.vscode


  cat <<'EOF' > "$HOME/.config/Code/User/settings.json"
{
  "workbench.secondarySideBar.defaultVisibility": "hidden",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.colorTheme": "One Dark Pro",
  "extensions.ignoreRecommendations": true,
  "files.autoSave": "afterDelay",
  "workbench.startupEditor": "none",
  "explorer.confirmDelete": false
}
EOF

  cat <<'EOF' > "$HOME/.vscode/argv.json"
{
  "enable-crash-reporter": true,
  "locale": "ru"
}
EOF
  fi
  '';
}
