
" Neovim Python host (Python3 only)
if has('nvim') && exists('$PYENV_ROOT') && isdirectory($PYENV_ROOT . "/versions/nvim-python3")
  let g:python3_host_prog = $PYENV_ROOT . '/versions/nvim-python3/bin/python'
endif

source ~/Repository/dotfiles/nvim/vimrc.dein
source ~/Repository/dotfiles/nvim/vimrc.colors
source ~/Repository/dotfiles/nvim/vimrc.basic
source ~/Repository/dotfiles/nvim/vimrc.telescope
