{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.ui.colorscheme = {
      base16.enable = lib.mkEnableOption "Enable base16 colorscheme";
    };
  };
  config = {
    colorschemes = {
      base16 = lib.mkIf config.nevica.ui.colorscheme.base16.enable {
        enable = true;
        package = pkgs.vimPlugins.base16-nvim;
        colorscheme = "catppuccin-mocha";
        setUpBar = true;
        settings = {
          cmp = true;
          dapui = true;
          illuminate = true;
          indentblankline = true;
          lsp_semantic = true;
          mini_completion = true;
          notify = true;
          telescope = true;
          telescope_borders = true;
          ts_rainbow = true;
        };
      };
    };
  };
}
