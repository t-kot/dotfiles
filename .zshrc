ZSH=$HOME/.oh-my-zsh
ZSH_THEME='rkj'
COMPLETION_WAITING_DOTS="true"
plugins=(git ruby rails gem brew cap)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $HOME/dotfiles/.zshrc.custom
GOHOME=$HOME/go

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kotohata/lib/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/kotohata/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kotohata/lib/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/kotohata/lib/google-cloud-sdk/completion.zsh.inc'; fi
