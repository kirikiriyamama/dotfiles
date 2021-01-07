" Mirror the NERDTree before showing it. This makes it the same on all tabs.
function! s:toggle()
  if !g:NERDTree.IsOpen()
    NERDTreeMirror
    " In some cases, NERDTree is opend by NERDTreeMirror above
    if !g:NERDTree.IsOpen()
      NERDTreeToggle
    endif
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <Space>e :call <SID>toggle()<CR>

" Exit Vim if NERDTree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1

let g:NERDTreeMapOpenSplit="s"
let g:NERDTreeMapPreviewSplit="gs"
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapPreviewVSplit="gv"

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
