-- :let g:NERDTreeWinSize=60

vim.g.NERDTreeWinSize=45

vim.keymap.set('n', '<leader>v', ':NERDTreeFind<CR>', { silent = true })

vim.g.NERDTreeQuitOnOpen = 1

--vim.cmd([[autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p]])
vim.cmd([[autocmd BufEnter NERD_tree_* | execute 'normal R']])
