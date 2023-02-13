-- LSP Zero setup
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
--
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = {
    -- Some of the defaults are silly
    omit = {
      '<F2>',
      '<C-k>'
    }
  }
})

-- Configures Pyright to use Poetry virtual environment instead of global
lsp.configure('pyright', {
  on_new_config = function(config, root_dir)
    local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
    if string.len(env) > 0 then
      config.settings.python.pythonPath = env .. '/bin/python'
    end
  end
})

lsp.nvim_workspace() -- (Optional) Configure lua language server for neovim
lsp.setup()


-- null-ls
-- This is used to hook up formatters & linters and such
local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
    ---
    -- you can add other stuff here....
    ---
  end,
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,
  }
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require('mason-null-ls').setup({
  ensure_installed = {
    -- Python
    'ruff',
    'black',

    -- TS/JS
    'eslint',
    'prettier',
  },
  automatic_installation = true,
  automatic_setup = true,
})

-- Required when `automatic_setup` is true
require('mason-null-ls').setup_handlers()

