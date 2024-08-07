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
