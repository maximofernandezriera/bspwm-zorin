# bspwm-zorin.dconf

Configuración de GNOME Shell 46 + **Zorin Tiling Shell** (Zorin OS 18.1) para acercarse lo máximo posible a bspwm.

El tiling nativo de Zorin OS 18 es la extensión `zorin-tiling-shell@zorinos.com`, un fork de
[Tiling Shell](https://github.com/domferr/tilingshell). **No** usa el esquema de GNOME Tiling Assistant:

| Esquema | Ruta dconf |
|---|---|
| `org.gnome.shell.extensions.zorin-tiling-shell` | `/org/gnome/shell/extensions/zorin-tiling-shell/` |
| `org.gnome.mutter` | `/org/gnome/mutter/` |
| `org.gnome.mutter.keybindings` | `/org/gnome/mutter/keybindings/` |
| `org.gnome.desktop.wm.keybindings` | `/org/gnome/desktop/wm/keybindings/` |
| `org.gnome.desktop.wm.preferences` | `/org/gnome/desktop/wm/preferences/` |
| `org.gnome.desktop.interface` | `/org/gnome/desktop/interface/` |
| `org.gnome.shell` / `org.gnome.shell.keybindings` | `/org/gnome/shell/`, `/org/gnome/shell/keybindings/` |
| `org.gnome.shell.extensions.zorin-taskbar` | `/org/gnome/shell/extensions/zorin-taskbar/` |
| `org.gnome.settings-daemon.plugins.media-keys` | `/org/gnome/settings-daemon/plugins/media-keys/` |

## Aplicar

La forma fácil, que además hace copia de seguridad sola:

```sh
./install.sh           # instala (guarda antes ~/dconf-backup-FECHA.dconf)
./install.sh restore   # vuelve al backup más reciente
```

Manualmente equivale a:

```sh
dconf dump / > ~/dconf-backup-$(date +%F).dconf        # copia de seguridad
gnome-extensions disable zorin-tiling-shell@zorinos.com
dconf load / < bspwm-zorin.dconf
gnome-extensions enable zorin-tiling-shell@zorinos.com
# cerrar sesión y volver a entrar (Wayland no permite reiniciar el Shell en caliente)
```

Por qué se desactiva la extensión antes: mientras está activa, Tiling Shell vacía
`toggle-tiled-left/right`, `maximize`, `unmaximize` y `mutter edge-tiling`, y guarda los valores
anteriores en `overridden-settings`. Si se desactiva, se carga y se vuelve a activar, lo que guarda
son los valores nuevos, y al desactivarla más adelante no vuelven los atajos de Zorin.

Restaurar: `dconf load / < ~/dconf-backup-AAAA-MM-DD.dconf`.

> **Aviso:** `dconf load` **reemplaza** listas completas. `enabled-extensions` queda solo con
> `zorin-tiling-shell` y `zorin-appindicator`: cualquier otra extensión activa (Vitals, etc.) se
> desactiva. Lo mismo pasa con `custom-keybindings` de media-keys. Al desactivar `zorin-taskbar`
> vuelve la barra superior estándar de GNOME.

## Atajos

Chuleta completa e imprimible en [`ATAJOS.md`](ATAJOS.md). Resumen:

| bspwm / sxhkd | GNOME (acción) | Atajo |
|---|---|---|
| `bspc node -f west/south/north/east` | `zorin-tiling-shell focus-window-*` | Super + ← ↓ ↑ → |
| `bspc node -f next/prev.local` | `focus-window-next/prev` | Super + c / Super + Shift + c |
| `bspc node -s west/…` (aprox.) | `move-window-*` (mueve a la tile vecina / monitor vecino) | Super + Shift + ← ↓ ↑ → |
| `bspc node -z` (expandir) | `span-window-*` | Super + Ctrl + ← ↓ ↑ → |
| `bspc desktop -f ^1..^5` | `wm switch-to-workspace-1..5` | Super + 1..5 |
| `bspc node -d ^1..^5` | `wm move-to-workspace-1..5` | Super + Shift + 1..5 |
| `bspc desktop -f prev/next` | `switch-to-workspace-left/right` | Super + , / . (también Super + RePág/AvPág) |
| `bspc node -d prev/next` | `move-to-workspace-left/right` | Super + Shift + , / . |
| `bspc node -t floating` | `untile-window` | Super + s |
| (flotar y centrar) | `move-window-center` | Super + Shift + s |
| `bspc node -t tiled` | volver a tilear: `move-window-*` o arrastrar | Super + Shift + flecha |
| `bspc node -t fullscreen` | `wm toggle-fullscreen` | Super + f |
| `bspc desktop -l monocle` (aprox.) | `wm toggle-maximized` | Super + m |
| monocle "solo esta ventana" | `highlight-current-window` (minimiza las demás) | Super + Shift + m |
| `bspc node -c` | `wm close` | Super + q, Alt + F4 |
| `bspc node -g sticky` | `wm toggle-on-all-workspaces` | Super + Shift + y |
| (cambiar plantilla) | `cycle-layouts` / `cycle-layouts-backward` | Super + Espacio (+ Shift) |
| `super + Return` | atajo personalizado `bspwm-terminal` | Super + Return → `gnome-terminal` |
| `bspc quit` (`super + alt + q`) | `media-keys logout` (diálogo de confirmación) | Super + Alt + q, Ctrl + Alt + Supr |
| apagar | atajo personalizado `bspwm-poweroff` → `gnome-session-quit --power-off` (diálogo con cuenta atrás) | Super + w |
| bloquear pantalla | `media-keys screensaver` | Super + l |
| captura (maim/scrot) | `shell.keybindings show-screenshot-ui` / `screenshot` / `screenshot-window` | Impr Pant / Shift + Impr Pant / Alt + Impr Pant |
| grabar pantalla | `shell.keybindings show-screen-recording-ui` | Ctrl + Shift + Alt + R |
| dmenu | `toggle-overview` | Super + d |
| ajustes | `media-keys control-center` | Super + a |
| arrastrar con ratón | `mouse-button-modifier` | Super + clic izq. (mover) / Super + clic dcho. (redimensionar) |

Arrastrar una ventana la tilea sin modificador. Con **Ctrl** mantenido queda flotante y con **Alt**
ocupa varias tiles. Al llevarla a los bordes: mitades en los lados y cuartos en las esquinas.

Atajos liberados por conflicto: `move-to-monitor-*` (Super+Shift+flechas),
`switch-to-application-1..9` (Super+N), `toggle-quick-settings` (Super+s), Super+m de
`toggle-message-tray` (queda Super+v), `show-desktop`, los hotkeys de `zorin-taskbar`, y la tecla
Super sola (`mutter overlay-key=''`), que ya no abre la vista general.

## Qué más cambia

- **Tiling**: `enable-autotiling=true` (las ventanas nuevas van a una tile libre), `inner-gaps` y
  `outer-gaps` = 12 (`window_gap 12`), borde de 2 px `#817f7f` en la ventana enfocada, animaciones
  de la extensión a 0, snap assist y sugerencias desactivados. Layout `bspwm` por defecto en los 5
  workspaces: una espiral `longest_side` para 4 ventanas (½ | ¼ | ⅛ | ⅛).
- **Workspaces**: `dynamic-workspaces=false`, `num-workspaces=5`, nombres `I…V`. Sin wrap-around
  (GNOME no da la vuelta en left/right y `enable-wraparound-focus=false`).
- **Menos GNOME**: `enable-animations=false`, `enable-hot-corners=false`, `button-layout=':'`
  (sin botones en la barra de título), sin vista general al iniciar, sin dock/taskbar/menú de Zorin,
  sin efectos (magic lamp, wobbly, cubo) y Alt+Tab solo muestra el workspace actual.
- `mutter auto-maximize=false`, necesario porque el autotiling ignora las ventanas maximizadas.
- `focus-mode='click'` equivale a `focus_follows_pointer false`. Para `true`, poner `'sloppy'`.

## Limitaciones respecto a bspwm

- **No hay árbol binario.** Tiling Shell usa plantillas fijas (layouts) con N tiles. No hay inserción
  dinámica con partición de la hoja enfocada, ni preselección (`node -p`), ni rotar/voltear
  (`node -R`, `-F`), ni equilibrar (`-B`), ni `split_ratio` por nodo. Si hay más ventanas que tiles,
  las que sobran quedan flotando.
- **No hay swap de verdad.** `move-window-*` lleva la ventana a la tile vecina aunque esté ocupada
  (se superponen). En la fila superior, "arriba" maximiza.
- **Monocle** solo afecta a una ventana (maximizar). No existe un layout monocle por escritorio con
  ciclo entre ventanas.
- **Gaps simétricos**: solo interior y exterior. No hay `top/bottom/left/right_padding`
  independientes, ni gaps por escritorio o monitor.
- **No hay reglas por WM_CLASS** (`bspc rule -a … state=floating desktop=^3`).
- No hay `pseudo_tiled` ni flags `private`/`locked`/`marked`. Sí hay algo parecido a `sticky`.
- **Tampoco hay "último escritorio/nodo"** (`desktop -f last`, `node -f last`). `switch-to-workspace-last` va al
  último por índice, no al anterior usado.
- **No hay IPC ni scripts** (`bspc query/subscribe`) ni configuración como script (`bspwmrc`).
- Los workspaces son **globales**, no por monitor como en bspwm. Con `workspaces-only-on-primary=true`
  los monitores secundarios quedan fijos.
- `button-layout` no quita las **decoraciones CSD** (apps GTK4/libadwaita, Chrome, etc.) y la barra
  superior de GNOME no se puede ocultar solo con dconf.
- Distribución `es`: `[`/`]` necesitan AltGr, así que prev/next usa coma/punto en lugar de los corchetes.

## Extensiones para cerrar esas brechas (no vienen instaladas por defecto)

| Brecha | Extensión | Notas |
|---|---|---|
| Árbol binario, swap real, splits h/v, flotación por clase, gaps, bordes | **Forge** (`forge@jmmaranan.com`) | Lo más parecido a bspwm/i3. **Sustituye** a Tiling Shell: no activar las dos. |
| Auto-tiling alternativo con atajos tipo i3 | **Pop Shell** (System76) | También sustituye a Tiling Shell. |
| Reglas "app → escritorio" (`bspc rule desktop=`) | **Auto Move Windows** (`auto-move-windows@gnome-shell-extensions.gcampax.github.com`) | **Ya está instalada** en Zorin. Esquema `org.gnome.shell.extensions.auto-move-windows`, clave `application-list=['firefox.desktop:2']`. |
| Ocultar panel/dash, más control de animaciones | **Just Perfection** | |
| Consultar/controlar ventanas por D-Bus (`bspc query`) | **Window Calls** / **Window Calls Extended** | Permite scripts con `gdbus call`. |
| Indicador de escritorios tipo polybar | **Space Bar** o **Workspace Indicator** (este último ya instalado) | |
| Quitar barras de título | **Unite**, **No Titlebar When Maximized** | Solo funciona bien con SSD/X11. Las CSD no se pueden quitar. |
