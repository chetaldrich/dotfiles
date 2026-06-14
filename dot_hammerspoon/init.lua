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
