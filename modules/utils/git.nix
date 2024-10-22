{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.utils.git = {
      lazygit.enable = lib.mkEnableOption "Enable Lazygit";
      neogit.enable = lib.mkEnableOption "Enable NeoGit";
      diffview.enable = lib.mkEnableOption "Enable Diffview";
      gitsigns.enable = lib.mkEnableOption "Enable Gitsigns";
    };
  };
  config = {
    plugins = {
      gitsigns = lib.mkIf config.nevica.utils.git.gitsigns.enable {
        enable = true;
        package = pkgs.vimPlugins.gitsigns-nvim;
        settings = {
          trouble = true;
          current_line_blame = true;
          current_line_blame_opts = {
            virt_text = true;
            virt_text_pos = "eol";
          };
        };
      };
      diffview = lib.mkIf config.nevica.utils.git.diffview.enable {
        enable = true;
        package = pkgs.vimPlugins.diffview-nvim;
        useIcons = true;
      };
      neogit = lib.mkIf config.nevica.utils.git.neogit.enable {
        enable = true;
        package = pkgs.vimPlugins.neogit;
        gitPackage = pkgs.git;
        whichPackage = pkgs.which;
      };
      lazygit = lib.mkIf config.nevica.utils.git.lazygit.enable {
        enable = true;
        package = pkgs.vimPlugins.lazygit-nvim;
        gitPackage = pkgs.git;
        lazygitPackage = pkgs.lazygit;
      };
    };
  };
}
