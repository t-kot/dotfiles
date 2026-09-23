# tmux

Truecolor と macOS クリップボード連携に対応した、軽量でモダンな tmux 設定です。

## ポイント
- 端末設定: `default-terminal=tmux-256color`。`terminal-features` で RGB を有効化。
- プレフィックス: `C-s`（Ctrl-s）。zsh 側で `stty -ixon` を有効化してフロー制御との衝突を回避。
- マウス: 有効（`set -g mouse on`）。
- コピー: vi-copy の `y` で `pbcopy` に連携（`set-clipboard on`）。
- 再読み込み: `r` キーで `~/.tmux.conf` を再読み込み。

## ペイン/ウィンドウ操作
- 分割: `C-j`（横分割）、`C-l`（縦分割）。いずれもカレントディレクトリを引き継ぎ。
- 移動: `h/j/k/l`。
- ペイン終了: `C-k`。

## Truecolor
- 近代的な端末でより良い発色にするため、`set -as terminal-features 'tmux-256color:RGB'` を設定。

## セッション / tmux 3.7
- `prefix t`: sesh ピッカー（既存セッション + zoxide の履歴ディレクトリから選択・新規作成）。
- `pane-scrollbars modal`: copy-mode 中だけスクロールバーを表示（tmux 3.7 以上）。
- `brew upgrade tmux` 後は、tmux サーバを再起動するまで旧バージョンのまま動く（`tmux kill-server` → 再起動。tmux-resurrect / continuum でセッションを復元）。
