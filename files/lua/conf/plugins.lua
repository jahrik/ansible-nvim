-- Bootstrap Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    -- Packer
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- colorscheme
    use "EdenEast/nightfox.nvim"

    -- nvim-tree & devicons
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    -- barbar
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

    -- filetype
    use("nathom/filetype.nvim")

    -- better whitespace
    use 'ntpeters/vim-better-whitespace'

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true},
        config = function()
            require('lualine').setup({
                options = { theme = "terafox", }
            })
        end
    }

    -- Black
    use {"psf/black", cmd = {"Black"}}

    -- vim-test
    use "vim-test/vim-test"

    -- which key
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup {} end
    }

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            {'williamboman/mason.nvim'}, -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-buffer'}, -- Optional
            {'hrsh7th/cmp-path'}, -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'}, -- Optional
            -- Snippets
            {'L3MON4D3/LuaSnip'}, -- Required
            {'rafamadriz/friendly-snippets'} -- Optional
        }
    }

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below

                position = "bottom", -- position of the list can be: bottom, top, left, right
                height = 7, -- height of the trouble list when position is top or bottom
                width = 50, -- width of the list when position is left or right
                icons = true, -- use devicons for filenames
                mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
                fold_open = "", -- icon used for open folds
                fold_closed = "", -- icon used for closed folds
                group = true, -- group results by file
                padding = true, -- add an extra new line on top of the list
                action_keys = { -- key mappings for actions in the trouble list
                    -- map to {} to remove a mapping, for example:
                    -- close = {},
                    close = "q", -- close the list
                    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = "r", -- manually refresh
                    jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
                    open_split = {"<c-x>"}, -- open buffer in new split
                    open_vsplit = {"<c-v>"}, -- open buffer in new vsplit
                    open_tab = {"<c-t>"}, -- open buffer in new tab
                    jump_close = {"o"}, -- jump to the diagnostic and close the list
                    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                    toggle_preview = "P", -- toggle auto_preview
                    hover = "K", -- opens a small popup with the full multiline message
                    preview = "p", -- preview the diagnostic location
                    close_folds = {"zM", "zm"}, -- close all folds
                    open_folds = {"zR", "zr"}, -- open all folds
                    toggle_fold = {"zA", "za"}, -- toggle fold of current file
                    previous = "k", -- previous item
                    next = "j" -- next item
                },
                indent_lines = true, -- add an indent guide below the fold icons
                auto_open = false, -- automatically open the list when you have diagnostics
                auto_close = true, -- automatically close the list when you have no diagnostics
                auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                auto_fold = false, -- automatically fold a file trouble list at creation
                auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
                signs = {
                    -- icons / text used for a diagnostic
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "﫠"
                },
                use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
            }
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)
