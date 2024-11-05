local monitors = hitokage.monitor.get_all()

for _, monitor in ipairs(monitors) do
  monitor:attach({
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
            { Clock = { class = "clock-date", format = " %Y %m %d " } },
            { Label = { class = "separator", label = "|" } },
            { Clock = { class = "clock-dow", format = " %a " } },
            { Label = { class = "separator", label = "|" } },
            { Clock = { class = "clock-time", format = " %H %M %S " } },
          }
        }
      },
      {
        Box = {
          class = "right-box",
          widgets = {
            { Box = { hexpand = true } },
            { Label = { class = "icon", label = "\u{f4bc}" } },
            { Cpu = { class = "percentage", format = "{{(pad 'left' (round (mult usage 100) 0) 3)}}%" } },
            { Label = { class = "icon", label = "\u{e266}" } },
            { Memory = { class = "percentage", format = "{{(pad 'left' (round (mult (div used total) 100) 0) 3)}}%" } },
            { Label = { class = "icon", label = "\u{f0079}" } },
            { Battery = { class = "percentage", format = "{{(pad 'left' (round (mult capacity 100) 0) 3)}}%", halign = "End" } },
          }
        }
      },
    },
  })
end
