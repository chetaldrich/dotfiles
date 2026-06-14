hs.hotkey.bind({ "ctrl" }, "space", function()
  local pos = hs.mouse.absolutePosition()
  local click = hs.eventtap.event.newMouseEvent(
    hs.eventtap.event.types.rightMouseClick,
    pos
  )
  click:post()
end)
