# zsh

フレームワークは使わず、素の zsh ＋ antidote（プラグイン）＋ starship（プロンプト）の構成。

## ファイル
- `.zshenv`: 非ログインかつ非対話のシェル（スクリプトや IDE）でも `.zprofile` を読み込むためだけのファイル
- `.zprofile`: 環境変数と PATH（Homebrew、`~/.local/bin`、pnpm、mise の shims）
- `.zshrc`: 対話シェル用（setopt、補完、プラグイン、各ツールの初期化）
- `.zshrc.alias`: エイリアスと `stty -ixon`（tmux のプレフィックス `C-s` を使えるようにする）
- `zsh/plugins.txt`: antidote のプラグイン一覧。変更すると次の起動時に `~/.cache/zsh/plugins.zsh` が再生成される
- `starship.toml`: プロンプト（`user@host ~/R/dir branch ❯` の形）

## プラグイン
- ez-compinit（compinit をキャッシュ付きで実行）、zsh-completions
- zsh-autosuggestions（履歴からの候補を薄く表示。`→` で確定）
- fast-syntax-highlighting
- zsh-history-substring-search（`↑` `↓` `^P` `^N` で、入力中の文字列を含む履歴を検索）

## ツール連携
- `C-r`: atuin の履歴検索
- `C-t` / `M-c`: fzf でファイル挿入 / ディレクトリ移動（`fd` を使用）
- `z <dir>` / `zi`: zoxide
- mise: Node と pnpm を管理（`mise/config.toml`）。Python は uv で管理する
- `ll` / `la` / `lt`: eza、`lg`: lazygit
- 安全用エイリアス: `cp` / `mv` / `rm` / `ln` は `-i` 付き、`mkdir` は `-p` 付き

## 起動時間の計測
- `time zsh -i -c exit`（目安 70ms）
- 詳しく見る場合: `.zshrc` の先頭に `zmodload zsh/zprof`、末尾に `zprof` を置く
