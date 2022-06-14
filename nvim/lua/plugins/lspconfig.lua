-- https://github.com/lewis6991/gitsigns.nvim
return {
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/nvim-lsp-installer',
    'ray-x/lsp_signature.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  run = ':TSUpdate',
  config = function()
    Core.map({
      {
        mode = 'n',
        key = '<leader>df',
        action = '<cmd>lua vim.diagnostic.open_float()<cr>',
        desc = 'lsp diagnostic open float',
      },
      {
        mode = 'n',
        key = '<leader>dp',
        action = '<cmd>lua vim.diagnostic.goto_prev()<cr>',
        desc = 'lsp diagnostic goto prev',
      },
      {
        mode = 'n',
        key = '<leader>dn',
        action = '<cmd>lua vim.diagnostic.goto_next()<cr>',
        desc = 'lsp diagnostic goto next',
      },
      {
        mode = 'n',
        key = '<leader>ds',
        action = '<cmd>lua vim.diagnostic.setloclist()<cr>',
        desc = 'lsp diagnostic set loclist',
      },
    })

    require("nvim-lsp-installer").setup({
      automatic_installation = true,
      -- automatically detect which servers to install (based on which servers are set up via lspconfig)
      ui = {
        icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗",
        },
      },
      -- LspInstallInfo window's mappings
      keymaps = {
        toggle_server_expand = "<CR>", -- collapse or expand info
        install_server = "i", -- install server
        update_server = "u", -- update server
        check_server_version = "c", -- check server version
        update_all_servers = "U", -- update all installed servers
        check_outdated_servers = "C", -- check which installed servers are outdated
        uninstall_server = "X", -- uninstall server
      },
    })

    -- Use an on_attach function to only map the following keys
    -- after the anguage server attaches to the current buffer
    local on_attach = function(_, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      Core.map({
        -- navigator
        {
          mode = 'n',
          key = 'gd',
          action = '<cmd>lua vim.lsp.buf.definition()<cr>',
          desc = 'goto definition',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = 'gD',
          action = '<cmd>lua vim.lsp.buf.declaration()<cr>',
          desc = 'goto declaration',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = 'gd',
          action = '<cmd>lua vim.lsp.buf.references()<cr>',
          desc = 'goto references',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = 'gd',
          action = '<cmd>lua vim.lsp.buf.implementation()<cr>',
          desc = 'goto implementation',
          buffer = bufnr,
        },
        -- info
        {
          mode = 'n',
          key = '<leader>hv',
          action = '<cmd>lua vim.lsp.buf.hover()<cr>',
          desc = 'hover',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = '<leader>sh',
          action = '<cmd>lua vim.lsp.buf.signature_help()<cr>',
          desc = 'signature help',
          buffer = bufnr,
        },
        -- workspace
        {
          mode = 'n',
          key = '<leader>wa',
          action = '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>',
          desc = 'add workspace folder',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = '<leader>wr',
          action = '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>',
          desc = 'remove workspace folder',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = '<leader>wl',
          action = '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folder()))<cr>',
          desc = 'list workspace folder',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = '<leader>td',
          action = '<cmd>lua vim.lsp.buf.type_definition()<cr>',
          desc = 'type definition',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = '<leader>rn',
          action = '<cmd>lua vim.lsp.buf.rename()<cr>',
          desc = 'rename',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = '<leader>ca',
          action = '<cmd>lua vim.lsp.buf.code_action()<cr>',
          desc = 'code action',
          buffer = bufnr,
        },
        {
          mode = 'n',
          key = '<leader>fm',
          action = '<cmd>lua vim.lsp.buf.formatting()<cr>',
          desc = 'formatting',
          buffer = bufnr,
        },
      })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.preselectSupport = true
    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
    capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      }
    }
    local settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    }
    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = {
      'cssls',
      'tsserver',
      'sumneko_lua',
      'prosemd_lsp',
    }
    for _, lsp in pairs(servers) do
      require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = settings,
        flags = {
          -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
      }
    end

    require 'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = {
        "tsx",
        "typescript",
        "javascript",
        "css",
        "scss",
        "lua",
        "markdown"
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- List of parsers to ignore installing (for "all")
      -- ignore_install = { "javascript" },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }

    require "lsp_signature".setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded"
      }
    })

    -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
    -- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

    local border = "single"

    -- LSP settings (for overriding per client)
    -- local handlers =  {
    --   ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = border}),
    --   ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    --   -- ["textDocument/show_line_diagnostics"]
    --   -- ["textDocument/diagnostic"]
    --   -- ["textDocument/diagnostics"]
    -- }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = '●', -- Could be '●', '▎', 'x'
        spacing = 4,
        source = "always",
      },
      float = {
        source = "always",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    })

    local signs = { Error = "", Warn = "", Hint = "", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
