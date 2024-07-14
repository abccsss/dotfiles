-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
--Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        -- conceal level; 0 to disable; 1 to hide but leave spaces
        conceallevel = 2,

        -- spell check
        spelllang = "en_gb",
        spell = true,
      },
    },
    autocmds = {
      filetypes = {
        -- Use tab size 4 for certain file types
        {
          event = "FileType",
          pattern = "tex",
          callback = function()
            vim.bo.tabstop = 4
            vim.bo.shiftwidth = 4
            vim.bo.expandtab = true
          end,
        },
        -- Disable spell check in popups 
        {
          event = "FileType",
          pattern = "*",
          callback = function()
            local ft = vim.bo.filetype
            if ft == "qf" or ft == "NeogitStatus" or ft == "NeogitLog" or ft == "toggleterm" then
              vim.wo.spell = false
            end
          end,
        },
      },
    },
  },
}
