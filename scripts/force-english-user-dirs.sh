#!/usr/bin/env bash
set -e

FLAG="$HOME/.config/.xdg-dirs-fixed"

# Run only once
if [ -f "$FLAG" ]; then
  exit 0
fi

echo "[xdg-dirs] Forcing English user directories"

mkdir -p "$HOME/.config"

# Force English directory names
LANG=C xdg-user-dirs-update --force

# Russian -> English mapping (cleanup only)
declare -A DIRS=(
  ["Рабочий стол"]="Desktop"
  ["Загрузки"]="Downloads"
  ["Документы"]="Documents"
  ["Музыка"]="Music"
  ["Изображения"]="Pictures"
  ["Видео"]="Videos"
  ["Общедоступные"]="Public"
  ["Шаблоны"]="Templates"
)

echo "[xdg-dirs] Removing old Russian directories (if empty)"

for RU in "${!DIRS[@]}"; do
  EN="${DIRS[$RU]}"
  if [ -d "$HOME/$RU" ] && [ -d "$HOME/$EN" ]; then
    rmdir "$HOME/$RU" 2>/dev/null || true
  fi
done

touch "$FLAG"
echo "[xdg-dirs] Done"