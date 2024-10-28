{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.templ.enable = lib.mkEnableOption "Enable templ support";
  };
  config = lib.mkIf config.nevica.languages.templ.enable {
    plugins = {
      lsp.servers = {
        templ = {
          enable = true;
          package = pkgs.templ;
        };
      };
      lsp-format = {
        lspServersToEnable = [
          "templ"
        ];
      };
    };
  };
}

