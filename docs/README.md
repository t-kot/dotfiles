# Dotfiles ドキュメント

このフォルダでは、レポジトリに含まれる各種設定（zsh / tmux / Vim/Neovim）について、セットアップ・キーバインド・運用メモをまとめています。

- zsh: docs/zsh.md を参照
- tmux: docs/tmux.md を参照
- Vim/Neovim: docs/vim.md を参照

## 概要
- 対応 OS: macOS
- パッケージ管理: Homebrew
- ターミナル: Truecolor 対応（`tmux-256color`）
- エディタ: Neovim（0.12.x で検証）

## クイックスタート
```sh
git clone git@github.com:t-kot/dotfiles.git ~/Repository/dotfiles
~/Repository/dotfiles/install.sh --brew   # シンボリックリンクと brew bundle
```
- `install.sh` は何度実行しても同じ結果になる。既存ファイルがあれば `~/.dotfiles-backup/<日時>/` に退避してからリンクする
- ユーザー名や認証情報など、マシン固有の git 設定は `~/.gitconfig` に置く（`git/config` より優先される）

## メンテナンス
- まとめて更新: `brew upgrade`、`mise upgrade`、Neovim 内で `:lua vim.pack.update()`、zsh で `antidote update`
- tmux の再読み込み: `prefix r`（本体を更新したあとは `tmux kill-server` で再起動が必要）

## リポジトリ運用
- プラグイン本体は追跡しない。`nvim/nvim-pack-lock.json` だけを管理する。
