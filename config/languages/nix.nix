{
  plugins = {
    lsp.servers = {
      nil-ls = {
        enable = true;
        filetypes = [ "nix" ];
        settings.nix.flake.autoArchive = true;
      };
    };
    none-ls.sources = {
      diagnostics = { statix = { enable = true; }; };
      formatting = {
        alejandra.enable = true;
        # nixfmt.enable = true;
        # nixpkgs_fmt.enable = true;
      };
      code_actions = { statix.enable = true; };
    };
  };
}
