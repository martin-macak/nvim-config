vim.cmd[[highlight GitGutterAdd    guifg=#009900 ctermfg=2]]
vim.cmd[[highlight GitGutterChange guifg=#bbbb00 ctermfg=3]]
vim.cmd[[highlight GitGutterDelete guifg=#ff2222 ctermfg=1]]

vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)')
vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)')
vim.keymap.set('n', 'ghs', '<Plug>(GitGutterStageHunk)')
vim.keymap.set('n', 'ghu', '<Plug>(GitGutterUndoHunk)')
vim.keymap.set('n', 'ghp', '<Plug>(GitGutterPreviewHunk)')
