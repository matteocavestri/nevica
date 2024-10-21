{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.lsp.enable = lib.mkEnableOption "Enable Language Server Prototcol";
  };
  config = {
    plugins = {
      lsp = lib.mkIf config.nevica.codeUtils.lsp.enable {
        enable = true;
        package = pkgs.vimPlugins.nvim-lspconfig;
        capabilities = "offsetEncoding = { 'utf-8', 'utf-16'}";
        servers = {};
      };
    };
    extraConfigLua = lib.mkIf config.nevica.codeUtils.lsp.enable ''
      local _border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = _border
        }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = _border
        }
      )

      vim.diagnostic.config{
        float={border=_border}
      };

      require('lspconfig.ui.windows').default_options = {
        border = _border
      }
    '';
  };
}
