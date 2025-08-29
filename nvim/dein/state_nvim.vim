if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/Users/tkot/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim,/Users/tkot/.config/nvim,/usr/local/etc/xdg/nvim,/etc/xdg/nvim,/Users/tkot/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.11.1/share/nvim/runtime,/usr/local/Cellar/neovim/0.11.1/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/tkot/.local/share/nvim/site/after,/etc/xdg/nvim/after,/usr/local/etc/xdg/nvim/after,/Users/tkot/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/tkot/.config/nvim/init.vim', '/Users/tkot/dotfiles/nvim/dein.toml', '/Users/tkot/dotfiles/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/tkot/dotfiles/nvim/dein'
let g:dein#_runtime_path = '/Users/tkot/dotfiles/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/tkot/dotfiles/nvim/dein/.cache/init.vim'
let &runtimepath = '/Users/tkot/dotfiles/nvim/dein/repos/github.com/Shougo/dein.vim,/Users/tkot/.config/nvim,/usr/local/etc/xdg/nvim,/etc/xdg/nvim,/Users/tkot/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/tkot/dotfiles/nvim/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.11.1/share/nvim/runtime,/Users/tkot/dotfiles/nvim/dein/.cache/init.vim/.dein/after,/usr/local/Cellar/neovim/0.11.1/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/tkot/.local/share/nvim/site/after,/etc/xdg/nvim/after,/usr/local/etc/xdg/nvim/after,/Users/tkot/.config/nvim/after'
filetype off
