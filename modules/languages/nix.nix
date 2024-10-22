{
  lib,
  config,
  pkgs,
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
        package = pkgs.nil;
        filetypes = ["nix"];
        settings.nix.flake.autoArchive = true;
      };
      none-ls.sources = {
        diagnostics.statix = {
          enable = true;
          package = pkgs.statix;
        };
        formatting.alejandra = {
          enable = true;
          package = pkgs.alejandra;
        };
        code_actions.statix = {
          enable = true;
          package = pkgs.statix;
        };
      };
    };
  };
}
