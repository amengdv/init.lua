return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	-- or                              , branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		"nvim-telescope/telescope-ui-select.nvim"
	},
	config = function()
		require("telescope").setup {
			extensions = {
				fzf = {}
			}
		}

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		vim.keymap.set('n', '<leader>sw', function()
			require('telescope.builtin').grep_string({
				search = vim.fn.input("Grep > ")
			})
		end)
		vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
		vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
		vim.keymap.set('n', '<leader>sn', function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath("config")
			}
		end)
		vim.keymap.set('n', '<leader>sp', function()
			require('telescope.builtin').find_files {
				---@diagnostic disable-next-line: param-type-mismatch
				cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
			}
		end)
		vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps)
		vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)

		require "config.telescope.multigrep".setup()
	end
}
