local M = {}
local wk = require("which-key")

-- Make navigating between splits more ergonomic
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- And resizing splits
vim.keymap.set('n', '<M-h>', '<C-w><')
vim.keymap.set('n', '<M-j>', '<C-w>+')
vim.keymap.set('n', '<M-k>', '<C-w>-')
vim.keymap.set('n', '<M-l>', '<C-w>>')

-- Center the cursor when scrolling through pages
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Move text up and down
-- Visual --
vim.keymap.set("v", "<A-j>", ":m .+1<cr>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m .-2<cr>==", { noremap = true, silent = true })
-- Visual Block --
vim.keymap.set("x", "<A-j>", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })

-- Put and delete without saving text
vim.keymap.set("v", "<leader>p", "\"_dP", { silent = true })
vim.keymap.set("v", "<leader>d", "\"_d", { silent = true })

-- Auto indent the whole file
vim.keymap.set("n", "<leader>=", "gg=G<C-o>", { noremap = true, silent = true })

-- Keymap for inc-rename.nvim, doesn't work natively with which_key
vim.keymap.set("n", "<leader>lr", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- (Basically) How fast which_key opens
vim.o.timeoutlen = 750

----- KEYBINDINGS -----
wk.register({
  ['<tab>'] = { "<cmd>bnext<cr>", "Next buffer" },
  ['<s-tab>'] = { "<cmd>bprev<cr>", "Previous buffer" },
  ["<leader>"] = {
    [';'] = { "<cmd>Alpha<cr>", "Alpha" },
    ['='] = { "Auto indent file" },
    c = { "<cmd>bd<cr>", "Close buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "File explorer" },
    h = { "<cmd>nohlsearch<cr>", "No highlight" },
    j = { "<cmd>tabnext<cr>", "Next tab" },
    k = { "<cmd>tabprev<cr>", "Previous tab" },
    p = { "<cmd>ProjectRoot<cr>", "CD to project root" },
    w = { "<cmd>write<cr>", "Write" },
    q = { "<cmd>quitall<cr>", "Quit all" },
    z = { "<cmd>ZenMode<cr>", "Zen mode" },
    C = { "<cmd>bd!<cr>", "Force close buffer" },
    D = { "<cmd>DiffOrig<cr>", "Diff changes in file" },
    Q = { "<cmd>quitall!<cr>", "Quit all without saving" },
    W = { "<cmd>set eventignore+=BufWritePre | w | set eventignore-=BufWritePre<cr>", "Write without formatting" },
    b = {
      name = "Buffers",
      b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
      e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close", },
      f = { "<cmd>Telescope buffers <cr>", "Find" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right", },
      n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
      p = { "<cmd>BufferLineTogglePin<cr>", "Toggle Pin" },
      s = { "<cmd>BufferLinePick<cr>", "Leap" },
      D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory", },
      L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language", },
    },
    d = {
      name = "Debug",
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get session" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
      p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle REPL" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
      C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to cursor" },
      U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    },
    f = {
      name = "Find",
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer text" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      f = { "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", "File" },
      g = { "<cmd>Telescope live_grep<cr>", "Text" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      l = { "<cmd>Telescope resume<cr>", "Resume last search" },
      m = { "<cmd>Telescope media_files<cr>", "Media files" },
      p = { "<cmd>Telescope git_files<cr>", "Project files", },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
      t = { "<cmd>Telescope<cr>", "Telescope" },
      u = { "<cmd>Telescope undo<cr>", "Undo tree" },
      H = { "<cmd>Telescope highlights<cr>", "Highlight groups" },
      M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
      P = { "<cmd>Telescope projects<cr>", "Projects" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      T = { "<cmd>TodoTelescope<cr>", "Todo comments" },
    },
    g = {
      name = "Git",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git diff", },
      j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset hunk" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo stage hunk", },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit for current file", },
      D = { "<cmd>Gitsigns toggle_word_diff<cr>", "Toggle word diff" },
      L = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle line blame", },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset buffer" },
      f = {
        name = "Find",
        b = { "<cmd>Telescope git_bcommits<cr>", "Commits for buffer" },
        c = { "<cmd>Telescope git_commits<cr>", "Commits" },
        f = { "<cmd>Telescope git_status<cr>", "Changed files" },
        s = { "<cmd>Telescope git_stash<cr>", "Stash" },
        B = { "<cmd>Telescope git_branches<cr>", "Branches" },
      },
      m = {
        name = "Merge Conflicts",
        ["0"] = { "<plug>(git-conflict-none)", "Choose neither" },
        b = { "<plug>(git-conflict-both)", "Choose both" },
        j = { "<plug>(git-conflict-next-conflict)", "Go to next conflict" },
        k = { "<plug>(git-conflict-prev-conflict)", "Go to previous conflict" },
        o = { "<plug>(git-conflict-ours)", "Choose ours (local)" },
        t = { "<plug>(git-conflict-theirs)", "Choose ours (remote)" },
      }
    },
    r = {
      name = "Run Code Snippet",
      c = { "<cmd>SnipClose<cr>", "Close SnipRun output" },
      i = { "<cmd>SnipInfo<cr>", "SnipRun info" },
      l = { "<cmd>SnipRun<cr>", "Run current line" },
      r = { "<plug>SnipRunOperator", "Run snippet" },
      R = { "<cmd>SnipReset<cr>", "Reset SnipRun" },
    },
  }
})

----- VISUAL MODE BINDINGS ------
wk.register({
  ["<leader>"] = {
    d = { "Delete without yanking" },
    p = { "Paste over without yanking" },
    r = { "Run selected code" },
  },
}, { mode = "v" })
-- Doesn't work directly with which-key, in any way I can figure out
vim.keymap.set("v", "<leader>r", ":'<,'>SnipRun<cr>", { noremap = true, silent = true })

----- BUFFER SPECIFIC BINDINGS -----
-- Set up LSP Keybindings
function M.lsp_keybindings(bufnr)
  wk.register({
    g = {
      d = { "<cmd>Telescope lsp_definitions bufnr=0 theme=get_ivy<cr>", "Go to definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
      i = { "<cmd>Telescope lsp_implementations bufnr=0 theme=get_ivy<cr>", "List implementations" },
      r = { "<cmd>Telescope lsp_references bufnr=0 theme=get_ivy<cr>", "List references" },
    },
    ["<leader>"] = {
      a = { function() require("actions-preview").code_actions() end, "Code actions" },
      l = {
        name = "LSP",
        a = { function() require("actions-preview").code_actions() end, "Code action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer diagnostics" },
        e = { "<cmd>Telescope quickfix bufnr=0 theme=get_ivy<cr>", "Telescope quickfix" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic", },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic", },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens action" },
        r = { "Rename" },
        t = { "<cmd>Telescope lsp_type_definitions bufnr=0 theme=get_ivy<cr>" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
        w = {
          name = "Workspace",
          a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
          d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
          l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List workspace folders" },
          r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
          s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols", },
        },
        D = {
          function()
            if vim.diagnostic.is_enabled(bufnr) then
              vim.diagnostic.enable(false, bufnr)
            else
              vim.diagnostic.enable(bufnr)
            end
          end,
          "Toggle diagnostics",
        },
        I = { "<cmd>NullLsInfo<cr>", "Null-LS info" },
        K = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics float" },
      },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- C/C++ keybindings
function M.clangd_keybindings(bufnr)
  wk.register({
    ["<localleader>"] = {
      s = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch to source/header" },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Cargo.toml keybindings
function M.crate_keybindings(bufnr)
  wk.register({
    ["<localleader>"] = {
      r = { "<cmd>lua require'crates'.open_repository()<cr>", "Open repository" },
      p = { "<cmd>lua require'crates'.show_popup()<cr>", "Show popup" },
      c = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "Show info" },
      f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "Show features" },
      d = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "Show dependencies" },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Rust keybindings
function M.rust_keybindings(bufnr)
  wk.register({
    K = { "<cmd>lua require('rust-tools').hover_actions.hover_actions", "Rust Hover" },
    ["<localleader>"] = {
      name = "Rust",
      a = { "<cmd>RustLsp hover action<cr>", "Code action group" },
      c = { "<cmd>RustLsp openCargo<cr>", "Open cargo.toml" },
      f = { "<cmd>RustLsp flyCheck<cr>", "Fly check/clippy" },
      h = { "<cmd>RustLsp hover range<cr>", "Code action group" },
      j = { "<cmd>RustLsp moveItem down<cr>", "Move item up" },
      k = { "<cmd>RustLsp moveItem up<cr>", "Move item down" },
      m = { "<cmd>RustLsp expandMacro<cr>", "Expand macro" },
      p = { "<cmd>RustLsp parentModule<cr>", "Parent module" },
      r = { "<cmd>RustLsp runnables<cr>", "Runnables" },
      s = { "<cmd>RustLsp syntaxTree<cr>", "View syntax tree" },
      v = { "<cmd>RustLsp crateGraph<cr>", "Create graph" },
    },
  }, { buffer = bufnr, mode = "n" })
end

-- Markdown keybinds
function M.markdown_keybindings(bufnr)
  wk.register({
    ["<localleader>"] = {
      p = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle preview" },
    }
  }, { buffer = bufnr, mode = "n" })
end

-- TeX keybinds
function M.tex_keybindings(bufnr)
  wk.register({
    ["<localleader>"] = {
      p = { "<cmd>lua require('nabla').popup()<cr>", "Preview LaTeX popup" },
      d = { "<cmd>lua require('nabla').disable_virt()<cr>", "Disable LaTeX preview for buffer" },
      e = { "<cmd>lua require('nabla').enable_virt()<cr>", "Enable LaTeX preview for buffer" },
      t = { "<cmd>lua require('nabla').toggle_virt()<cr>", "Toggle LaTeX preview for buffer" },
    },
  }, { buffer = bufnr, mode = "n" })
end

return M
