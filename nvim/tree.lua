vim.api.nvim_set_keymap('n', '<space>n', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>r', ':NvimTreeRefresh<CR>', { noremap = true })


vim.g.nvim_tree_refresh_wait = 500
require 'nvim-tree'.setup {
    create_in_closed_folder = false,
    respect_buf_cwd         = true,
    disable_netrw           = true,
    hijack_netrw            = true,
    open_on_setup           = true,
    ignore_ft_on_setup      = {},
    --update_to_buf_dir   = {
    --    enable = true,
    --    auto_open = true,
    --},
    --auto_close          = false,
    open_on_tab             = false,
    hijack_cursor           = false,
    update_cwd              = false,
    actions                 = {
        open_file = {
            window_picker = {
                enable = false,
                exclude = {
                    filetype = {
                        'notify',
                        'packer',
                        'qf'
                    },
                    buftype = {
                        'terminal'
                    }
                }
            },
            quit_on_open = true

        }
    },
    renderer                = {
        highlight_git = true,
        highlight_opened_files = "icon",
        add_trailing = true,
        root_folder_modifier = ':~',
        indent_markers = {
            enable = true
        },
        special_files = { ['README.md'] = true, Makefile = true, MAKEFILE = true },
        group_empty = true,
        icons = {
            symlink_arrow = ' >> ',
            padding = ' ',
            show = {
                git = true,
                folder = false,
                file = false,
                folder_arrow = false,
            },
            glyphs = {
                default = '',
                symlink = '',
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                },
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                }
            }
        }
    },
    diagnostics             = {
        enable = true,
        icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
        }
    },
    update_focused_file     = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open             = {
        cmd  = nil,
        args = {}
    },
    view                    = {
        width = 30,
        height = 30,
        side = 'left',
        --auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}
