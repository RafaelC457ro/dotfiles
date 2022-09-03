vim.cmd('autocmd!')

-- encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true -- show lines numbers

vim.opt.autoindent = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.backspace = { 'start', 'eol', 'indent'}
vim.opt.wrap = false -- No Wrap lines
vim.opt.expandtab = true

vim.opt.title = true
vim.opt.shell = 'zsh'
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wrap = false -- No Wrap lines

vim.opt.termguicolors = true

