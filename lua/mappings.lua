-- Global
vim.keymap.set('n', '<A-Down>', ':m +1<CR>==', { silent = true })
vim.keymap.set('n', '<A-Up>', ':m -2<CR>==', { silent = true })
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { silent = true })

-- Leaderf

vim.keymap.set('n', '<C-P>', ':LeaderfFile<CR>', { silent = true })
vim.keymap.set('n', '<C-S-P>', ':LeaderfCommand<CR>', { silent = true })
vim.keymap.set('n', '<C-E>', ':LeaderfBuffer<CR>', { silent = true })
vim.keymap.set('n', '<M-e>', ':LeaderfBuffer<CR>', { silent = true })
vim.keymap.set('n', '<D-e>', ':LeaderfBuffer<CR>', { silent = true })
vim.keymap.set('n', '<C-S-E>', ':LeaderfMru<CR>', { silent = true })
vim.keymap.set('n', '<M-E>', ':LeaderfMru<CR>', { silent = true })
vim.keymap.set('n', '<D-E>', ':LeaderfMru<CR>', { silent = true })

-- NERDTree
vim.keymap.set('', '<F2>', ':NERDTreeToggle<CR>', { silent = true })

-- Floaterm
vim.keymap.set('n', '<C-`>', ':ToggleTerm<CR>', { silent = true })
vim.keymap.set('t', '<C-`>', '<C-\\><C-n>:ToggleTerm<CR>', { silent = true })

-- Coc
vim.keymap.set('', '<F3>', ':CocDiagnostics<CR>', { silent = true })


-- Local history
vim.keymap.set('', '<F4>', ':LocalHistoryToggle<CR>', { silent = true })


vim.keymap.set('', '<ESC><ESC>', ':NERDTreeClose<CR> :AgsQuit<CR> :lcl<CR>', { silent = true })
vim.keymap.set('', '<F1>', ':NERDTreeFocus<CR>', { silent = true})

vim.keymap.set('n', 'gv', ':TermExec direction=float cmd="vd %; exit;"<CR>', { silent = true })

vim.keymap.set('n', '<D-v>', '"*p', { silent = true })
vim.keymap.set('i', '<D-v>', '<Esc>"*pa', { silent = true })
