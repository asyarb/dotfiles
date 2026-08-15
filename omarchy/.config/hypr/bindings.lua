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

-- Replace "PRINT" with "HOME" in most keybindings.
-- Screenshot
hl.unbind("PRINT")
o.bind("HOME", "Screenshot", "omarchy-capture-screenshot")

-- Screenrecording
hl.unbind("ALT + PRINT")
o.bind(
	"ALT + HOME",
	"Screenrecording",
	"omarchy-capture-screenrecording --stop-recording || omarchy-menu toggle trigger.capture.screenrecord"
)

-- Color picker
hl.unbind("SUPER + PRINT")
hl.unbind("SUPER + HOME")
o.bind("SUPER + HOME", "Color picker", "pkill hyprpicker || hyprpicker -a")

-- Extract (OCR)
hl.unbind("SUPER + CTRL + PRINT")
hl.unbind("SUPER + CTRL + HOME")
o.bind("SUPER + CTRL + HOME", "Extract text (OCR) from screenshot", "omarchy-capture-text")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")
hl.unbind("SUPER + ALT + HOME")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
