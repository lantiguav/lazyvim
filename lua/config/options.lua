-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

is_empty = function(str)
  return str == nil or str == ""
end
local get_filename = function(path)
  local filename_with_relative_path = vim.fn.substitute(path, vim.fn.getcwd() .. "/", "", "")
  -- print(filename_with_relative_path)
  local filename = filename_with_relative_path:match("([^/]+)$")

  if is_empty(filename) then
    return " %f"
  end

  return filename
end

local filename = get_filename(vim.fn.expand("%"))
vim.opt.winbar = " " .. filename .. " %m %=%l:%v "

-- vim.opt.winbar = "%=%m %f"
