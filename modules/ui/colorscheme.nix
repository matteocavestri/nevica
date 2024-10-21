{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.ui.colorscheme = {
      base16.enable = lib.mkEnableOption "Enable base16 colorscheme";
      catppuccin.enable = lib.mkEnableOption "Enable Catppuccin Mocha colorscheme";
    };
  };
  config = {
    colorschemes = {
      base16 = lib.mkIf config.nevica.ui.colorscheme.base16.enable {
        enable = true;
        package = pkgs.vimPlugins.base16-nvim;
        colorscheme = "catppuccin-mocha";
        setUpBar = lib.mkIf (!config.nevica.ui.colorscheme.catppuccin.enable) true;
        settings =
          if config.nevica.ui.colorscheme.catppuccin.enable
          then {
            cmp = false;
            dapui = false;
            lsp_semantic = false;
            mini_completion = false;
            notify = false;
            telescope = false;
            telescope_borders = false;
            ts_rainbow = false;
          }
          else {
            cmp = true;
            dapui = true;
            lsp_semantic = true;
            mini_completion = true;
            notify = true;
            telescope = true;
            telescope_borders = true;
            ts_rainbow = true;
          };
      };
      catppuccin = lib.mkIf config.nevica.ui.colorscheme.catppuccin.enable {
        enable = true;
        package = pkgs.vimPlugins.catppuccin-nvim;
        settings = {
          background.dark = "mocha";
          flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
          no_bold = false;
          no_italic = false;
          no_underline = false;
          transparent_background = false;
          term_colors = true;
          integrations = {
            cmp = lib.mkIf config.nevica.codeUtils.completion.cmp.enable true;
            noice = lib.mkIf config.nevica.ui.noice.enable true;
            notify = lib.mkIf config.nevica.utils.notify.nvimNotify.enable true;
            neotree = lib.mkIf config.nevica.ui.filetree.neotree.enable true;
            # gitsigns = true;
            which_key = lib.mkIf config.nevica.mappings.whichKey.enable true;
            treesitter = lib.mkIf config.nevica.codeUtils.highlighting.treesitter.enable true;
            # treesitter_context = true;
            telescope.enabled = lib.mkIf config.nevica.utils.telescope.enable true;
            mini.enabled = lib.mkIf config.nevica.utils.mini.enable true;
            native_lsp = lib.mkIf config.nevica.codeUtils.languageServer.enable {
              enabled = true;
              inlay_hints = {
                background = true;
              };
              underlines = {
                errors = ["underline"];
                hints = ["underline"];
                information = ["underline"];
                warnings = ["underline"];
              };
            };
          };
          styles = {
            booleans = [
              "bold"
              "italic"
            ];
            conditionals = [
              "bold"
            ];
          };
        };
      };
    };
  };
}
