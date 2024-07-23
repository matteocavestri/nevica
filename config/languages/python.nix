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
          settings = ''
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
    # FIX: Neotest doesn't work with python
    neotest.adapters.python = {
      enable = true;
      settings = {
        dap = {justMyCode = false;};
        args = ["--log-level" "DEBUG"];
        runner = "pytest";
        python = "python";
        pytest_discover_instances = true;
      };
    };
  };
  # extraConfigLua = ''
  #   require("neotest").setup({
  #     adapters = {
  #       require("neotest-python")({
  #       dap = { justMyCode = false },
  #       args = {"--log-level", "DEBUG"},
  #       runner = "pytest",
  #       python = "python",
  #       }),
  #     },
  #   })
  # '';
}
