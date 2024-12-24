-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

-- Hey! put lazypath in runtimepath
vim.opt.runtimepath:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require "config.set"
require "config.remap"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			{
				"neanias/everforest-nvim",
			},
			{
				"folke/tokyonight.nvim",
			},
			{ "rose-pine/neovim", name = "rose-pine" },
			{
				"rebelot/kanagawa.nvim",
				opts = {
					colors = {
						theme = {
							all = {
								ui = {
									bg_gutter = "none"
								}
							}
						}
					}
				}
			}
		},
		-- import your plugins
		{ import = "config.plugins" },
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
})
