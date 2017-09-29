nnoremap <silent> <Space>e :NERDTreeToggle<CR>

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
\    'Modified'  : 'M',
\    'Staged'    : '✚',
\    'Untracked' : '?',
\    'Renamed'   : 'R',
\    'Unmerged'  : 'U',
\    'Deleted'   : 'D',
\    'Dirty'     : '✗',
\    "Clean"     : '✔︎',
\    'Unknown'   : ''
\  }
