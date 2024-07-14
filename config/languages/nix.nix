{
  plugins = {
    lsp.servers = {
      nil-ls = {
        enable = true;
        filetypes = ["nix"];
      };
    };
    none-ls.sources = {
      diagnostics = {
        statix = {
          enable = true;
        };
      };
      formatting = {
        alejandra.enable = true;
      };
      code_actions = {
        statix.enable = true;
      };
    };
  };
}
