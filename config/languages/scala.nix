{
  # TODO: dap, test don't work.
  plugins = {
    lsp.servers = {
      metals = {
        enable = true;
      };
    };
    lsp-format = {
      lspServersToEnable = [
        "metals"
      ];
    };
    neotest.adapters.scala = {
      enable = true;
    };
  };
  extraConfigLua = ''
      require("neotest").setup({
      adapters = {
        require("neotest-scala")({
            -- Command line arguments for runner
            -- Can also be a function to return dynamic values
            args = {"--no-color"},
            -- Runner to use. Will use bloop by default.
            -- Can be a function to return dynamic value.
            -- For backwards compatibility, it also tries to read the vim-test scala config.
            -- Possibly values bloop|sbt.
            runner = "sbt",
            -- Test framework to use. Will use utest by default.
            -- Can be a function to return dynamic value.
            -- Possibly values utest|munit|scalatest.
            framework = "scalatest",
        })
      }
    })
  '';
  # extraConfigLua = ''
  #   local dap = require("dap")
  #   dap.configurations.scala = {
  #     {
  #       type = "scala",
  #       request = "launch",
  #       name = "RunOrTest",
  #       metals = {
  #         runType = "runOrTestFile",
  #       },
  #     },
  #     {
  #       type = "scala",
  #       request = "launch",
  #       name = "Test Target",
  #       metals = {
  #         runType = "testTarget",
  #       },
  #     },
  #   }
  #   metals_config.on_attach = function(client, bufnr)
  #     require("metals").setup_dap()
  #   end
  # '';
}
