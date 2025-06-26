return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Toggle file explorer",
    },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git explorer",
    },
  },
  opts = {
    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          ".DS_Store",
          "node_modules",
        },
      },
    },

    window = {
      width = 30,
    },

    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
  },
}
