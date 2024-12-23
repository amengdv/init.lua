return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp"
		},
		config = function()
			require("mason").setup {}
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls" }
			}

			local capabilities = require('blink.cmp').get_lsp_capabilities()
			require("mason-lspconfig").setup_handlers {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup { capabilities = capabilities }
				end,
			}
		end
	}
}
