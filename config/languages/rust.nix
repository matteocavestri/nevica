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
  # FIX: Neotest does not work on rust
  extraConfigLua = ''
    require("neotest").setup({
      adapters = {
        require('rustaceanvim.neotest') {
        },
      },
    })
  '';
}
