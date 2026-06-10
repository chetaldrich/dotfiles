#!/bin/bash
# Applies Solarized Dark color scheme to iTerm2 default profile
set -e

ITERM_COLORS="$HOME/.dark.itermcolors"
PLIST="com.googlecode.iterm2"

if [ ! -f "$ITERM_COLORS" ]; then
    echo "Color scheme not found at $ITERM_COLORS, skipping"
    exit 0
fi

python3 << 'PYEOF'
import plistlib
import subprocess
import os

colors_path = os.path.expanduser("~/.dark.itermcolors")

# Read the iTerm2 color scheme
with open(colors_path, "rb") as f:
    colors = plistlib.load(f)

# Export current iTerm2 preferences
result = subprocess.run(["defaults", "export", "com.googlecode.iterm2", "-"], capture_output=True)
plist = plistlib.loads(result.stdout)

# Apply colors to the default profile
bookmarks = plist.get("New Bookmarks", [])
if not bookmarks:
    print("No iTerm2 profiles found, skipping")
    exit(0)

profile = bookmarks[0]
print(f"Applying Solarized Dark to profile: {profile.get('Name', 'unnamed')}")

# Map iTerm2 color keys to the .itermcolors keys
color_map = {
    "Ansi 0 Color": "Ansi 0 Color",
    "Ansi 1 Color": "Ansi 1 Color",
    "Ansi 2 Color": "Ansi 2 Color",
    "Ansi 3 Color": "Ansi 3 Color",
    "Ansi 4 Color": "Ansi 4 Color",
    "Ansi 5 Color": "Ansi 5 Color",
    "Ansi 6 Color": "Ansi 6 Color",
    "Ansi 7 Color": "Ansi 7 Color",
    "Ansi 8 Color": "Ansi 8 Color",
    "Ansi 9 Color": "Ansi 9 Color",
    "Ansi 10 Color": "Ansi 10 Color",
    "Ansi 11 Color": "Ansi 11 Color",
    "Ansi 12 Color": "Ansi 12 Color",
    "Ansi 13 Color": "Ansi 13 Color",
    "Ansi 14 Color": "Ansi 14 Color",
    "Ansi 15 Color": "Ansi 15 Color",
    "Background Color": "Background Color",
    "Foreground Color": "Foreground Color",
    "Bold Color": "Bold Color",
    "Cursor Color": "Cursor Color",
    "Cursor Text Color": "Cursor Text Color",
    "Selected Text Color": "Selected Text Color",
    "Selection Color": "Selection Color",
}

# Convert iTerm2 plist color format to the format used in .itermcolors
def convert_color(color_dict):
    """Convert between iTerm2 internal format and .itermcolors format"""
    # .itermcolors uses "Red Component", "Green Component", "Blue Component"
    # iTerm2 internal uses the same keys
    return {
        "Alpha Component": color_dict.get("Alpha Component", 1.0),
        "Blue Component": color_dict.get("Blue Component", 0.0),
        "Color Space": color_dict.get("Color Space", "sRGB"),
        "Green Component": color_dict.get("Green Component", 0.0),
        "Red Component": color_dict.get("Red Component", 0.0),
    }

# Apply the colors
for iterm_key, colors_key in color_map.items():
    if colors_key in colors:
        profile[iterm_key] = convert_color(colors[colors_key])
        # Also set the Dark mode variants
        profile[f"{iterm_key} (Dark)"] = convert_color(colors[colors_key])

# Write the modified preferences
with open("/tmp/iterm2.plist", "wb") as f:
    plistlib.dump(plist, f)

subprocess.run(["defaults", "import", "com.googlecode.iterm2", "/tmp/iterm2.plist"], check=True)
os.remove("/tmp/iterm2.plist")

print("Solarized Dark color scheme applied successfully")
print("Restart iTerm2 to see changes")
PYEOF
