-- Neovim 0.12+ config. ~/.config/nvim is a symlink to this directory, so the
-- vim.pack lockfile (nvim-pack-lock.json) lands here and is version-controlled.
-- Update plugins: :lua vim.pack.update()  (review, then :write to apply)

------------------------------------------------------------------------------
-- Options (only non-defaults; Neovim already sets hlsearch, incsearch,
-- autoindent, laststatus=2, mouse=a, termguicolors, etc.)
------------------------------------------------------------------------------
local o = vim.opt
o.number = true
o.ambiwidth = 'double'
o.ignorecase = true
o.smartcase = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 2
o.formatoptions:append('mM')
o.whichwrap = 'b,s,h,l,<,>,[,]'
o.wrapscan = false
o.writebackup = false
o.clipboard = 'unnamedplus'
o.fileencoding = 'utf-8'
o.scrolloff = 5
o.foldlevel = 99
o.ttimeoutlen = 0

------------------------------------------------------------------------------
-- Keymaps
------------------------------------------------------------------------------
local map = vim.keymap.set
map('n', ';', ':')
map('n', ':', ';')
map('n', '<Esc><Esc>', '<Cmd>nohlsearch<CR>')
map('n', '<C-n>', '<Cmd>bnext<CR>')
map('n', '<C-p>', '<Cmd>bprevious<CR>')
map('n', '<Space>n', '10<C-w><')
map('n', '<Space>m', '10<C-w>>')
map('n', '<Space><Space>', 'a<Space><Esc>')
map('n', 'j', 'gj')
map('n', 'k', 'gk')

------------------------------------------------------------------------------
-- Colors: keep the terminal background transparent. With termguicolors the
-- GUI background is what gets painted, so clear guibg on every ColorScheme.
------------------------------------------------------------------------------
local function transparent_bg()
  for _, group in ipairs({ 'Normal', 'NonText', 'EndOfBuffer', 'SignColumn', 'LineNr' }) do
    vim.api.nvim_set_hl(0, group, { bg = 'NONE', ctermbg = 'NONE' })
  end
end
vim.api.nvim_create_autocmd('ColorScheme', { callback = transparent_bg })
transparent_bg()

------------------------------------------------------------------------------
-- Plugins
------------------------------------------------------------------------------
vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/ibhagwan/fzf-lua',
})

-- Picker. <C-f>: files under the current buffer's directory, <C-b>: buffers.
-- Inside the picker: <C-j> split, <C-l> vsplit, <Esc> close.
local fzf = require('fzf-lua')
fzf.setup({
  winopts = { fullscreen = false },
  fzf_opts = { ['--layout'] = 'reverse' },
  actions = {
    files = {
      true, -- keep the default file actions
      ['ctrl-j'] = fzf.actions.file_split,
      ['ctrl-l'] = fzf.actions.file_vsplit,
    },
  },
})
local function files_from_buffer_dir()
  fzf.files({ cwd = vim.fn.expand('%:p:h') })
end
map({ 'n', 'i' }, '<C-f>', files_from_buffer_dir)
map({ 'n', 'i' }, '<C-b>', fzf.buffers)
