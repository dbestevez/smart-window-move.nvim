local M = {}

local defaults = {
  mappings = {
    h = "<C-h>",
    j = "<C-j>",
    k = "<C-k>",
    l = "<C-l>",
  },
}

local function merge_opts(opts)
  return vim.tbl_deep_extend("force", defaults, opts or {})
end

function M.move(dir)
  local current = vim.api.nvim_get_current_win()

  vim.cmd("wincmd " .. dir)

  if current == vim.api.nvim_get_current_win() then
    vim.cmd((dir == "h" or dir == "l") and "vnew" or "new")
    vim.cmd("wincmd " .. dir)
  end
end

function M.setup(opts)
  opts = merge_opts(opts)

  for dir, lhs in pairs(opts.mappings or {}) do
    vim.keymap.set("n", lhs, function()
      M.move(dir)
    end, {
      silent = true,
      desc = "Smart window move " .. dir,
    })
  end
end

return M
