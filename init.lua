require("config.lazy")

-- Blade Tree Sitter
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
---@diagnostic disable-next-line: inject-field
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade.git", -- local path or git repo
		files = { "src/parser.c" },                             -- note that some parsers also require src/scanner.c or src/scanner.cc
		branch = "main",
	},
	filetype = "blade", -- if filetype does not match the parser name
}

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight after yank',
	group = vim.api.nvim_create_augroup('amengdv-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end

		if client:supports_method('textDocument/formatting') then
			-- Format the current buffer on save
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end,
			})
		end
	end,
})


-- "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
-- "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
-- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
-- "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
-- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
-- CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
-- CTRL-W d is mapped to show diagnostic under cursor

function ColorMyPencils(color, transparent)
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)

	if transparent == nil then
		transparent = true
	else
		transparent = transparent
	end

	if transparent then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		local curr_line_nr_hl = vim.api.nvim_get_hl(0, { name = "LineNr", link = false }) or {}
		vim.api.nvim_set_hl(0, "LineNr", {
			bg = "none",
			fg = curr_line_nr_hl.fg
		})
	end
end

ColorMyPencils('gruvbox', false)
