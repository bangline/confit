return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,   -- Show hidden files (dotfiles)
          ignored = true,  -- Show gitignored files
        },
        files = {
          hidden = true,   -- Show hidden files in file picker
          ignored = true,  -- Show gitignored files
        },
      },
    },
  },
}
