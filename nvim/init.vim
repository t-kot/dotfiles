
"" for only neovim. in pyenv virtualenv named 'nvim-python3'
if has('nvim') && isdirectory( $PYENV_ROOT."/versions/nvim-python3" )
  let g:python3_host_prog = $PYENV_ROOT.'/versions/nvim-python3/bin/python'
endif

"" for only neovim. in pyenv virtualenv named 'nvim-python2'
if has('nvim') && isdirectory( $PYENV_ROOT."/versions/nvim-python2" )
  let g:python_host_prog = $PYENV_ROOT.'/versions/nvim-python2/bin/python'
endif

source ~/dotfiles/nvim/vimrc.dein
source ~/dotfiles/nvim/vimrc.colors
source ~/dotfiles/nvim/vimrc.basic
source ~/dotfiles/nvim/vimrc.unite