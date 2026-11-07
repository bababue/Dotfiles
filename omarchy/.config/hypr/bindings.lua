-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
--
--

-- ============================================================
-- Persönliche Bindings
-- ============================================================

-- ---------------------------------------------
-- Anwendungen
-- ---------------------------------------------

-- Terminal (zsh)
hl.unbind("SUPER + RETURN")
o.bind("SUPER + RETURN", "Terminal", { launch = 'xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" zsh' })

-- Tmux (Session "main")
hl.unbind("SUPER + ALT + RETURN")
o.bind("SUPER + ALT + RETURN", "Tmux",
    { launch = 'xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new -A -s main' })

-- Nautilus
o.bind("SUPER + E", "File manager", { launch = "nautilus --new-window" })

-- Browser
o.bind("SUPER + B", "Browser", "omarchy-launch-browser")
hl.unbind("SUPER + SHIFT + B")
o.bind("SUPER + SHIFT + B", "Browser (private)", "omarchy-launch-browser --private")

-- Spotify / Reaper
o.bind("SUPER + M", "Music", "omarchy-launch-or-focus spotify")
hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + M", "Music", 'omarchy-launch-or-focus PIPEWIRE_LATENCY="128/48000" reaper')

-- Editor / Obsidian
o.bind("SUPER + N", "Editor", "omarchy-launch-editor")
hl.unbind("SUPER + SHIFT + N")
o.bind("SUPER + SHIFT + N", "Obsidian", 'omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian"')

-- btop / lazydocker
o.bind("SUPER + A", "Activity", "omarchy-launch-tui btop")
hl.unbind("SUPER + SHIFT + A")
o.bind("SUPER + SHIFT + A", "Docker", "omarchy-launch-tui lazydocker")

-- 1Password
hl.unbind("SUPER + P")
o.bind("SUPER + P", "Passwords", { launch = "1password" })

-- Discord / Zoom
o.bind("SUPER + D", "Discord", 'omarchy-launch-or-focus-webapp Discord "https://discord.com/channels/@me"')
hl.unbind("SUPER + SHIFT + D")
o.bind("SUPER + SHIFT + D", "Zoom", 'omarchy-launch-or-focus-webapp Zoom "https://dhbw-stuttgart.zoom.us/join"')

-- Thunderbird / WhatsApp
hl.unbind("SUPER + W")
o.bind("SUPER + W", "Email", "omarchy-launch-or-focus thunderbird")
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "WhatsApp", 'omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"')

-- OpenWebUI / Gemini
o.bind("SUPER + R", "OpenWebUi", 'omarchy-launch-webapp "http://truenas:31028"')
o.bind("SUPER + SHIFT + R", "Gemini", 'omarchy-launch-webapp "https://claude.ai"')

-- ---------------------------------------------
-- Fensterverwaltung
-- ---------------------------------------------

o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- ---------------------------------------------
-- Workspace-Wechsel per Maustaste / Bild-Auf/Ab
-- ---------------------------------------------

o.bind("SUPER + mouse:275", "Switch to workspace 1", hl.dsp.focus({ workspace = "1" }))
o.bind("SUPER + mouse:276", "Switch to workspace 2", hl.dsp.focus({ workspace = "2" }))
o.bind("SUPER + page_down", "Switch to workspace 3", hl.dsp.focus({ workspace = "3" }))
o.bind("SUPER + page_up", "Switch to workspace 4", hl.dsp.focus({ workspace = "4" }))

o.bind("SUPER + SHIFT + mouse:275", "Move window to workspace 1", hl.dsp.window.move({ workspace = "1" }))
o.bind("SUPER + SHIFT + mouse:276", "Move window to workspace 2", hl.dsp.window.move({ workspace = "2" }))
o.bind("SUPER + SHIFT + page_down", "Move window to workspace 3", hl.dsp.window.move({ workspace = "3" }))
o.bind("SUPER + SHIFT + page_up", "Move window to workspace 4", hl.dsp.window.move({ workspace = "4" }))

-- ---------------------------------------------
-- Vim-Style Fokus- und Fenster-Verschiebung (H/J/K/L)
-- ---------------------------------------------

hl.unbind("SUPER + H")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")

o.bind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + J", "Focus down", hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + K", "Focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))

o.bind("SUPER + SHIFT + H", "Swap window left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))
o.bind("SUPER + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + L", "Swap window right", hl.dsp.window.swap({ direction = "r" }))

-- ---------------------------------------------
-- Fenster-Split umschalten
-- ---------------------------------------------

o.bind("SUPER + odiaeresis", "Toggle window split", hl.dsp.layout("togglesplit"))
