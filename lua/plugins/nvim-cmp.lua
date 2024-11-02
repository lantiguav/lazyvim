return {
  "nvim-cmp",
  dependencies = { "lukas-reineke/cmp-under-comparator" },
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

    -- TODO: Figure out how to show custom snippets first
    opts.sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        require("cmp-under-comparator").under,
        cmp.config.compare.kind,
      },
    }
    cmp.setup(opts)
  end,
}
