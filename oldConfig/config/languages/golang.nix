{pkgs, ...}: {
  plugins = {
    lsp.servers = {
      gopls = {
        enable = true;
      };
    };
    dap.extensions = {
      dap-go = {
        enable = true;
        delve.path = "${pkgs.delve}/bin/dlv";
      };
    };
    none-ls.sources = {
      formatting = {
        goimports.enable = true;
        golines.enable = true;
        gofumpt.enable = true;
      };
      diagnostics = {
        golangci_lint.enable = true;
      };
    };
    neotest.adapters.go = {
      enable = true;
    };
  };
  extraConfigLua = ''
    require("neotest").setup({
      adapters = {
        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" }
        }),
      },
    })
  '';
}
