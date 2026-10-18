return {
	"inhesrom/remote-ssh.nvim",
	branch = "master",
	dependencies = {
		"inhesrom/telescope-remote-buffer",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("telescope-remote-buffer").setup()

		local capabilities = {}
		local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
		if ok then
			capabilities = cmp_lsp.default_capabilities()
		else
			capabilities = vim.lsp.protocol.make_client_capabilities()
		end

		require("remote-ssh").setup({
			capabilities = capabilities,
			filetype_to_server = {
				python = "pyright",
				lua = "lua_ls",
				c = "clangd",
				cpp = "clangd",
				javascript = "vtsls",
				typescript = "vtsls",
				vue = "vue_ls",
				go = "gopls",
			},
			async_write_opts = {
				autosave = true,
				save_debounce_ms = 3000,
			},
		})

		-- Helper to resolve paths to remote rsync URIs (defaults to host: regina)
		local function resolve_regina_path(raw_path, is_dir)
			if not raw_path or raw_path == "" then
				return is_dir and "rsync://regina//home/regina/" or "rsync://regina//home/regina"
			end

			-- Already an rsync/scp protocol URI
			if raw_path:match("^rsync://") or raw_path:match("^scp://") then
				return raw_path
			end

			-- Handle host:path syntax (e.g. regina:~/.zshrc or customhost:/path)
			local explicit_host, host_path = raw_path:match("^([^:/]+):(.*)$")
			if explicit_host and host_path then
				if explicit_host == "regina" then
					if host_path == "~" or host_path == "~/" then
						host_path = "/home/regina"
					elseif host_path:match("^~/(.*)$") then
						host_path = "/home/regina/" .. host_path:match("^~/(.*)$")
					end
				end
				if not host_path:match("^/") then
					host_path = "/" .. host_path
				end
				return string.format("rsync://%s/%s", explicit_host, host_path)
			end

			-- Default to host 'regina' (user: regina, home: /home/regina)
			local path = raw_path
			if path == "~" or path == "~/" then
				path = "/home/regina"
			elseif path:match("^~/(.*)$") then
				path = "/home/regina/" .. path:match("^~/(.*)$")
			elseif not path:match("^/") then
				path = "/home/regina/" .. path
			end

			-- Clean up repeated slashes
			path = path:gsub("/+", "/")

			if is_dir and not path:match("/$") then
				path = path .. "/"
			end

			-- Double slash format (rsync://regina//path) ensures remote absolute path
			return "rsync://regina/" .. path
		end

		-- =========================================================================
		-- File Opening Commands (:RO ~/.zshrc, :REdit, :ReginaOpen)
		-- =========================================================================
		vim.api.nvim_create_user_command("RO", function(opts)
			local url = resolve_regina_path(opts.args, false)
			vim.cmd("RemoteOpen " .. url)
		end, { nargs = "+", complete = "file", desc = "Open remote file on Regina by path (e.g. :RO ~/.zshrc)" })

		vim.api.nvim_create_user_command("ReginaOpen", function(opts)
			local url = resolve_regina_path(opts.args, false)
			vim.cmd("RemoteOpen " .. url)
		end, { nargs = "+", complete = "file", desc = "Open remote file on Regina" })

		vim.api.nvim_create_user_command("REdit", function(opts)
			local url = resolve_regina_path(opts.args, false)
			vim.cmd("RemoteOpen " .. url)
		end, { nargs = "+", complete = "file", desc = "Edit remote file on Regina" })

		-- =========================================================================
		-- Tree Browser Commands (:RT, :Regina, :ReginaTree, :RSCE, :RVault)
		-- =========================================================================
		vim.api.nvim_create_user_command("RT", function(opts)
			local url = resolve_regina_path(opts.args, true)
			vim.cmd("RemoteTreeBrowser " .. url)
		end, { nargs = "?", complete = "file", desc = "Open remote tree browser on Regina" })

		vim.api.nvim_create_user_command("Regina", function(opts)
			local url = resolve_regina_path(opts.args, true)
			vim.cmd("RemoteTreeBrowser " .. url)
		end, { nargs = "?", complete = "file", desc = "Browse Regina directory (defaults to /home/regina/)" })

		vim.api.nvim_create_user_command("ReginaTree", function(opts)
			local url = resolve_regina_path(opts.args, true)
			vim.cmd("RemoteTreeBrowser " .. url)
		end, { nargs = "?", complete = "file", desc = "Alias for :Regina" })

		vim.api.nvim_create_user_command("ReginaSCE", function()
			vim.cmd("RemoteTreeBrowser rsync://regina//home/regina/Documents/Spatial\\ Compute\\ Engine/")
		end, { desc = "Browse Regina Spatial Compute Engine repository" })

		vim.api.nvim_create_user_command("RSCE", function()
			vim.cmd("RemoteTreeBrowser rsync://regina//home/regina/Documents/Spatial\\ Compute\\ Engine/")
		end, { desc = "Alias for :ReginaSCE" })

		vim.api.nvim_create_user_command("ReginaVault", function()
			vim.cmd("RemoteTreeBrowser rsync://regina//home/regina/ks-obsidian-vault/")
		end, { desc = "Browse Regina Obsidian Vault" })

		vim.api.nvim_create_user_command("RVault", function()
			vim.cmd("RemoteTreeBrowser rsync://regina//home/regina/ks-obsidian-vault/")
		end, { desc = "Alias for :ReginaVault" })

		-- =========================================================================
		-- Session & Utility Commands (:RS, :RSP, :RSM, :RTerm, :RTui, :RLog)
		-- =========================================================================
		vim.api.nvim_create_user_command("RS", function(opts)
			local url = resolve_regina_path(opts.args, true)
			vim.cmd("RemoteSession " .. url)
		end, { nargs = "?", complete = "file", desc = "Start or attach remote session on Regina" })

		vim.api.nvim_create_user_command("ReginaSession", function(opts)
			local url = resolve_regina_path(opts.args, true)
			vim.cmd("RemoteSession " .. url)
		end, { nargs = "?", complete = "file", desc = "Alias for :RS" })

		vim.api.nvim_create_user_command("RSP", function()
			vim.cmd("RemoteSessionPicker")
		end, { desc = "Pick or switch active/minimized remote sessions" })

		vim.api.nvim_create_user_command("RSM", function()
			vim.cmd("RemoteSessionMinimize")
		end, { desc = "Minimize current remote session" })

		vim.api.nvim_create_user_command("RTerm", function()
			vim.cmd("RemoteTerminalNew")
		end, { desc = "Open remote terminal to Regina" })

		vim.api.nvim_create_user_command("ReginaTerm", function()
			vim.cmd("RemoteTerminalNew")
		end, { desc = "Alias for :RTerm" })

		vim.api.nvim_create_user_command("RTui", function(opts)
			vim.cmd("RemoteTui " .. opts.args)
		end, { nargs = "*", desc = "Run TUI app on Regina (e.g. :RTui htop)" })

		vim.api.nvim_create_user_command("ReginaTui", function(opts)
			vim.cmd("RemoteTui " .. opts.args)
		end, { nargs = "*", desc = "Alias for :RTui" })

		vim.api.nvim_create_user_command("RLog", function()
			vim.cmd("RemoteLog")
		end, { desc = "Open remote-ssh log viewer" })

		-- =========================================================================
		-- Key Mappings
		-- =========================================================================
		local map = vim.keymap.set
		map("n", "<leader>ro", ":RO ", { desc = "Remote: Open file by path (:RO )" })
		map("n", "<leader>rr", "<cmd>Regina<CR>", { desc = "Remote: Browse Regina Home" })
		map("n", "<leader>rc", "<cmd>RSCE<CR>", { desc = "Remote: Browse Regina SCE" })
		map("n", "<leader>rv", "<cmd>RVault<CR>", { desc = "Remote: Browse Regina Vault" })
		map("n", "<leader>rs", "<cmd>RSP<CR>", { desc = "Remote: Session Picker" })
		map("n", "<leader>rt", "<cmd>RTerm<CR>", { desc = "Remote: New Terminal" })
		map("n", "<leader>rm", "<cmd>RSM<CR>", { desc = "Remote: Minimize Session" })
		map("n", "<leader>rl", "<cmd>RLog<CR>", { desc = "Remote: Open Log" })
	end,
}
