{
  plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = [
        "dockerls"
        "rust-analyzer"
      ];
    };
  };
}
