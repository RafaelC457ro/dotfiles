local keymap = vim.keymap
i
-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- file explorer
keymap.set('n', 'eo', '<Cmd>NvimTreeOpen<CR>')
keymap.set('n', 'ex', '<Cmd>NvimTreeClose<CR>')
keymap.set('n', 'ef', '<Cmd>NvimTreeFocus<CR>')

