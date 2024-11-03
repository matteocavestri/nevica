{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.ui.noice = {
      enable = lib.mkEnableOption "Enable noice";
    };
  };
  config = lib.mkIf config.nevica.ui.noice.enable {
    plugins = {
      noice = {
        enable = true;
        package = pkgs.vimPlugins.noice-nvim;
        settings = {
          notify = {
            enabled = false;
          };
          messages = {
            enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
            view = "notify";
            viewError = "notify";
            viewWarn = "notify";
          };
          lsp = {
            message = {
              enabled = true;
            };
            progress = {
              enabled = false;
              view = "mini";
            };
          };
          popupmenu = {
            enabled = true;
            backend = "cmp";
          };
          format = {
            filter = {
              pattern = [":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*"];
              icon = "";
              lang = "regex";
            };
            replace = {
              pattern = [":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*"];
              icon = "󱞪";
              lang = "regex";
            };
          };
        };
      };
    };
  };
}
