{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.highlighting = {
      treesitter.enable = lib.mkEnableOption "Enable treesitter color highlighting";
    };
  };
  config = {
    plugins = {
      treesitter = lib.mkIf config.nevica.codeUtils.highlighting.treesitter.enable {
        enable = true;
        package = pkgs.vimPlugins.nvim-treesitter;
        folding = true;
        nixvimInjections = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
          ensure_installed = [
            "git_config"
            "git_rebase"
            "gitattributes"
            "gitcommit"
            "gitignore"
            "nix"
          ];
        };
      };
    };
  };
}
