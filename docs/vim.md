# Vim/Neovim

Neovim を前提に、最小で高速なプラグイン構成とモダンなデフォルトを採用しています。

## 構成
- `nvim/init.vim`: サブ設定を読み込み
  - `nvim/vimrc.dein`: プラグインマネージャ（dein、`stdpath('data')/dein` を使用）
  - `nvim/vimrc.colors`: カラースキームと Truecolor
  - `nvim/vimrc.basic`: 基本オプションとキーマップ
  - `nvim/vimrc.telescope`: ピッカーの設定とキーバインド
- `.editorconfig`: 多数の filetype ごとの autocmd を置き換え

## プラグイン（dein）
- コア: `nvim-telescope/telescope.nvim`, `nvim-lua/plenary.nvim`
- UI: `nvim-tree/nvim-web-devicons`, `jacoborus/tender.vim`
- 高速化: `nvim-telescope/telescope-fzf-native.nvim`（`make` でビルド）
- 編集: `editorconfig/editorconfig-vim`

インストール/更新:
- Neovim 内で一度 `:call dein#install()`、以降は `:call dein#update()`
- プラグインリポジトリはこのレポ内に保持しません（dein のデータディレクトリを使用）。

## キーバインド
- バッファ一覧: `<C-b>`（Telescope）
- 現在ファイルのあるディレクトリから検索: `<C-f>`
- Telescope 内: `<C-j>`=分割、`<C-l>`=縦分割、`<Esc><Esc>`=閉じる
- ノーマルモードの調整:
  - `;` と `:` を入れ替え
  - `j/k` は表示行単位で移動（`gj/gk`）
  - `<Space>n` / `<Space>m` でスプリット幅調整

## オプション（軽量化重視）
- 折り畳み: `foldmethod=manual`（syntax 折り畳みは重い）
- クリップボード: `unnamed,unnamedplus`
- バックアップ無効: `nobackup nowritebackup`
- 再描画抑制: `lazyredraw`
- `cmdheight=1`、`autochdir` 無効、`ignorecase+smartcase`

## カラー
- `set termguicolors` と `colorscheme tender`

## 補足
- Live grep: `ripgrep` を入れると `Telescope live_grep` が高速
- 高速ファイル検索: `fd` を入れて Telescope の find コマンドに指定可能
- Python ホスト（任意）: pyenv の `nvim-python3` 仮想環境があれば `init.vim` が検出
