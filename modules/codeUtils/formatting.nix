{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.formatting = {
      lspFormat.enable = lib.mkEnableOption "Enable LSP Format support";
      noneLs.enable = lib.mkEnableOption "Enable none-ls support";
    };
  };
  config = {
    plugins = {
      lsp-format = lib.mkIf config.nevica.codeUtils.formatting.lspFormat.enable {
        enable = true;
        package = pkgs.vimPlugins.lsp-format-nvim;
        lspServersToEnable = [];
      };
      none-ls = lib.mkIf config.nevica.codeUtils.formatting.noneLs.enable {
        enable = true;
        package = pkgs.vimPlugins.none-ls-nvim;
        enableLspFormat = true;
        settings = {
          update_in_insert = false;
        };
        sources = {
          formatting = {
            # Markdown and Yaml formatting are enabled by default
            mdformat = {
              enable = true;
              package = pkgs.mdformat;
            };
            yamlfmt = {
              enable = true;
              package = pkgs.yamlfmt;
            };
          };
        };
      };
    };
  };
}
