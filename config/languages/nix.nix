{
  plugins = {
    lsp.servers = {
      nil_ls = {
        enable = true;
        filetypes = ["nix"];
        settings.nix.flake.autoArchive = true;
      };
    };
    none-ls.sources = {
      diagnostics = {statix = {enable = true;};};
      formatting = {
        alejandra.enable = true;
      };
      code_actions = {statix.enable = true;};
    };
  };
}
