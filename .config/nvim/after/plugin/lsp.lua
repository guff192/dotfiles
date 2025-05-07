local lsp_zero = require('lsp-zero')

vim.g.diagnostic_active = true
function _G.toggle_diagnostic()
  if vim.g.diagnostic_active then
    vim.g.diagnostic_active = false
    vim.diagnostic.disable()
    -- vim.handlers["textDocument/publishDiagnostics"] = function() end
  else
    vim.g.diagnostic_active = true
    vim.diagnostic.enable()
  end
end

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vt", function() toggle_diagnostic() end, opts)
    -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)


-- It's important that you set up the plugins in the following order:
--    mason.nvim
--    mason-lspconfig.nvim
--    Setup servers via lspconfig
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'eslint',
        'lua_ls',
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    },
})
-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- Pylsp
-- require 'lspconfig'.pylsp.setup {
--     settings = {
--         pylsp = {
--             plugins = {
--                 pycodestyle = {
--                     enabled = true,
--                     select = {"E501"},
--                     ignore = {"W391", "W503"},
--                     maxLineLength = 79
--                 },
--                 jedicompletion = {
--                     enabled = true
--                 }
--             },
--         }
--     }
-- }
-- Pyright
-- require 'lspconfig'.pyright.setup {
--     settings = {
--         python = {
--             analysis = {
--                 autoSearchPaths = true,
--                 diagnosticMode = "openFilesOnly",
--                 useLibraryCodeForTypes = true
--             }
--         }
--     }
-- }

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    }),
})


lsp_zero.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp_zero.setup()

-- vim.diagnostic.config({
--     virtual_text = true
-- })
