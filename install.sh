#!/bin/bash
# install.sh - aplica la configuracion bspwm-like sobre GNOME/Zorin Tiling Shell
#
#   ./install.sh          instala (hace backup previo de dconf)
#   ./install.sh restore  restaura el backup mas reciente
#
# Pensado para Zorin OS 18.1 (GNOME Shell 46 + zorin-tiling-shell@zorinos.com).
# En otra maquina asegurate antes de que la extension existe:
#   gnome-extensions list | grep zorin-tiling-shell

set -euo pipefail
cd "$(dirname "$0")"
DCONF_FILE=bspwm-zorin.dconf
EXT=zorin-tiling-shell@zorinos.com

die() { echo "error: $*" >&2; exit 1; }
command -v dconf >/dev/null            || die "falta dconf"
command -v gnome-extensions >/dev/null || die "falta gnome-extensions"
gnome-extensions list | grep -qx "$EXT" \
  || die "no esta instalada la extension $EXT"

if [ "${1:-}" = "restore" ]; then
  bkp=$(ls -t "$HOME"/dconf-backup-*.dconf 2>/dev/null | head -1)
  [ -n "$bkp" ] || die "no hay backup en ~/dconf-backup-*.dconf"
  echo "restaurando $bkp"
  gnome-extensions disable "$EXT" 2>/dev/null || true
  dconf load / < "$bkp"
  gnome-extensions enable "$EXT" 2>/dev/null || true
  echo "restaurado. cierra sesion y vuelve a entrar."
  exit 0
fi

bkp="$HOME/dconf-backup-$(date +%F-%H%M%S).dconf"
dconf dump / > "$bkp"
echo "backup guardado en $bkp"

# orden importante: con la extension parada para que guarde los valores nuevos
gnome-extensions disable "$EXT" 2>/dev/null || true
dconf load / < "$DCONF_FILE"
gnome-extensions enable "$EXT"

cat <<EOF
listo. para terminar:
  - si estas en Wayland: cierra sesion y vuelve a entrar
  - restaurar:           ./install.sh restore
atajos: ver ATAJOS.md
EOF
