{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.utils.mini = {
      enable = lib.mkEnableOption "Enable mini Plugins";
    };
  };
  config = {
    plugins.mini = lib.mkIf config.nevica.utils.mini.enable {
      enable = true;
      package = pkgs.vimPlugins.mini-nvim;
      mockDevIcons = lib.mkIf config.nevica.utils.telescope.enable true;
      modules = {
        icons = {}; # Mini icons (mockDevIcons)
        indentscope = {}; # Indent highlight
        # Animate is a beautifull feature, but it brokes mouse scrolling so it is disabled by default
        # animate = {}; # Animate your cursor movement
        pairs = {}; # Auto add closing bracket
        surround = {}; # Surround text with bracket using saiw and then choose a surrounding
        comment = {}; # Add comment using gcc keymap
        cursorword = {}; # highlight of word under the cursor
      };
    };
  };
}
