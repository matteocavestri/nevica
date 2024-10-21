{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.snippet = {
      luasnip.enable = lib.mkEnableOption "Enable LuaSnip Snippets";
    };
  };
  config = {
    plugins = {
      luasnip = lib.mkIf config.nevica.codeUtils.snippet.luasnip.enable {
        enable = true;
        package = pkgs.vimPlugins.luasnip;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
        fromVscode = [
          {
            lazyLoad = true;
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };
    };
  };
}
