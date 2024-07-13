{
  plugins = {
    lsp.servers = {
      pyright = {
        enable = true;
      };
      ruff-lsp = {
        enable = true;
      };
    };
    dap.extensions = {
      dap-python = {
        enable = true;
      };
    };
    none-ls.sources = {
      formatting = {
        black = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
      };
      diagnostics = {
        pylint.enable = true;
      };
    };
  };
}
