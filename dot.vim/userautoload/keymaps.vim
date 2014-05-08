nmap ZZ <Nop>
nmap ZQ <Nop>
nmap Q <Nop>
nmap K <Nop>

imap <C-n> <Down>
imap <C-p> <Up>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Esc>^i
imap <C-e> <Esc>$a
imap <C-d> <Del>

nmap <C-k> d$a

nmap ; :

" CtrlP
let g:ctrlp_map = '<Space>p'
" ag
nmap <Space>g :Ag<Space>
" git blame
nmap <Space>b :Gblame<CR>
