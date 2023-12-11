vim.g.coc_global_extensions = {
  'coc-copilot',
  'coc-eslint',
  'coc-docker',
  'coc-go',
  'coc-json',
  'coc-lists',
  'coc-rust-analyzer',
  'coc-sh',
  'coc-solargraph',
  'coc-styled-components',
  'coc-syntax',
  'coc-tag',
  'coc-tsserver',
  'coc-word',
}

vim.cmd [[
  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by `"suggest.noselect": true` in your configuration file.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd :call JumpDefinition()<CR>
  nmap <silent> gt <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  function JumpDefinition() abort
    let actions = { 'e': 'edit', 's': 'split', 'v': 'vsplit', 't': 'tabedit', "\r": 'edit' }

    echo '(E)dit, (s)plit, (v)split, (t)abedit: '
    let c = getcharstr()
    call feedkeys(':', 'nx') " https://neovim.discourse.group/t/how-to-clear-the-echo-message-in-the-command-line/268

    let action = get(actions, c, 0)
    if empty(action)
      return
    endif

    call CocActionAsync('jumpDefinition', action)
  endfunction

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Mappings for CoCList
  nnoremap <silent><nowait> <space>d  :<C-u>CocDiagnostics<cr>
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  nnoremap <silent><nowait> <space>w  :<C-u>CocList windows<CR>
  nnoremap <silent><nowait> <space>l  :<C-u>CocListResume<CR>
]]

vim.cmd [[
  let s:rubocop_ls_config = { 'rubocop': { 'command': 'bundle', 'args': ['exec', 'rubocop', '--lsp'], 'filetypes': ['ruby'] } }
  autocmd FileType ruby if filereadable(getcwd() . '/.rubocop.yml') | call coc#config('languageserver', s:rubocop_ls_config) | endif
]]

vim.cmd [[
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
]]
