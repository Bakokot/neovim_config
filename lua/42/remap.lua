-- set mapleader to space
vim.g.mapleader = " "

-- set Explorer to Leader-pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- set Neotree to leader-pt
vim.keymap.set("n", "<leader>pt", vim.cmd.Neotree)

--set quick quit
vim.keymap.set("n", "<leader>pc", vim.cmd.q)

--set quick save
vim.keymap.set("n", "<leader>ps", vim.cmd.w)

-- set new tab and close tab
vim.keymap.set("n", "<leader>tn", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>tc", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>tt", vim.cmd.tabnext)

-- set change from relative number to absolute number
vim.keymap.set("n", "<leader>aa", vim.cmd.set("number"))
vim.keymap.set("n", "<leader>zz", vim.cmd.set("relativenumber"))
