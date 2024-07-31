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
        default_settings = {
          rust-analyzer = {
            check = {
              command = "clippy";
            };
            inlayHints = {
              lifetimeElisionHints = {
                enable = "always";
              };
            };
          };
        };
      };
    };
    # lsp-format = {
    #   lspServersToEnable = [
    #     "rust-analyzer"
    #   ];
    # };
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
