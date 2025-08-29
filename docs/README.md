# Dotfiles ドキュメント

このフォルダでは、レポジトリに含まれる各種設定（zsh / tmux / Vim/Neovim）について、セットアップ・キーバインド・運用メモをまとめています。

- zsh: docs/zsh.md を参照
- tmux: docs/tmux.md を参照
- Vim/Neovim: docs/vim.md を参照

## 概要
- 対応 OS: macOS
- パッケージ管理: Homebrew
- ターミナル: Truecolor 対応（`tmux-256color`）
- エディタ: Neovim（0.11.xで検証）

## クイックスタート
- 設定ファイルのリンク（管理方法に合わせて調整してください）
  - `ln -s ~/dotfiles/.zshrc ~/.zshrc`
  - `ln -s ~/dotfiles/.zshrc.alias ~/.zshrc.alias`
  - `ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf`
  - Neovim は本レポの `nvim/init.vim` を通じて読み込みます。
- 推奨 Homebrew パッケージ
  - `ripgrep`（Telescope の live_grep を高速化）
  - `fd`（ファイル列挙を高速化・任意）
  - `make`（Command Line Tools。`telescope-fzf-native` のビルドに使用）

## メンテナンス
- Neovim 本体の更新: `brew upgrade neovim`
- プラグイン更新（Neovim 内）: `:call dein#update()`
- tmux の再読み込み: `tmux source-file ~/.tmux.conf`
- zsh の起動高速化/計測のコツ: docs/zsh.md を参照

## リポジトリ運用
- プラグインのキャッシュは追跡しません。`.gitignore` により `nvim/dein/` を除外してレポを軽量に保ちます。
