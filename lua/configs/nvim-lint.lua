return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      python = { "pylint" },
      javascript = { { "eslint_d", "eslint" } },
      typescript = { { "eslint_d", "eslint" } },
      javascriptreact = { { "eslint_d", "eslint" } },
      typescriptreact = { { "eslint_d", "eslint" } },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Automatically run linters after saving.  Use "InsertLeave" for more aggressive linting.
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
