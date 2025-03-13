return {
  {
    "echasnovski/mini.surround",
    opts = {
      custom_surroundings = {
        B = {
          input = { "{().-()}" },
          output = { left = "{", right = "}" },
        },
      },
      mappings = {
        add = "S",
        delete = "ds",
        find = "gs",
        find_left = "gS",
        highlight = "ss",
        replace = "cs",
        update_n_lines = "sn",
      },
      respect_selection_type = true,
    },
  },
}
