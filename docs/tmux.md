# tmux

Truecolor と macOS クリップボード連携に対応した、軽量でモダンな tmux 設定です。

## ポイント
- 端末設定: `default-terminal=tmux-256color`。`terminal-features` で RGB を有効化。
- プレフィックス: `C-s`（Ctrl-s）。zsh 側で `stty -ixon` を有効化してフロー制御との衝突を回避。
- マウス: 有効（`set -g mouse on`）。
- コピーモード（vi キー）:
  - `v` で選択開始、`C-v` で矩形選択、`y` でクリップボードにコピー（`pbcopy`）
  - `Esc`: 選択中なら解除し、何も選択していなければコピーモードを抜ける
  - マウス: ドラッグで選択（コピーはしない）。選択中にクリックするとコピーモードを抜ける
  - 選択の色は青（`mode-style` / `copy-mode-selection-style`）
  - 入力ソースの自動切り替え: コピーモードに入ると英数（`@ime-ascii`）に切り替え、抜けると元に戻す。日本語入力のままでも `y` などがすぐ効く。`macism` と `tmux/ime.sh` を使う
- 再読み込み: `r` キーで `~/.tmux.conf` を再読み込み。

## ペイン/ウィンドウ操作
- 分割: `C-j`（横分割）、`C-l`（縦分割）。いずれもカレントディレクトリを引き継ぎ。
- 移動: `h/j/k/l`。
- ペイン終了: `C-k`。

## Truecolor
- 近代的な端末でより良い発色にするため、`set -as terminal-features 'tmux-256color:RGB'` を設定。

## セッション / tmux 3.7
- `prefix t`: sesh ピッカー（既存セッション + zoxide の履歴ディレクトリから選択・新規作成）。
- スクロールバーは使わない（`pane-scrollbars off`）。`modal` にすると、コピーモードに入ったときにペインが1列狭くなって折り返しがずれるため。
- `brew upgrade tmux` 後は、tmux サーバを再起動するまで旧バージョンのまま動く（`tmux kill-server` → 再起動。tmux-resurrect / continuum でセッションを復元）。
