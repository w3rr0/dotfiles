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
        snacks = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
      custom_highlights = function(colors)
        return {
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },

          CursorLine = { bg = "none" },
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
