{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.mappings.whichKey.enable = lib.mkEnableOption "Enable which-key";
  };
  config = {
    plugins = {
      which-key = lib.mkIf config.nevica.mappings.whichKey.enable {
        enable = true;
        package = pkgs.vimPlugins.which-key-nvim;
        settings = {
          ignore_missing = false;
          delay = 200;
          expand = 1;
          notify = false;
          preset = false;
          icons = {
            breadcrumb = "»";
            group = "+";
            separator = "";
          };
          win = {
            border = "none";
          };
          spec = [
            {
              __unkeyed-1 = "<leader>d";
              group = "Debugger";
            }
            {
              __unkeyed-1 = "<leader>f";
              group = "Find";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "Search";
            }
            {
              __unkeyed-1 = "<leader>w";
              group = "Msc";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = "Code";
            }
            {
              __unkeyed-1 = "<leader>t";
              group = "Test";
            }
            {
              __unkeyed-1 = "<leader>b";
              group = "Buffers";
            }
            {
              __unkeyed-1 = "<leader>n";
              group = "Neorg";
            }
          ];
        };
      };
    };
  };
}
