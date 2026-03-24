local function load_theme()
  local state_file = vim.fn.expand("~/.local/share/nvim/theme-state")
  local current_theme_file = vim.fn.expand("~/.config/.current-theme")
  local colorscheme = "catppuccin-mocha"
  local background = "dark"

  -- Read the theme state file written by the theme switcher
  if vim.fn.filereadable(state_file) == 1 then
    for line in io.lines(state_file) do
      local key, value = line:match("^(%w+)=(.+)$")
      if key == "colorscheme" then
        colorscheme = value
      elseif key == "background" then
        background = value
      end
    end
  elseif vim.fn.filereadable(current_theme_file) == 1 then
    -- Fallback: read theme name and derive settings from themes dir
    local name = vim.fn.readfile(current_theme_file)[1]
    if name then
      name = name:gsub("%s+$", "")
      local theme_file = vim.fn.expand("~/.config/themes/" .. name)
      if vim.fn.filereadable(theme_file) == 1 then
        for line in io.lines(theme_file) do
          local key, value = line:match("^(%w+)=(.+)$")
          if key == "nvim" then
            colorscheme = value
          elseif key == "background" then
            background = value
          end
        end
      end
    end
  end

  local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
  if not ok then
    vim.notify("Theme '" .. colorscheme .. "' not found, falling back to catppuccin", vim.log.levels.WARN)
    pcall(vim.cmd.colorscheme, "catppuccin")
  end
  -- Set background after colorscheme so the plugin doesn't override it
  vim.o.background = background
end

-- Register :ThemeReload — deferred so it runs after plugin event handlers settle
vim.api.nvim_create_user_command("ThemeReload", function()
  vim.schedule(load_theme)
end, { desc = "Reload theme from state file" })

return {
  -- Colorscheme plugins
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
  },

  -- Override LazyVim colorscheme to use our theme state
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        load_theme()
      end,
    },
  },
}
