return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        local cmp = require("cmp")
        require('luasnip.loaders.from_vscode').lazy_load()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "jinja_lsp",
                "gopls",
                "eslint",
                "tailwindcss",
                "pyright",
                "omnisharp",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            },
        })
        require('mason-tool-installer').setup({
            ensure_installed = {
                'black',
                'debugpy',
                'flake8',
                'isort',
                'mypy',
                'pylint',
                'djlint',
                "html-lsp",
                "css-lsp",
            },
        })
        local util = require("lspconfig/util")
        require("lspconfig").pyright.setup {
            before_init = function(_, config)
                local venv = os.getenv("VIRTUAL_ENV")
                if venv then
                    config.settings.python.pythonPath = venv .. "/bin/python"
                end
            end,
            root_dir = util.root_pattern(".git", "pyproject.toml", "setup.py"),
        }
        require("lspconfig").lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },

                    },

                },

            },
        }
        require("lspconfig").cssls.setup({})
        require("lspconfig").html.setup({})
        require("lspconfig").omnisharp.setup({
            cmd = { "omnisharp" },
            enable_roslyn_analyzers = true,
            organize_imports_on_format = true
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "codeium" },
            }),
            experimental = {
                ghost_text = true
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),

            },
        })
        local open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded"       -- Set border to rounded
            return open_floating_preview(contents, syntax, opts, ...)
        end
    end
}
