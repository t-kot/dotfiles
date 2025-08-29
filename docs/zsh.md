# zsh

oh-my-zsh / Prezto を使いつつ、起動時の処理を最小化しパフォーマンス対策を入れています。

## ポイント
- 早期 PATH 設定: 非ログインシェルでも Homebrew の `bin` を先頭に追加（`~/.zshrc.ohmyzsh-extra`）。
- Git プロンプト: 安定時は gitstatus を使用。Obsidian では自動的に無効化してエラー回避。
- 高速補完: `ZSH_DISABLE_COMPFIX=true`。oh-my-zsh の compinit キャッシュを利用。
- VCS 負荷軽減: `DISABLE_UNTRACKED_FILES_DIRTY=true`（巨大リポで有効）。
- フロー制御無効化: `.zshrc.alias` の `stty -ixon` で tmux の `C-s` と干渉しないように。
- バージョン管理: `rbenv` / `nodenv` / `pyenv` は遅延ロード。`nvm` は無効化方針。

## 関連ファイル
- `.zshrc`: Prezto/p10k を読み込み、各言語ツールを遅延ロード。自動 tmux 起動は停止。
- `.zshrc.alias`: エイリアス群と `stty -ixon`。
- `.zshrc.ohmyzsh-extra`: パフォーマンス用の環境変数と PATH。Obsidian 専用の gitstatus フォールバックもここに記載。

## 遅延ロード
- `rbenv / nodenv / pyenv` は PATH（bin + shims）のみ通し、初回呼び出し時に `init` を実行。
- ログイン時間を短縮しつつ、使い勝手はそのまま維持します。

## Obsidian ターミナル対策
- gitstatus のキャッシュを `~/.cache/gitstatus` に固定。
- `TERM_PROGRAM=obsidian` の場合は `POWERLEVEL9K_DISABLE_GITSTATUS=1` を付与して起動エラーを回避。
- Obsidian でも VCS を使いたい場合は、アーキ不一致（arm64/x86_64）を解消するか p10k を再インストール。

## 起動時間の計測
- 目安: `time zsh -i -c exit`
- zprof: `.zshrc` 先頭に `zmodload zsh/zprof`、末尾に `zprof` を置いてホットスポットを可視化。
- xtrace（タイムスタンプ付き1回測定）: `PS4=$'+%D{%s.%3.} %N:%i> ' zsh -xvic exit 2> ~/zsh.trace`

## 主なエイリアス
- Git: `gsh/gst/gci/gdi/gdc/gbr/gad/gco/glog/grs/ggr/gmerge`
- tmux: `tlist/tkill/tkill!`
- Docker: `dc/dcu/dcr` → `docker compose`
- Editor: `vim` → `nvim`
