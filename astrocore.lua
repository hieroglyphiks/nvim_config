-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- show open file in neotree
        ["<Leader>e"] = { "", desc = "Neotree Explorer" },
        ["<Leader>et"] = { ":Neotree toggle<CR>", desc = "show neotree" },
        ["<Leader>er"] = { ":Neotree reveal_force_cwd<CR>", desc = "reveal current file in neotree" },

        -- navigate buffer tabs
        ["<C-Right>"] = { ":bnext<CR>", desc = "Next buffer" },
        ["<C-Left>"] = { ":bprevious<CR>", desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- windows
        ["<Leader>w"] = { desc = "Windows" },
        ["<Leader>wd"] = { "<C-W>d", desc = "Delete" },
        ["<Leader>ws"] = { "<C-W>s", desc = "Split Below" },
        ["<Leader>wv"] = { "<C-W>v", desc = "Split Vertical" },

        ["<S-Left>"] = { "<C-w>h" }, -- movement for windows
        ["<S-Right>"] = { "<C-w>l" },
        ["<S-Up>"] = { "<C-w>k" },
        ["<S-Down>"] = { "<C-w>j" },

        -- cursor movement
        ["<Leader>m"] = { desc = "Cursor Movement" },
        ["<Leader>me"] = { "$", desc = "End of line" },
        ["<Leader>ms"] = { "^", desc = "End of line" },
        ["<Leader>mm"] = { "%", desc = "Corresponding Char" },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        -- cursor movement
        ["<Leader>m"] = { desc = "Cursor Movement" },
        ["<Leader>me"] = { "$", desc = "End of line" },
        ["<Leader>ms"] = { "^", desc = "End of line" },
        ["<Leader>mm"] = { "%", desc = "Corresponding Char" },
      },
    },
  },
}
