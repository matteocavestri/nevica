{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.ui.statusbar = {
      lualine.enable = lib.mkEnableOption "Enable lualine as statusbar";
    };
  };
  config = {
    plugins = {
      lualine = lib.mkIf config.nevica.ui.statusbar.lualine.enable {
        enable = true;
        package = pkgs.vimPlugins.lualine-nvim;
        gitPackage = pkgs.git;
        settings = {
          extensions = ["fzf"];
          options = {
            globalstatus = true;
            always_divide_middle = true;
            ignore_focus = ["neo-tree"];
            theme = "auto";
            component_separators = {
              left = "|";
              right = "|";
            };
            section_separators = {
              left = "█"; # 
              right = "█"; # 
            };
          };
          sections = {
            lualine_a = ["mode"];
            lualine_b = [
              "branch"
              "diff"
              "diagnostics"
            ];
            lualine_c = ["filename"];
            lualine_x = ["filetype"];
            lualine_y = ["progress"];
            lualine_z = [''"  " .. os.date("%R")''];
          };
        };
      };
    };
  };
}
