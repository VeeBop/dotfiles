local M = {}

function M.setup()
  local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", function()
      api.node.open.edit()
      api.tree.focus()
    end, opts("Open Without Focus"))
    vim.keymap.set("n", "<CR>", function()
      api.node.open.edit()
      api.tree.close()
    end, opts("Open and Close Tree"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
  end

  require("nvim-tree").setup {
    on_attach = my_on_attach,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true
    },
  }
end

return M
