{
  lib,
  config,
  ...
}: {
  options = {
    nevica.languages.nix.enable = lib.mkEnableOption "Enable support for Nix programming language";
  };
  config = lib.mkIf config.nevica.languages.nix.enable {
    plugins = {
      treesitter.settings.ensure_installed = [
        "nix"
      ];
      lsp.servers.nil_ls = {
        enable = true;
        filetypes = ["nix"];
        settings.nix.flake.autoArchive = true;
      };
      none-ls.sources = {
        diagnostics.statix.enable = true;
        formatting.alejandra.enable = true;
        code_actions.statix.enable = true;
      };
    };
  };
}
