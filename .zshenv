# Sourced by every zsh. Non-login, non-interactive shells (scripts, editors,
# GUI apps) never read .zprofile, so pull it in here for them.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
