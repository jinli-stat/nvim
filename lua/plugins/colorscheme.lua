-- ~/.config/nvim/lua/plugins/colorscheme.lua

-- 🎨 在这里设置你的默认主题，只需要修改这一行！
local DEFAULT_THEME = "github_light" -- 可选: dracula, github_dark, github_light, rose-pine, rose-pine-moon, rose-pine-dawn

-- 主题配置表
local themes = {
  dracula = {
    plugin = "Mofiqul/dracula.nvim",
    colorscheme = "dracula",
  },
  ["github_dark"] = {
    plugin = "projekt0n/github-nvim-theme",
    colorscheme = "github_dark",
  },
  ["github_light"] = {
    plugin = "projekt0n/github-nvim-theme",
    colorscheme = "github_light",
  },
  ["github_dark_dimmed"] = {
    plugin = "projekt0n/github-nvim-theme",
    colorscheme = "github_dark_dimmed",
  },
  ["rose-pine"] = {
    plugin = "rose-pine/neovim",
    name = "rose-pine",
    colorscheme = "rose-pine",
  },
  ["rose-pine-moon"] = {
    plugin = "rose-pine/neovim",
    name = "rose-pine",
    colorscheme = "rose-pine-moon",
  },
  ["rose-pine-dawn"] = {
    plugin = "rose-pine/neovim",
    name = "rose-pine",
    colorscheme = "rose-pine-dawn",
  },
}

-- 生成插件配置
local plugins = {}

for theme_key, theme_config in pairs(themes) do
  local plugin_config = {
    theme_config.plugin,
    lazy = theme_key ~= DEFAULT_THEME, -- 只有默认主题不懒加载
    priority = theme_key == DEFAULT_THEME and 1000 or nil, -- 默认主题优先级最高
  }

  -- 如果有自定义名称，添加它
  if theme_config.name then
    plugin_config.name = theme_config.name
  end

  -- 如果是默认主题，添加配置函数
  if theme_key == DEFAULT_THEME then
    plugin_config.config = function()
      -- 如果有 setup 函数，先调用它
      if theme_config.setup then
        theme_config.setup()
      end
      vim.cmd("colorscheme " .. theme_config.colorscheme)
    end
  else
    -- 非默认主题也需要 setup 配置
    if theme_config.setup then
      plugin_config.config = theme_config.setup
    end
  end

  table.insert(plugins, plugin_config)
end

-- 添加 LazyVim 默认主题覆盖
table.insert(plugins, {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = themes[DEFAULT_THEME].colorscheme,
  },
})

return plugins
