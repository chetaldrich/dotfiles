-- Ctrl+Space: right-click at mouse position
hs.hotkey.bind({ "ctrl" }, "space", function()
  local pos = hs.mouse.absolutePosition()
  hs.eventtap.event.newMouseEvent(
    hs.eventtap.event.types.rightMouseDown,
    pos
  ):post()
  hs.eventtap.event.newMouseEvent(
    hs.eventtap.event.types.rightMouseUp,
    pos
  ):post()
end)

-- Cmd+Space: remap to Option+Space (opens Raycast)
-- Spotlight's Cmd+Space shortcut is disabled by run_once_disable-spotlight-shortcut.sh
hs.hotkey.bind({ "cmd" }, "space", function()
  hs.eventtap.keyStroke({ "option" }, "space")
end)
