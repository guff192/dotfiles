vim.g.codeium_disable_bindings = 1

vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })

function toggleCodeium()
    if vim.g.codeium_enabled then
        vim.g.codeium_enabled = false
        print("Codeium disabled")
    else
        vim.g.codeium_enabled = true
        print("Codeium enabled")
    end
end

vim.keymap.set('n', '<C-A>', toggleCodeium)
vim.keymap.set('i', '<C-A>', toggleCodeium)

