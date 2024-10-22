{
  lib,
  config,
  ...
}: {
  options = {
    nevica.nixvim.performance.enableRecommended = lib.mkEnableOption "Enable Recommended Nixvim performance improvement";
  };
  config = {
    performance.byteCompileLua = lib.mkIf config.nevica.nixvim.performance.enableRecommended {
      enable = true;
      configs = true;
      initLua = true;
      nvimRuntime = true;
      plugins = true;
    };
  };
}
