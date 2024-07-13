{
  plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = [
        #"clangd"
        "dockerls"
        "rust-analyzer"
      ];
    };
  };
}
