local monitors = hitokage.monitor.get_all()

for _, monitor in ipairs(monitors) do
  local is_low_res = monitor.geometry.width < 2000
  local bar_class = is_low_res and "bar-low-res" or ""

  monitor:attach({
    class = bar_class,
    children = {
      {
        Box = {
          class = "left-box",
          widgets = {
            { Workspace = { halign = "Start" } },
          },
        },
      },
      {
        Box = {
          hexpand = true,
          halign = "Center",
          widgets = {
            { Clock = { class = "clock-date", format = "%Y %m %d" } },
            { Label = { class = "separator", label = " | " } },
            { Clock = { class = "clock-dow", format = "%a" } },
            { Label = { class = "separator", label = " | " } },
            { Clock = { class = "clock-time", format = "%H %M %S  " } },
          }
        }
      },
      {
        Box = {
          class = "right-box",
          widgets = {
            { Box = { hexpand = true } },
            { Label = { class = "text-icon", label = "CPU " } },
            { Cpu = { class = "percentage", format = "{{(pad 'left' (round (mult usage 100) 0) 3)}}%" } },
            { Label = { class = "separator", label = " | " } },
            { Label = { class = "text-icon", label = "RAM " } },
            { Memory = { class = "percentage", format = "{{(pad 'left' (round (mult (div used total) 100) 0) 3)}}%" } },
            { Label = { class = "separator", label = " | " } },
            { Label = { class = "text-icon", label = "BAT " } },
            { Battery = { class = "percentage", format = "{{(pad 'left' (round (mult capacity 100) 0) 3)}}%" } },
          }
        }
      },
    },
  })
end
