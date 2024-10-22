{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.compiling = {
      compiler.enable = lib.mkEnableOption "Enable Compiler";
    };
  };
  config = {
    plugins = {
      compiler = lib.mkIf config.nevica.codeUtils.compiling.compiler.enable {
        enable = true;
        package = pkgs.vimPlugins.compiler-nvim;
      };
    };
  };
}
