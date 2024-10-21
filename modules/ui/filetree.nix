{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.ui.filetree = {
      neotree.enable = lib.mkEnableOption "Enable neotree";
    };
  };
  config = {
    plugins = {
      neo-tree = lib.mkIf config.nevica.ui.filetree.neotree.enable {
        enable = true;
        package = pkgs.vimPlugins.neo-tree-nvim;
        enableDiagnostics = true;
        enableGitStatus = true;
        enableModifiedMarkers = true;
        enableRefreshOnWrite = true;
        closeIfLastWindow = true;
        popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
        buffers = {
          bindToCwd = false;
          followCurrentFile = {
            enabled = true;
          };
        };
        window = {
          width = 40;
          height = 15;
          autoExpandWidth = false;
          mappings = {
            "<space>" = "none";
          };
        };
      };
    };
  };
}
