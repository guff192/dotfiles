Color = "none"

function _G.ColorMyPencils(color)
    -- Delete current buffer and return back
    local file = vim.fn.expand('%')
    local line = vim.fn.line('.')
    vim.cmd('bdel')
    vim.cmd('e ' .. file)
    vim.fn.cursor(line, 0)
    vim.cmd('normal zz')
    vim.cmd('normal _')

    -- Set the colorscheme, default is neogruvbox
    vim.cmd("colorscheme catppuccin-mocha")

end

vim.keymap.set("n", "<leader>cc", function() ColorMyPencils() end) -- ColorMyPencils()
