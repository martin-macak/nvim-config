scriptencoding utf-8

" Plugin specification and lua stuff
lua require('mappings')

tnoremap <Esc><Esc> <C-\><C-n>

"nmap <A-j> :m .+1<CR>==
"nmap <A-k> :m .-2<CR>==
"imap <A-j> <Esc>:m .+1<CR>==gi
"imap <A-k> <Esc>:m .-2<CR>==gi
"vmap <A-j> :m '>+1<CR>gv=gv
"vmap <A-k> :m '<-2<CR>gv=gv
