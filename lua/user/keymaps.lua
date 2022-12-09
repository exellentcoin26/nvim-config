local opts = { noremap = true, silent = true } -- 'noremap' is no recurse map, silent shows output with the keymap

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal
-- Disable arrow keys to force home row use
keymap("n", "<up>", "<nop>", opts)
keymap("n", "<down>", "<nop>", opts)
keymap("n", "<left>", "<nop>", opts)
keymap("n", "<right>", "<nop>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- move between windows using the 'ctrl' as initiator and not 'ctrl + w'
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- open NvimTree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- open Glow
keymap("n", "gt", "<cmd>Glow<CR>", { noremap = true, silent = true })

-- open Aerial
keymap('n', '<leader>q', '<cmd>AerialToggle!<CR>')

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers initial_mode=normal<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<esc>", opts)

-- Visual --
-- Disable arrow keys to force home row use
keymap("v", "<up>", "<nop>", opts)
keymap("v", "<down>", "<nop>", opts)
keymap("v", "<left>", "<nop>", opts)
keymap("v", "<right>", "<nop>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<cr>==", opts)
keymap("v", "<A-k>", "<cmd>m .-2<cr>==", opts)

-- hold on to the last text you copied
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", "<cmd>move '>+1<cr>gv-gv", opts)
keymap("x", "K", "<cmd>move '<-2<cr>gv-gv", opts)
keymap("x", "<A-j>", "<cmd>move '>+1<cr>gv-gv", opts)
keymap("x", "<A-k>", "<cmd>move '<-2<cr>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
