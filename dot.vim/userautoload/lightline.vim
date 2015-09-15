let g:lightline = {
\   'colorscheme': 'solarized',
\   'active': {
\     'left': [['mode', 'paste'], ['fugitive', 'filename', 'watchdogs']],
\   },
\   'component_function': {
\     'modified':     'LightLineModified',
\     'readonly':     'LightLineReadonly',
\     'fugitive':     'LightLineFugitive',
\     'filename':     'LightLineFilename',
\     'fileformat':   'LightLineFileformat',
\     'filetype':     'LightLineFiletype',
\     'fileencoding': 'LightLineFileencoding',
\     'mode':         'LightLineMode',
\   },
\   'component_expand': {
\     'watchdogs': 'qfstatusline#Update',
\   },
\   'component_type': {
\     'watchdogs': 'error',
\   },
\ }

function! LightLineModified()
  return &ft =~ 'help\|nerdtree\|undotree\|diff\|qf' ? '' : @% == '[YankRing]' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|nerdtree\|undotree\|diff' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return &ft == 'nerdtree' ? 'NERDTree' :
       \ &ft == 'undotree' ? 'undotree' :
       \ &ft == 'diff' ? 'diffpanel' :
       \ &ft == 'qf' ? 'Quickfix' :
       \ &ft == 'vimshell' ? vimshell#get_status_string() :
       \ @% == '[YankRing]' ? 'YankRing' :
       \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != @% ? @% : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'help\|nerdtree\|undotree\|quickrun\|qf' && @% != '[YankRing]' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '  '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return &ft == 'qf' ? '' :
       \ @% == '[YankRing]' ? '' :
       \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:vimshell_force_overwrite_statusline = 0
autocmd CursorMoved ControlP let w:lightline = 0
