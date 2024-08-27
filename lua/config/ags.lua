vim.g.ags_agexe = 'ag'


--vim.cmd([[
--let g:ags_agargs = {
  --\ '--column'         : ['', ''],
  --\ '--line-number'    : ['', ''],
  --\ '--context'        : ['g:ags_agcontext', '-C'],
  --\ '--max-count'      : ['g:ags_agmaxcount', ''],
  --\ '--heading'        : ['',''],
  --\ '--smart-case'     : ['','-S'],
  --\ '--color'          : ['always',''],
  --\ '--colors'         : [['match:fg:green', 'match:bg:black', 'match:style:nobold', 'path:fg:red', 'path:style:bold', 'line:fg:black', 'line:style:bold'] ,''],
  --\ }
--]])


--vim.cmd("nmap <leader>a :Ags<space><C-R>=expand('<cword>')<CR><CR>")
--vim.cmd("vnoremap <Leader>a y:Ags<Space><C-R>='\"' . escape(@\", '\"*?()[]{}.') . '\"'<CR><CR>")
--vim.cmd("nnoremap <Leader>a :Ags<Space>")
--vim.cmd("nnoremap <Leader><Leader>a :AgsQuit<CR>")
