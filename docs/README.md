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
- Claude Code の `settings.json` と `skills/` は Git 管理外（非公開のリポジトリ名などを含むため）。初回の `install.sh` 実行時に `settings.example.json` から作られる。hooks など共有してよい変更は example 側にも手で反映する
- ユーザー名や認証情報など、マシン固有の git 設定は `~/.gitconfig` に置く（`git/config` より優先される）

## メンテナンス
- まとめて更新: `brew upgrade`、`mise upgrade`、Neovim 内で `:lua vim.pack.update()`、zsh で `antidote update`
- tmux の再読み込み: `prefix r`（本体を更新したあとは `tmux kill-server` で再起動が必要）

## リポジトリ運用
- プラグイン本体は追跡しない。`nvim/nvim-pack-lock.json` だけを管理する。

## ターミナル（Ghostty）
- 設定: `ghostty/config`（`~/.config/ghostty/config`）。フォント・透過は iTerm2 のプロファイルから移植
- 左 Option を Alt として使う（fzf の `M-c` など）。右 Option は従来どおり特殊文字の入力
- ssh 先には Ghostty の terminfo を自動で送る（`shell-integration-features = ssh-env,ssh-terminfo`）
- 設定の再読み込み: `cmd+shift+,`

## Claude Code
- statusLine: `.claude-global/statusline.sh`（ディレクトリ・ブランチ・worktree・モデル・コンテキスト使用率・5時間の使用率）。コンテキスト使用率は 50% で黄、80% で赤
- 並列作業: `cw <name>` で tmux の新しいウィンドウを開き、`claude --worktree <name>` を起動する（1ウィンドウ = 1 worktree = 1エージェント）
  - worktree は `.claude/worktrees/<name>`、ブランチは `worktree-<name>`。同じ名前で実行すると再開する
  - gitignore しているファイル（`.env` など）を worktree にコピーしたい場合は、リポジトリに `.worktreeinclude` を置く
- 各ウィンドウの状態（⏳ 実行中 / 🔔 入力待ち / ✅ 完了）は tmux のステータスバーに表示される

## シークレット対策
- コミット時に gitleaks が差分をスキャンする（`.githooks/pre-commit`）。`install.sh` が `core.hooksPath` を設定する
- 誤検知で止まったときは `git commit --no-verify`。恒常的に除外したい場合は `.gitleaksignore` に fingerprint を追加する
