{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.utils.generalPlugins = {
      tmuxNavigator.enable = lib.mkEnableOption "Enable Tmux tmux-navigator";
      tagbar.enable = lib.mkEnableOption "Enable tagbar";
      todoComments.enable = lib.mkEnableOption "Enable todoComments";
    };
  };
  config = {
    plugins = {
      tmux-navigator = lib.mkIf config.nevica.utils.generalPlugins.tmuxNavigator.enable {
        enable = true;
        package = pkgs.vimPlugins.vim-tmux-navigator;
      };
      tagbar = lib.mkIf config.nevica.utils.generalPlugins.tagbar.enable {
        enable = true;
        package = pkgs.vimPlugins.tagbar;
        settings = {
          autoclose = false;
          autofocus = false;
          autoshowtag = true;
          foldlevel = 2;
          iconchars = [
            ""
            ""
          ];
          position = "right";
          visibility_symbols = {
            private = "󰛑 ";
            protected = "󱗤 ";
            public = "󰡭 ";
          };
        };
      };
      todo-comments = lib.mkIf config.nevica.utils.generalPlugins.todoComments.enable {
        enable = true;
        package = pkgs.vimPlugins.todo-comments-nvim;
      };
    };
  };
}
