return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.theme = "catppuccin"

      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }

      opts.sections.lualine_a = {
        {
          "mode",
          icon = "",
          padding = { left = 1, right = 1 },
        },
      }
    end,
  },
}
