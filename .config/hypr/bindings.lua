-- Keybindings overrides

-- 1. Browser on SUPER + SHIFT + RETURN, disable SUPER + SHIFT + B
hl.unbind("SUPER + SHIFT + B")
hl.unbind("SUPER + SHIFT + RETURN")
o.bind("SUPER + SHIFT + RETURN", "Browser", { omarchy = "browser" })

-- 2. Reaper on SUPER + SHIFT + R
-- Unbind default SUPER + SHIFT + R (default: Show reminders)
hl.unbind("SUPER + SHIFT + R")
o.bind("SUPER + SHIFT + R", "Reaper", { launch = "reaper", focus = "^reaper$" })

-- 3. Terminal & Tmux
o.bind("SUPER + ALT + RETURN", "Tmux", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" bash -c "tmux attach || tmux new -s Work"')

-- 5. Applications & Tools
o.bind("SUPER + SHIFT + M", "Music TUI", { tui = "cliamp", focus = true})
o.bind("SUPER + SHIFT + ALT + M", "Music TUI", { tui = "cliamp", focus = true })
o.bind("SUPER + SHIFT + C", "Calendar", 'omarchy-launch-or-focus ^gnome-calendar$ "uwsm-app -- gnome-calendar"')
o.bind("SUPER + SHIFT + D", "Docker", { tui = "lazydocker" })
o.bind("SUPER + SHIFT + N", "Editor", { omarchy = "editor" })
o.bind("SUPER + SHIFT + G", "Signal", 'omarchy-launch-or-focus ^signal$ "uwsm-app -- signal-desktop"')
o.bind("SUPER + SHIFT + T", "Telegram", 'omarchy-launch-or-focus ^org.telegram.desktop$ "uwsm-app -- Telegram"')
o.bind("SUPER + SHIFT + W", "Typora", "uwsm-app -- typora --enable-wayland-ime")
o.bind("SUPER + SHIFT + O", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })

-- 6. Web Apps
o.bind("SUPER + SHIFT + A", "ChatGPT", { webapp = "https://chatgpt.com" })
o.bind("SUPER + SHIFT + ALT + A", "Grok", { webapp = "https://grok.com" })
o.bind("SUPER + SHIFT + Y", "YouTube", { webapp = "https://youtube.com/" })
o.bind("SUPER + SHIFT + ALT + G", "WhatsApp", { webapp = "https://web.telegram.org/k/", focus = true })
o.bind("SUPER + SHIFT + CTRL + G", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
o.bind("SUPER + SHIFT + P", "Google Photos", { webapp = "https://photos.google.com/", focus = true })
