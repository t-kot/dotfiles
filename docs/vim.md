# Neovim

Neovim 0.12 以上が前提。`~/.config/nvim` はこのリポジトリの `nvim/` へのシンボリックリンク。

## 構成
- `nvim/init.lua`: 設定はこの1ファイル（オプション・キーマップ・透過背景・プラグイン）
- `nvim/nvim-pack-lock.json`: `vim.pack` のロックファイル（Git で管理し、別マシンでも同じリビジョンを入れる）
- EditorConfig は Neovim の組み込み機能で読み込まれる（プラグイン不要）

## プラグイン（vim.pack）
- `ibhagwan/fzf-lua`: ピッカー（`fzf` と `fd` を使用）
- `nvim-tree/nvim-web-devicons`: アイコン

追加は `init.lua` の `vim.pack.add({...})` に URL を足して再起動（`:restart`）するだけ。
更新は `:lua vim.pack.update()` を実行し、差分を確認してから `:write` で確定する（`:quit` で取り消し）。

## キーマップ
- `;` と `:` を入れ替え
- `<Esc><Esc>`: 検索ハイライトを消す
- `<C-n>` / `<C-p>`: 次 / 前のバッファ
- `<Space>n` / `<Space>m`: ウィンドウ幅を 10 狭める / 広げる
- `<C-f>`: 現在のバッファのディレクトリ以下でファイル検索、`<C-b>`: バッファ一覧
  - ピッカー内: `<C-j>` 横分割、`<C-l>` 縦分割、`<Esc>` 閉じる
