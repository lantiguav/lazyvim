-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }

    -- disable a keymap
    keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    keys[#keys + 1] = { "H", vim.lsp.buf.hover }

    -- Don't show diagnistics for .env files
    local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
    opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
      handlers = {
        ["textDocument/publishDiagnostics"] = function(err, res, ...)
          local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
          if string.match(file_name, "^%.env") == nil then
            return on_publish_diagnostics(err, res, ...)
          end
        end,
      },
    })
  end,
}
