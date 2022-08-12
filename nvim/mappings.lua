-- lua/custom/mappings 
local M = {}

-- add this table only when you want to disable default keys
M.disabled = { }

M.my_namespace = {
  n = {
   ["<leader>we"] = { ":vsplit<cr>", "vertical split" },
   ["<leader>wo"] = { ":split<cr>", "vertical split" }
  },
}

M.nvimtree = {
   n = { },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>"}
  }
}

return M
