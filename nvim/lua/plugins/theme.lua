return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      transparent_background = true,
      auto_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        nvimtree = false,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
      custom_highlights = function(colors)
        return {
          CursorLine = { bg = "none" },

          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },
          NeoTreeEndOfBuffer = { bg = "NONE" },

          NeoTreeWinSeparator = { bg = "none", fg = colors.surface1 },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
