return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,  -- Show hidden files (dotfiles)
        },
        files = {
          hidden = true,  -- Show hidden files in file picker
        },
      },
    },
  },
}
