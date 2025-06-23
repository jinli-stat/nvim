return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
  keys = {
    -- 使用函数调用而不是命令字符串
    { "<leader>e", function() require("neo-tree.command").execute({ toggle = true }) end, desc = "Toggle file explorer" },
    { "<leader>be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end, desc = "Buffer explorer" },
    { "<leader>ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, desc = "Git explorer" },
  },
  opts = {
    close_if_last_window = false,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    
    -- 默认数据源
    default_component_configs = {
      container = {
        enable_character_fade = true
      },
      indent = {
        indent_size = 2,
        padding = 1,
        -- 缩进指示符
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        -- 展开/折叠图标
        with_expanders = nil,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        default = "*",
        highlight = "NeoTreeFileIcon"
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- 更改状态
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "󰁕",
          -- 状态类型
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      },
    },
    
    window = {
      position = "left",
      width = 35, -- 稍微增加宽度
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = { 
          "toggle_node", 
          nowait = false, -- 禁用 nowait 如果你有其他以space开头的映射
        },
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["<esc>"] = "cancel", -- 关闭预览或浮动neo-tree窗口
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["l"] = "focus_preview",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["t"] = "open_tabnew",
        ["w"] = "open_with_window_picker",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        ["a"] = { 
          "add",
          config = {
            show_path = "none" -- "none", "relative", "absolute"
          }
        },
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- 接受相对路径
        ["m"] = "move", -- 接受相对路径
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["i"] = "show_file_details",
      }
    },
    
    nesting_rules = {},
    
    filesystem = {
      follow_current_file = { 
        enabled = true,
        leave_dirs_open = false, -- `false` 当切换文件时关闭自动展开的目录
      },
      group_empty_dirs = false, -- 当为true时，空目录将被组合在一起
      hijack_netrw_behavior = "open_current", -- netrw 替代行为
      use_libuv_file_watcher = true, -- 开启文件监视器，自动检测文件变化
      
      filtered_items = {
        visible = false, -- 当true时，它们只是半透明显示
        hide_dotfiles = false,
        hide_gitignored = false, -- 显示被git忽略的文件
        hide_hidden = true, -- 只在Windows下工作
        hide_by_name = {
          ".DS_Store", -- 隐藏macOS系统文件
          "thumbs.db"  -- 隐藏Windows缩略图文件
        },
        hide_by_pattern = { -- 使用glob模式
          -- "*.meta",
          -- "*/src/*/tsconfig.json",
        },
        always_show = { -- 即使匹配上述模式也始终显示
          -- ".gitignored",
        },
        never_show = { -- 永远不显示
          -- ".DS_Store",
          -- "thumbs.db"
        },
        never_show_by_pattern = { -- 使用glob模式永远不显示
          -- ".null-ls_*",
        },
      },
      
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["#"] = "fuzzy_sorter", -- 模糊排序使用正则表达式
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
          ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
          ["oc"] = { "order_by_created", nowait = false },
          ["od"] = { "order_by_diagnostics", nowait = false },
          ["og"] = { "order_by_git_status", nowait = false },
          ["om"] = { "order_by_modified", nowait = false },
          ["on"] = { "order_by_name", nowait = false },
          ["os"] = { "order_by_size", nowait = false },
          ["ot"] = { "order_by_type", nowait = false },
        },
        fuzzy_finder_mappings = { -- 模糊查找器映射
          ["<down>"] = "move_cursor_down",
          ["<C-n>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-p>"] = "move_cursor_up",
        },
      },
    },
    
    buffers = {
      follow_current_file = {
        enabled = true, -- 这将在缓冲区树中找到并聚焦当前文件
        leave_dirs_open = false, -- `false` 当切换缓冲区时关闭自动展开的目录
      },
      group_empty_dirs = true, -- 当为true时，空目录将被组合在一起
      show_unloaded = true,
      window = {
        mappings = {
          ["bd"] = "buffer_delete",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
          ["oc"] = { "order_by_created", nowait = false },
          ["od"] = { "order_by_diagnostics", nowait = false },
          ["om"] = { "order_by_modified", nowait = false },
          ["on"] = { "order_by_name", nowait = false },
          ["os"] = { "order_by_size", nowait = false },
          ["ot"] = { "order_by_type", nowait = false },
        }
      },
    },
    
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"]  = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
          ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
          ["oc"] = { "order_by_created", nowait = false },
          ["od"] = { "order_by_diagnostics", nowait = false },
          ["om"] = { "order_by_modified", nowait = false },
          ["on"] = { "order_by_name", nowait = false },
          ["os"] = { "order_by_size", nowait = false },
          ["ot"] = { "order_by_type", nowait = false },
        }
      }
    }
  },
}