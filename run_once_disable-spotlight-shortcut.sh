#!/bin/bash
# Disables Spotlight's Cmd+Space shortcut so Hammerspoon can remap it to Raycast.
# Uses a private Apple framework to apply changes without logout/restart.

set -euo pipefail

PLIST="com.apple.symbolichotkeys"
KEY=64  # Show Spotlight search

# Check if already disabled
current=$(/usr/bin/PlistBuddy -c "Print ${PLIST}:AppleSymbolicHotKeys:${KEY}:enabled" \
  ~/Library/Preferences/${PLIST}.plist 2>/dev/null || echo "true")

if [ "$current" = "0" ] || [ "$current" = "false" ]; then
  echo "spotlight: Cmd+Space shortcut already disabled."
  exit 0
fi

echo "spotlight: Disabling Cmd+Space shortcut..."

defaults write "$PLIST" AppleSymbolicHotKeys -dict-add "$KEY" "
<dict>
  <key>enabled</key><false/>
  <key>value</key><dict>
    <key>type</key><string>standard</string>
    <key>parameters</key><array>
      <integer>32</integer>
      <integer>49</integer>
      <integer>1048576</integer>
    </array>
  </dict>
</dict>
"

/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

echo "spotlight: Done. Cmd+Space shortcut disabled."
