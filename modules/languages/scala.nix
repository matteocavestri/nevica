{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.scala.enable = lib.mkEnableOption "Enable Scala language support";
  };
  config = lib.mkIf config.nevica.languages.scala.enable {
    plugins = {
      treesitter.settings.ensure_installed = [
        "scala"
      ];
      lsp.servers = {
        metals = {
          enable = true;
          package = pkgs.metals;
        };
      };
      lsp-format = {
        lspServersToEnable = [
          "metals"
        ];
      };
      neotest.adapters.scala = {
        enable = true;
        package = pkgs.vimPlugins.neotest-scala;
      };
    };
  };
}
