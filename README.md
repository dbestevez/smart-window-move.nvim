# smart-window-move.nvim

A lightweight Neovim plugin that makes window navigation more fluid.

When you try to move to a split that doesn't exist, `smart-window-move.nvim` automatically creates it and moves the cursor there.

For example:

* Pressing `<C-l>` on the rightmost window creates a vertical split to the right.
* Pressing `<C-j>` on the bottom window creates a horizontal split below.

## Features

* Navigate between windows using your preferred key mappings.
* Automatically creates missing splits.
* Lightweight and dependency-free.
* Fully configurable key mappings.

## Installation

### Using `vim.pack` (Neovim 0.12+)

```lua
vim.pack.add({
    "https://github.com/dbestevez/smart-window-move.nvim",
})

require("smart-window-move").setup()
```

### Using lazy.nvim

```lua
{
    "dbestevez/smart-window-move.nvim",
    config = function()
        require("smart-window-move").setup()
    end,
}
```

### Using packer.nvim

```lua
use {
    "dbestevez/smart-window-move.nvim",
    config = function()
        require("smart-window-move").setup()
    end,
}
```

## Configuration

The default configuration is:

```lua
require("smart-window-move").setup({
    mappings = {
        h = "<C-h>",
        j = "<C-j>",
        k = "<C-k>",
        l = "<C-l>",
    },
})
```

### Custom mappings

You can use any mappings you prefer:

```lua
require("smart-window-move").setup({
    mappings = {
        h = "<leader>h",
        j = "<leader>j",
        k = "<leader>k",
        l = "<leader>l",
    },
})
```

### Disable default mappings

If you prefer to create your own mappings, disable them by passing `false`:

```lua
require("smart-window-move").setup({
    mappings = false,
})
```

Then create your own mappings:

```lua
local windowmove = require("smart-window-move")

vim.keymap.set("n", "<A-h>", function()
    windowmove.move("h")
end)

vim.keymap.set("n", "<A-j>", function()
    windowmove.move("j")
end)

vim.keymap.set("n", "<A-k>", function()
    windowmove.move("k")
end)

vim.keymap.set("n", "<A-l>", function()
    windowmove.move("l")
end)
```

## API

### `setup(opts)`

Initializes the plugin.

### `move(direction)`

Moves to the window in the given direction. If no window exists, a new split is created automatically.

Valid directions are:

* `"h"`
* `"j"`
* `"k"`
* `"l"`

## License

MIT
