{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.ui.bufferbar = {
      bufferline.enable = lib.mkEnableOption "Enable Bufferline as top Buffer bar";
    };
  };
  config = {
    plugins = {
      bufferline = {
        enable = true;
        package = pkgs.vimPlugins.bufferline-nvim;
        settings = {
          options = {
            separator_style = "thick";
            offsets = [
              {
                filetype = "neo-tree";
                text = "Neotree";
                highlight = "Directory";
                text_align = "left";
              }
            ];
          };
        };
      };
    };
  };
}
