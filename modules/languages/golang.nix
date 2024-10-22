{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.golang.enable = lib.mkEnableOption "Enable golang support";
  };
  config = lib.mkIf config.nevica.languages.golang.enable {
    plugins = {
      treesitter.settings.ensure_installed = [
        "go"
      ];
      lsp.servers = {
        gopls = {
          enable = true;
          package = pkgs.gopls;
        };
      };
      none-ls.sources = {
        formatting = {
          goimports = {
            enable = true;
            package = pkgs.gotools;
          };
          golines = {
            enable = true;
            package = pkgs.golines;
          };
          gofumpt = {
            enable = true;
            package = pkgs.gofumpt;
          };
        };
        diagnostics = {
          golangci_lint = {
            enable = true;
            package = pkgs.golangci-lint;
          };
        };
      };
      dap.extensions = {
        dap-go = {
          enable = true;
          package = pkgs.vimPlugins.nvim-dap-go;
          delve.path = "${pkgs.delve}/bin/dlv";
        };
      };
      neotest.adapters = {
        golang = {
          enable = true;
          package = pkgs.vimPlugins.neotest-golang;
        };
      };
    };
    # extraConfigLua = ''
    #   require("neotest").setup({
    #     adapters = {
    #       require("neotest-go")({
    #         experimental = {
    #           test_table = true,
    #         },
    #         args = { "-count=1", "-timeout=60s" }
    #       }),
    #     },
    #   })
    # '';
  };
}
