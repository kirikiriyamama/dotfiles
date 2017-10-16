let g:lightline = {
\   'colorscheme': 'solarized',
\   'active': {
\     'left': [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified', 'watchdogs']],
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
  return &ft =~ 'help\|nerdtree\|qf' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft != 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  return &ft == 'nerdtree' ? 'NERDTree' : &ft == 'qf' ? 'Quickfix' : ('' != @% ? @% : '[No Name]')
endfunction

function! LightLineFugitive()
  if &ft !~? 'help\|nerdtree\|qf' && exists("*fugitive#head")
    return fugitive#head()
  else
    return ''
  endif
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
  return &modifiable && winwidth(0) > 60 ? lightline#mode() : ''
endfunction

autocmd CursorMoved ControlP let w:lightline = 0
