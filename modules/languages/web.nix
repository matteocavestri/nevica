{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.web.enable = lib.mkEnableOption "Enable html, css, htmx support";
  };
  config = lib.mkIf config.nevica.languages.web.enable {
    plugins = {
      treesitter.settings.ensure_installed = [
        "css"
        "html"
      ];
      lsp.servers = {
        cssls = {
          enable = true;
          package = pkgs.vscode-langservers-extracted;
        };
        html = {
          enable = true;
          package = pkgs.vscode-langservers-extracted;
        };
        htmx = {
          enable = true;
          package = pkgs.htmx-lsp;
        };
        tailwindcss = {
          enable = true;
          package = pkgs.tailwindcss-language-server;
        };
      };
    };
  };
}
