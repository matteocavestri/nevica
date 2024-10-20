{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.ui.startpage = {
      dashboard.enable = lib.mkEnableOption "Enable Dashboard startpage -> https://github.com/nvimdev/dashboard-nvim/";
    };
  };

  config = {
    plugins = {
      dashboard = lib.mkIf config.nevica.ui.startpage.dashboard.enable {
        enable = true;
        package = pkgs.vimPlugins.dashboard-nvim;
        settings = {
          change_to_vcs_root = true;
          config = {
            mru = {
              limit = 10;
            };
            project = {
              enable = true;
            };
            shortcut = [
              {
                action = {
                  __raw = "function(path) vim.cmd('Telescope find_files') end";
                };
                desc = "Files";
                group = "Label";
                icon = " ";
                icon_hl = "@variable";
                key = "f";
              }
              {
                action = "Telescope app";
                desc = " Apps";
                group = "DiagnosticHint";
                key = "a";
              }
              {
                action = "Telescope dotfiles";
                desc = " dotfiles";
                group = "Number";
                key = "d";
              }
            ];
            week_header = {
              enable = true;
            };
          };
          theme = "hyper";
        };
      };
    };
  };
}
