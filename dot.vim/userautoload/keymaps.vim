set backspace=indent,eol,start

nmap ZZ <Nop>
nmap ZQ <Nop>
nmap Q  <Nop>
nmap K  <Nop>

imap <C-n> <Down>
imap <C-p> <Up>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Esc>^i
imap <C-e> <Esc>$a
imap <C-d> <Del>
imap <C-k> <Esc>ld$a

nmap ; :

nmap <C-w>c :tabnew<CR>
nmap <C-w>n gt
nmap <C-w>p gT
