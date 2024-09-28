return {
  "nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    table.insert(opts.sources, 1, {
      name = "copilot",
      group_index = 2,
      priority = 100,
    })

    -- Disable completion on <CR>. Use <C-y> to confirm
    opts.mapping["<CR>"] = cmp.config.disable
    opts.mapping["<C-y>"] = cmp.mapping.confirm({ select = true })
    cmp.setup(opts)
  end,
}
