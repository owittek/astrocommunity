return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "mrjones2014/nvim-ts-rainbow",
    init = function()
      require("astronvim.utils").notify(
        "`nvim-ts-rainbow` is deprecated!\nPlease use `rainbow-delimiters`",
        vim.log.levels.WARN
      )
    end,
    config = function()
      -- HACK: https://github.com/p00f/nvim-ts-rainbow/issues/112#issuecomment-1310835936
      vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
        callback = function()
          vim.cmd "TSDisable rainbow"
          vim.cmd "TSEnable rainbow"
        end,
      })
    end,
  },
  opts = { rainbow = { enable = true } },
}
