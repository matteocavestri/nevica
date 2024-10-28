{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.typescript.enable = lib.mkEnableOption "Enable typescript language support";
  };
  config = lib.mkIf config.nevica.languages.typescript.enable {
    plugins = {
      treesitter.settings.ensure_installed = [
        "typescript"
        "javascript"
      ];
      typescript-tools = {
        enable = true;
        package = pkgs.vimPlugins.typescript-tools-nvim;
        settings = {
          on_attach = ''
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
      };
      ts-context-commentstring = {
        enable = true;
        package = pkgs.vimPlugins.nvim-ts-context-commentstring;
        disableAutoInitialization = false;
      };
      ts-autotag = {
        enable = true;
        package = pkgs.vimPlugins.nvim-ts-autotag;
      };
      none-ls.sources = {
        formatting = {
          prettier = {
            enable = true;
            package = pkgs.nodePackages.prettier;
            disableTsServerFormatter = true;
            settings = ''
              {
                extra_args = { "--no-semi", "--single-quote" },
              }
            '';
          };
        };
      };

      lsp.servers.ts_ls.enable = false;
    };
  };
}
