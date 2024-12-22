return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	opts = {
		ensure_install = { "lua_ls", "stylua" },
		auto_install = true,
	},
}
