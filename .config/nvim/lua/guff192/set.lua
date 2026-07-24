-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

-- Use this careful
vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabulation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- No wrapping by default
vim.opt.wrap = false

-- Set wrap for some file types
-- First, we add the file types
vim.filetype.add({
    extension = {
        log = "log",
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "log" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.undofile = false

vim.opt.hlsearch = true

-- Transparent background
-- vim.cmd("highlight Normal guibg=none")
-- vim.cmd("highlight NormalFloat guibg=none")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- Enable inline diagnostic messages
vim.diagnostic.config({ virtual_text = true })

