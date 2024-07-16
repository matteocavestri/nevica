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
    neotest.adapters.python = {
      enable = true;
      settings = {
        dap = {justMyCode = false;};
        args = ["--log-level" "DEBUG"];
        runner = "pytest";
        python = "python";
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
