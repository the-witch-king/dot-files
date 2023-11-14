-- LSP Zero setup
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
--
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.set_preferences({
	set_lsp_keymaps = {
		-- Some of the defaults are silly
		omit = {
			"<F2>",
			"<C-k>",
		},
	},
})

-- Configures Pyright to use Poetry virtual environment instead of global
lsp.configure("pyright", {
	on_new_config = function(config, root_dir)
		local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
		if string.len(env) > 0 then
			config.settings.python.pythonPath = env .. "/bin/python"
		end
	end,
})

lsp.nvim_workspace() -- (Optional) Configure lua language server for neovim
lsp.setup()

-- Don't use TSServer for formatting
vim.lsp.buf.format({
	filter = function(client)
		return client.name ~= "tsserver"
	end,
})

-- null-ls
-- This is used to hook up formatters & linters and such
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})
local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
		---
		-- you can add other stuff here....
		---
	end,
	sources = {
		-- diagnostics.eslint,
		formatting.prettier.with({
			prefer_local = "node_modules/.bin",
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
			},
		}),
		formatting.stylua,

		formatting.ruff,
	},
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	ensure_installed = {
		-- Python
		"ruff",

		-- TS/JS
		"eslint",
		"prettier",
	},
	automatic_installation = true,
	automatic_setup = true,
})
