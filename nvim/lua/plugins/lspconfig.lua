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
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      local whichkey = require 'which-key'
      local opt = {
        mode = 'n',
        buffer = bufnr,
      }
      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      whichkey.register({
        ['gd'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', '[lsp] definition' }, -- goto definition
        ['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<CR>', '[lsp] declaration' }, -- goto declaration
        ['gr'] = { '<cmd>lua vim.lsp.buf.references()<CR>', '[lsp] references' }, -- goto references
        ['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<CR>', '[lsp] implementation' }, -- goto implementation
  
        ['<leader>hv'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', '[lsp] hover' }, -- hove to display type
        ['<leader>sh'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', '[lsp] signature help' },
        ['<leader>wa'] = { 'cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', '[lsp] add workspace folder' },
        ['<leader>wr'] = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', '[lsp] remove workspace folder' },
        ['<leader>wl'] = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', '[lsp] list workspace folders' },
        ['<leader>td'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', '[lsp] type definition' },
        ['<leader>rn'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', '[lsp] rename' },
        ['<leader>ca'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', '[lsp] code action' },
        ['<leader>fm'] = { '<cmd>lua vim.lsp.buf.formatting()<CR>', '[lsp] formatting' },
      }, opt)
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
