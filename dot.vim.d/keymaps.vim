imap <C-j> <Esc>

imap <C-n> <Down>
imap <C-p> <Up>
imap <C-b> <Left>
imap <C-f> <Right>

imap <C-a> <Esc>^<Insert>
imap <C-e> <Esc>$<Insert><Right>

imap <C-k> <Esc><Right>d$<Insert><Right>
imap <C-d> <Del>

imap { {}<Left>
imap [ []<Left>
imap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

nmap ; :

" switch
nnoremap ! :Switch<CR>