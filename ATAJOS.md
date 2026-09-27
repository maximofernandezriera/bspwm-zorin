# Chuleta de atajos (bspwm-zorin)

## Lo esencial si estás perdido

| Atajo | Qué hace |
|---|---|
| **Super + Return** | Abrir una terminal |
| **Super + d** | Vista general (buscar y lanzar apps, ver escritorios) |
| **Super + a** | Ajustes del sistema (`gnome-control-center`) |
| **▦ 3 cuadrados** (tecla encima del 3) | Parrilla de aplicaciones |
| **▦ 6 cuadrados** (tecla encima del 4) | Calendario (`gnome-calendar`) |
| **Super + Alt + q** | Cerrar sesión (pide confirmación) |
| **Super + l** | Bloquear la pantalla |
| **Alt + Tab** | Cambiar de ventana |
| **Super + w** | Apagar el equipo (pide confirmación) |

Super es la tecla Windows/Comando. En el MacBook valen **los dos Command** (izquierdo y derecho). Pulsarla **sola ya no hace nada**.

Para volver a la configuración anterior: `dconf load / < ~/dconf-backup-2026-09-26-185420.dconf` y cierra sesión.

## Ventanas: enfocar

| Atajo | Equivale en bspwm |
|---|---|
| Super + ← ↓ ↑ → | `bspc node -f west/south/north/east` |
| Super + c / Super + Shift + c | `bspc node -f next/prev` |
| Alt + Tab | cambiar de ventana (solo el escritorio actual) |

## Ventanas: mover, tamaño, estado

| Atajo | Qué hace |
|---|---|
| Super + Shift + ← ↓ ↑ → | Mover a la zona vecina (o al monitor vecino) |
| Super + Ctrl + ← ↓ ↑ → | Expandir hacia la zona vecina |
| Super + s | Flotante / sacarla del mosaico (`node -t floating`) |
| Super + Shift + s | Centrarla flotando |
| Super + Shift + flecha | También vale para volver a tilearla |
| Super + f | Pantalla completa (`node -t fullscreen`) |
| Super + m | Maximizar / desmaximizar (lo más parecido a monocle) |
| Super + Shift + m | Mostrar solo esta (minimiza las demás) |
| Super + Shift + y | Mostrar en todos los escritorios (`node -g sticky`) |
| Super + q | Cerrar (`node -c`), también Alt + F4 |
| Alt + F7 / Alt + F8 | Mover / redimensionar con teclado |
| Alt + espacio | Menú de ventana |

## Ratón

| Acción | Efecto |
|---|---|
| Arrastrar una ventana | Se coloca sola en el mosaico |
| Arrastrar + Ctrl | Queda flotando |
| Arrastrar + Alt | Ocupa varias zonas |
| Arrastrar a un borde lateral | Mitad de pantalla (y sugiere ventanas para el otro lado) |
| Arrastrar a una esquina | Cuarto de pantalla |
| Super + clic izquierdo + arrastrar | Mover la ventana (este donde esté el cursor) |
| Super + clic derecho + arrastrar | Redimensionar |
| Doble clic en la barra de título | Maximizar / desmaximizar |

## Escritorios (I, II, III, IV, V)

| Atajo | Equivale en bspwm |
|---|---|
| Super + 1 .. 5 | `bspc desktop -f ^N` |
| Super + Shift + 1 .. 5 | `bspc node -d ^N` |
| Super + , / Super + . | escritorio anterior / siguiente |
| Super + Shift + , / . | enviar la ventana al anterior / siguiente |
| Super + RePág / AvPág | escritorio anterior / siguiente |
| Super + Inicio / Fin | primer / último escritorio |
| Super + Shift + Inicio / Fin | enviar al primer / último |

No hay "último escritorio usado" ni se da la vuelta al llegar al final.

## Mosaico (Tiling Shell)

| Atajo | Qué hace |
|---|---|
| Super + espacio / Super + Shift + espacio | Cambiar la plantilla del escritorio (adelante / atrás) |

Plantillas disponibles: `bspwm` (espiral), dos mitades, cuatro cuartos, ⅔+⅓, tres columnas y otras. El icono de la barra superior muestra la plantilla activa.

## Sesión y sistema

| Atajo | Qué hace |
|---|---|
| Super + Return | Terminal (`gnome-terminal`), también Ctrl + Alt + T |
| Super + b | Lanzar Brave (`brave-origin-stable`) |
| Super + a | Ajustes del sistema (`gnome-control-center`) |
| Super + d | Vista general / lanzador de apps |
| Super + Alt + q | Cerrar sesión (también Ctrl + Alt + Supr) |
| Super + w | Apagar (diálogo con cuenta atrás, cancelable) |
| Super + l | Bloquear |
| Super + e | Gestor de archivos |
| Super + v | Bandeja de notificaciones |
| Super + n | Ir a la notificación activa |
| Alt + F2 | Ejecutar un comando |

## Capturas

| Atajo | Qué hace |
|---|---|
| Impr Pant | Herramienta de captura (pantalla, ventana, zona, grabar) |
| Shift + Impr Pant | Captura directa de toda la pantalla |
| Alt + Impr Pant | Captura de la ventana activa |
| Ctrl + Shift + Alt + R | Grabación de pantalla |

## Otras teclas que siguen funcionando

- Teclas multimedia: volumen, brillo, apagar pantalla, etc.
- Super + Tab: cambiar entre aplicaciones.
- Ctrl + Alt + Flechas: ya no cambian de escritorio (liberados para el mosaico).

## Ojo con estas diferencias frente a bspwm

- Super + Shift + flecha **mueve**, no intercambia: si la zona está ocupada, las ventanas se superponen.
- Después de sacar una ventana del mosaico (Super + s), vuelve a ella con Super + Shift + flecha o arrastrándola.
- Super + Shift + ↑ en la zona superior **maximiza** la ventana.
- El mosaico es una plantilla fija: con más ventanas que huecos, las que sobran quedan flotando.
