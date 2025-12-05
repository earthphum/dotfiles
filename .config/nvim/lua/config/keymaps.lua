local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("i", "jk", "<Esc>", opts)
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>", opts)
map("n", "<leader>h", ":nohlsearch<CR>", opts)

map("n", "<C-a>", "ggVG", opts)
map("i", "<C-a>", "<Esc>ggVG", opts)
map("v", "<C-a>", "<Esc>ggVG", opts)

vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete Word" })

vim.keymap.set("i", "<S-BS>", "<C-u>", { desc = "Delete to Start of Line" })
