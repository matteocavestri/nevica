{
  plugins = {
    lsp.servers = {
      lua-ls = {
        enable = true;
        extraOptions = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace";
              };
              telemetry = {
                enabled = false;
              };
              hint = {enable = true;};
            };
          };
        };
      };
    };
    none-ls.sources = {
      formatting = {
        stylua.enable = true;
      };
      diagnostics = {
        selene.enable = true;
      };
    };
  };
}
