-- built-in comment
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true })
vim.keymap.set("x", "<C-/>", "gc", { remap = true, silent = true })
vim.keymap.set("i", "<C-/>", "<Esc>gcca", { remap = true, silent = true })

-- buffer cycling (mini.tabline)
vim.keymap.set("n", "<leader>,", "<Cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>.", "<Cmd>bnext<CR>", { silent = true, desc = "Next buffer" })

-- terminal mode: window-nav and escape to normal
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { silent = true })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { silent = true })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { silent = true })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n>]], { silent = true })
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { silent = true })

-- after session restore, unlist the leftover empty [No Name] buffer
vim.api.nvim_create_autocmd("User", {
	pattern = "PersistenceLoadPost",
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_valid(buf)
				and vim.api.nvim_buf_get_name(buf) == ""
				and vim.bo[buf].buftype == ""
				and not vim.bo[buf].modified
			then
				local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
				if #lines <= 1 and (lines[1] == nil or lines[1] == "") then
					vim.bo[buf].buflisted = false
				end
			end
		end
	end,
})

-- diagnostics (global, set once)
vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	severity_sort = true,
	float = { border = "rounded" },
})

-- LSP buffer-local keymaps. nvim 0.11 ships built-ins:
-- K (hover), grn (rename), gra (code action), grr (references),
-- gri (implementation), grt (type def), gd (definition via tagfunc).
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufopts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, bufopts)
		vim.keymap.set("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
		end, bufopts)
	end,
})
