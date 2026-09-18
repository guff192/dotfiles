-- Monitor and workspace configuration

hl.env("GDK_SCALE", "1")

-- Internal laptop monitor
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "auto", scale = 1.5 })

-- Secondary monitor placed above main display
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "auto-up", scale = 1 })

-- Workspaces 1-5 on laptop monitor
hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })

-- Workspaces 6-10 on HDMI monitor
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })
