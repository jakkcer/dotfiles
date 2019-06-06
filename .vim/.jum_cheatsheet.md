# jumpei(s vim cheatsheet

## vim

### key setting
- `<leader>` : `\<Space>`

### move


### plugins

#### vim-cheatsheet
- `:Cheat` : vim-cheatsheetを開く

#### jedi-vim
____pythonの補完_
- `<Ctrl-Space>` : 補完開始
- `<leader>d`    : 定義に移動
- `<leader>g`    : 使用箇所に移動
- `<leader>r`    : 変数リネーム
- `<leader>n`    : 使用箇所表示

#### git-fugitive
_gitの操作をvim上で_
- `<leader>gb` : `git blame` (誰の変更か)
- `<leader>gd` : `git diff`
- `<leader>gs` : `git status`
- `<leader>gw` : `git add`
- `<leader>gc` : `git commit -v`
- `<leader>gr` : `git checkout FILE` (変更取り消し)

#### git-gutter
_gitの差分表示_
- `<Ctrl-h>j`        : 次のhunkへ
- `<Ctrl-h>k`        : 前のhunkへ
- `<leader>hs`       : 変更をstage
- `<leader>hu`       : 変更をunstage
- `<leader>hp`       : 変更をプレビュー
- `:GitGutterToggle` : git-gutterの表示切り替え

#### ale
_自動syntaxチェッカー_
- `<Ctrl-j>` : 前のエラーへ
- `<Ctrl-k>` : 次のエラーへ

#### tcomment_vim
_コメントアウト切り替え_
- `<Shift>V` で選択後`<Ctrl--->` : コメントアウト切り替え

#### nerdtree
_ファイル構造のツリービュー_
- `<Ctrl-n>` : NERDTreeを開く
- `o`,`<CR>` : ファイルを開く
- `go`       : ファイルを開き、カーソルはツリー状に保持
- `t`        : タブで開く
- `T`        : タブで開き、移動はしない
- `i`        : 水平分割して開く
- `gi`       : 水平分割して開き、移動はしない
- `s`        : 垂直分割して開く
- `gs`       : 垂直分割して開き、移動はしない
- `O`        : ディレクトリを全て展開
- `x`        : 親ディレクトリを閉じる
- `X`        : 再帰的に親ディレクトリを閉じる
- `e`        : 新しいツリーを生成
- `P`        : ルートディレクトリへ移動
- `p`        : 親ディレクトリへ移動
- `K`        : 一番上へ移動
- `J`        : 一番下へ移動
- `<Ctrl-k>` : 一つ上へ移動
- `<Ctrl-j>` : 一つ下へ移動
- `C`        : ツリーのルートを選択したディレクトリに変更
- `u`        : ツリーのルートを上の階層にする
- `U`        : 変更前のツリーの状態を保存してツリーのルートを上の階層にする
- `r`        : ディレクトリをリフレッシュ
- `R`        : ツリーのルートをリフレッシュ
- `m`        : メニューを表示
- `cd`       : 選択したディレクトリをcwdにする
- `CD`       : ツリールートをcwdにする
- `I`        : 隠しファイルの表示切り替え
- `B`        : ブックマークの表示切り替え
- `F`        : ファイルの表示切り替え

#### vim-surround
_括弧などの囲うものを扱う_
`t`を使うとHTMLタグを扱える
- `ds(`   : 文を囲んでいる()を消す
- `di(`   : ()で囲まれた部分を消す
- `cs("`  : ()を"に変更
- `ci(`   : ()で囲まれた部分を消してインサートモードに
- `S(`    : ビジュアルモードで選択した部分を()で囲む
- `yss(`  : 文を()で囲む
- `ysiw(` : カーソルがある単語を()で囲む

#### vim-over
_置換時のハイライト_
- `<leader>//`  : 置換候補をハイライトしながら置換
- `<leader>sub` : カーソル下の単語を置換



