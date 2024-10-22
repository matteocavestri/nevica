{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.utils.generalPlugins = {
      tmuxNavigator.enable = lib.mkEnableOption "Enable Tmux tmux-navigator";
    };
  };
  config = {
    plugins = {
      tmux-navigator = lib.mkIf config.nevica.utils.generalPlugins.tmuxNavigator.enable {
        enable = true;
        package = pkgs.vimPlugins.vim-tmux-navigator;
      };
    };
  };
}
