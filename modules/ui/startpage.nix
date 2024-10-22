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
              cwd_only = false;
              limit = 15;
            };
            packages.enable = false;
            project = {
              enable = true;
              limit = 8;
            };
            shortcut = [
              {
                action = {
                  __raw = "function(path) vim.cmd('Telescope find_files') end";
                };
                group = "highlight";
                desc = " Files";
                icon_hl = "@variable";
                key = "f";
              }
              {
                action = {
                  __raw = "function(path) vim.cmd('Telescope live_grep') end";
                };
                desc = " Grep";
                group = "highlight";
                key = "g";
              }
              {
                action = {
                  __raw = "function(path) vim.cmd('Telescope oldfiles') end";
                };
                desc = " Recents";
                group = "highlight";
                key = "r";
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
