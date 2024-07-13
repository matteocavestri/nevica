{
  plugins = {
    lsp.servers = {
      bashls = {
        enable = true; 
      };
    };
    none-ls.sources = {
      formatting = {
        shfmt = {
          enable = true;
        };
      };
      diagnostics = {
        zsh.enable = true;
      };
    };
  };
}
