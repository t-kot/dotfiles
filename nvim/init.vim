
" Neovim Python host (Python3 only)
if has('nvim') && exists('$PYENV_ROOT') && isdirectory($PYENV_ROOT . "/versions/nvim-python3")
  let g:python3_host_prog = $PYENV_ROOT . '/versions/nvim-python3/bin/python'
endif

source ~/dotfiles/nvim/vimrc.dein
source ~/dotfiles/nvim/vimrc.colors
source ~/dotfiles/nvim/vimrc.basic
source ~/dotfiles/nvim/vimrc.telescope
