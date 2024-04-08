require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- basic
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "Exit insert mode" })
map({ "i", "n", "v" }, "<C-q>", "<cmd>:wa | qall<CR>", { desc = "Save all and exit" })

-- nvimtree
map("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>tf", "<cmd>NvimTreeFindFile<CR>", { desc = "Nvimtree Focus window" })
map("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { desc = "Nvimtree Collapse folder" })

--telescope git commands
