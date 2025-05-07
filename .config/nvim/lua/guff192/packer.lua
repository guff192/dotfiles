-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --------------------------------
    -- Some useful lightweight plugins
    --------------------------------
    -- colorizer.lua
    use 'norcalli/nvim-colorizer.lua'
    require('colorizer').setup()


    --------------------------------
    -- Colorscheme
    --------------------------------
    -- neogruvbox
    -- use({
    --     'almo7aya/neogruvbox.nvim',
    --     as = 'neogruvbox',
    --     config = function()
    --         vim.cmd('colorscheme neogruvbox')
    --     end
    -- })

    -- kanagawa
    -- use "rebelot/kanagawa.nvim"
    -- Default options:
    -- require('kanagawa').setup({
    --     commentStyle = { italic = false },
    --     keywordStyle = { italic = false },
    --     statementStyle = { bold = true },
    --     transparent = true,         -- do not set background color
    --     dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
    --     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    --     theme = "wave",              -- Load "wave" theme when 'background' option is not set
    --     background = {               -- map the value of 'background' option to a theme
    --         dark = "wave",           -- try "dragon" !
    --         light = "lotus"
    --     },
    -- })

    -- catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }
    require("catppuccin").setup({
        transparent_background = true, -- disables setting the background color.
        term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    })

    -- setup must be called before loading
    vim.cmd("colorscheme catppuccin-mocha")


    ------------------------------
    --------- Must have ----------
    ------------------------------
    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- Treesitter context
    use('nvim-treesitter/nvim-treesitter-context')
    require('treesitter-context').setup({
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    })

    -- Telescope --
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- 🔥 Harpoon
    use('theprimeagen/harpoon')

    -- Undotree
    use('mbbill/undotree')

    -- Git
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    require('gitsigns').setup()

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }


    ---------------------
    -- AI code copilot --
    ---------------------
    -- Codeium
    use 'Exafunction/codeium.vim'

end)
