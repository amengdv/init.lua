return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',

	version = 'v0.*',

	opts = {
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 100 },
		},
		sources = {
			cmdline = {}
		},
		signature = { enabled = true }
	},
}
