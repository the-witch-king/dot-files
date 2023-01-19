-- LSP Zero setup
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')
-- lsp.configure('tsserver', {
--   single_file_support = false,
--   on_attach = function(client, bufnr)
--     print('hello tsserver')
--   end
-- })

-- Configures Pyright to use Poetry virtual environment instead of global
lsp.configure('pyright', {
  -- capabilities = capabilities,
  -- on_attach = on_attach,
  on_new_config = function(config, root_dir)
    local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
    if string.len(env) > 0 then
      config.settings.python.pythonPath = env .. '/bin/python'
    end
  end
})
lsp.nvim_workspace() -- (Optional) Configure lua language server for neovim
lsp.setup()

