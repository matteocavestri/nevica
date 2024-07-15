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
  extraConfigLua = ''
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
        dap = { justMyCode = false },
        args = {"--log-level", "DEBUG"},
        runner = "pytest",
        python = "python",
        is_test_file = function(file_path)
            return vim.fn.fnamemodify(file_path, ':t'):match("^test_.*%.py$") ~= nil
        end,
        }),
      },
    })
  '';
}
