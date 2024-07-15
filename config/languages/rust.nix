{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        server = {
          auto_attach = true;
        };
        dap = {
          autoload_configurations = true;
        };
      };
    };
  };
  extraConfigLua = ''
    require("neotest").setup({
      adapters = {
        require("neotest-rust") {
          args = { "--no-capture" },
        },
      },
    })
  '';
}
