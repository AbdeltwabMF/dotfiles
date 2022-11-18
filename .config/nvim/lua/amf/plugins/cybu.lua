local ok, cybu = pcall(require, "cybu")
if not ok then
	return
end
cybu.setup()

vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
vim.keymap.set("n", "J", "<Plug>(CybuNext)")
