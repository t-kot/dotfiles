# Environment and PATH (login shells; also pulled in by .zshenv).
# Lives in .zprofile rather than .zshenv because macOS /etc/zprofile runs
# path_helper, which would reorder anything set earlier.

export LANG=${LANG:-en_US.UTF-8}
export EDITOR=nvim VISUAL=nvim PAGER=less
export LESS='-g -i -M -R -S -w -X -z-4'
export BROWSER=open

typeset -gU path fpath
export PNPM_HOME="$HOME/Library/pnpm"
path=(
  $HOME/.local/bin
  $HOME/bin(N)
  /opt/homebrew/{,s}bin(N)
  $PNPM_HOME/bin(N)
  $path
)

# mise shims so non-interactive shells (scripts, IDEs) see managed tools;
# interactive shells switch to `mise activate` in .zshrc.
path=($HOME/.local/share/mise/shims(N) $path)
