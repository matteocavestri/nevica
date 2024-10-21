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
        icons.enable = true; #Mini icons (mockDevIcons)
        indentscope.enable = true; # Indent highlight
        # Animate is a beautifull feature, but it brokes mouse scrolling so it is disabled by default
        animate.enable = false; # Animate your cursor movement
        pairs.enable = true; # Auto add closing bracket
        surround.enable = true; # Surround text with bracket using saiw and then choose a surrounding
        comment.enable = true; # Add comment using gcc keymap
        cursorword.enable = true; # highlight of word under the cursor
      };
    };
  };
}
