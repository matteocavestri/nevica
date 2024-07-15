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
      settings = {
        # callback = {
        #   __raw = ''
        #     vim.api.nvim_create_autocmd("BufEnter", {
        #       pattern = "*_test.go",
        #       callback = function()
        #         require('neotest').run.run(vim.fn.expand('%'))
        #       end,
        #     })
        #   '';
        # };
      };
    };
  };
}
