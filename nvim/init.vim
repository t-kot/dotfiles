
" Neovim Python host (Python3 only)
if has('nvim') && exists('$PYENV_ROOT') && isdirectory($PYENV_ROOT . "/versions/nvim-python3")
  let g:python3_host_prog = $PYENV_ROOT . '/versions/nvim-python3/bin/python'
endif

let s:nvim_dir = expand('<sfile>:p:h')
execute 'source' s:nvim_dir . '/vimrc.dein'
execute 'source' s:nvim_dir . '/vimrc.colors'
execute 'source' s:nvim_dir . '/vimrc.basic'
execute 'source' s:nvim_dir . '/vimrc.telescope'
