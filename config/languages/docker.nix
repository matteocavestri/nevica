{
  plugins = {
    lsp.servers = {
      docker-compose-language-service = {
        enable = true;
      };
      dockerls = {
        enable = true;
      };
    };
    none-ls.sources = {
      diagnostics = {
        hadolint.enable = true;
      };
    };
  };
}
