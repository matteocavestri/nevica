{pkgs, ...}: {
  plugins = {
    typescript-tools = {
      enable = true;
      onAttach = ''
        function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          --if vim.lsp.inlay_hint then
          --  vim.lsp.inlay_hint(bufnr, false)
          --end
        end
      '';
      settings = {
        tsserverFilePreferences = {
          # Inlay Hints
          includeInlayParameterNameHints = "all";
          includeInlayParameterNameHintsWhenArgumentMatchesName = true;
          includeInlayFunctionParameterTypeHints = true;
          includeInlayVariableTypeHints = true;
          includeInlayVariableTypeHintsWhenTypeMatchesName = true;
          includeInlayPropertyDeclarationTypeHints = true;
          includeInlayFunctionLikeReturnTypeHints = true;
          includeInlayEnumMemberValueHints = true;
        };
      };
    };
    ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = false;
    };
    ts-autotag = {
      enable = true;
    };
    lsp.servers = {
      eslint.enable = true;
      tsserver.enable = false;
    };
    # TODO: Edit to use none-ls
    lint.lintersByFt = {
      javascript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      typescript = ["eslint_d"];
      typescriptreact = ["eslint_d"];
    };
  };
  # FIX: Debug doesn't work for javascript/typescript
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      name = "vim-dap-vscode-js";
      src = pkgs.fetchFromGitHub {
        owner = "mxsdev";
        repo = "nvim-dap-vscode-js";
        rev = "e7c05495934a658c8aa10afd995dacd796f76091";
        sha256 = "sha256-lZABpKpztX3NpuN4Y4+E8bvJZVV5ka7h8x9vL4r9Pjk=";
      };
    })
  ];
  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")
    local dap_vscode_js = require("dap-vscode-js")
    dap_vscode_js.setup({
      adapters = { 'pwa-node' },
      node_path = "${pkgs.nodejs}/bin/node",
    })
    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "''${file}",
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Run Application",
        program = "dist/index.js",
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Run npm test",
        program = "node_modules/mocha/bin/_mocha",
        cwd = "''${workspaceFolder}",
      }
     }
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "''${file}",
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Run Application",
        program = "dist/index.js",
        cwd = "''${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Run npm test",
        program = "node_modules/mocha/bin/_mocha",
        cwd = "''${workspaceFolder}",
      }
     }
  '';
}
