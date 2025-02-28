return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      backdrop = 1,
      width = function() return math.min(120, vim.o.columns * 0.75) end,
      height = 0.9,
      options = {
        number = false,
        relativenumber = false,
        foldcolumn = "0",
        list = false,
        showbreak = "NONE",
        signcolumn = "no",
      },
    },
    plugins = {
      options = {
        cmdheight = 1,
        laststatus = 0,
      },
    },
    on_open = function() -- disable diagnostics, indent blankline, and winbar
      vim.g.diagnostics_mode_old = vim.g.diagnostics_mode
      vim.g.indent_blankline_enabled_old = vim.g.indent_blankline_enabled
      vim.g.winbar_old = vim.wo.winbar
      vim.g.diagnostics_mode = 0
      vim.g.indent_blankline_enabled = false
      vim.b.miniindentscope_disable = true
      vim.wo.winbar = nil
      vim.diagnostic.config(require("astronvim.utils.lsp").diagnostics[vim.g.diagnostics_mode])
    end,
    on_close = function() -- restore diagnostics, indent blankline, and winbar
      vim.g.diagnostics_mode = vim.g.diagnostics_mode_old
      vim.g.indent_blankline_enabled = vim.g.indent_blankline_enabled_old
      vim.b.miniindentscope_disable = false
      vim.wo.winbar = vim.g.winbar_old
      vim.diagnostic.config(require("astronvim.utils.lsp").diagnostics[vim.g.diagnostics_mode])
      if vim.g.indent_blankline_enabled_old then vim.cmd "IndentBlanklineRefresh" end
    end,
  },
}
