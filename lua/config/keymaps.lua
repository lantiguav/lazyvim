-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>gd", function()
  Util.float_term(
    { "lazydocker", "-f", Util.get_root() .. "docker-compose.yml" },
    { cwd = Util.get_root(), esc_esc = false }
  )
end, { desc = "LazyDocker (root dir)" })

map("i", "jk", "<Esc>")
map("n", "J", "5j", { desc = "Move 5 lines down" })
map("n", "K", "5k", { desc = "Move 5 lines up" })
map("n", "<leader>j", "J", { desc = "Join lines" })
-- map("n", "<leader>k", "K")

map("n", "<leader>bw", ":w<enter>", { desc = "Write Buffer (Save)" })
map("n", "<leader>W", ":w<enter>", { desc = "Write Buffer (Save)" })
-- map("n", "<leader>w<leader>", ":w<enter>", { desc = "Write Buffer (Save)" })
-- map("n", "<leader>w", ":w<enter>", { desc = "Write Buffer (Save)" })
