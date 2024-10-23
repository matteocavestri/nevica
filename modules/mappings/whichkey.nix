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
          preset = "modern";
          icons = {
            breadcrumb = "»";
            group = "+";
            separator = "";
            ellipsis = "…";
            colors = true;
            keys = {
              BS = "󰁮";
              C = "󰘴 ";
              CR = "󰌑 ";
              D = "󰘳 ";
              Down = " ";
              Esc = "󱊷 ";
              F1 = "󱊫";
              F10 = "󱊴";
              F11 = "󱊵";
              F12 = "󱊶";
              F2 = "󱊬";
              F3 = "󱊭";
              F4 = "󱊮";
              F5 = "󱊯";
              F6 = "󱊰";
              F7 = "󱊱";
              F8 = "󱊲";
              F9 = "󱊳";
              Left = " ";
              M = "󰘵 ";
              NL = "󰌑 ";
              Right = " ";
              S = "󰘶 ";
              ScrollWheelDown = "󱕐 ";
              ScrollWheelUp = "󱕑 ";
              Space = "󱁐 ";
              Tab = "󰌒 ";
              Up = " ";
            };
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
