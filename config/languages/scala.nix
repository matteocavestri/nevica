{
  # TODO: Scala LSP works not perfectly, formatting doesn't work.
  plugins = {
    lsp.servers = {
      metals = {
        enable = true;
      };
    };
    # none-ls.sources = {
    #   formatting = {
    #     scalafmt = {
    #       enable = true;
    #     };
    #   };
    # };
    # NOTE: Useing lspformat with metals doesn't work.
    # lsp-format = {
    #   lspServersToEnable = [
    #     "metals"
    #   ];
    # };
  };
}
