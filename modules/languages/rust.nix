{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.rust.enable = lib.mkEnableOption "Enable Rust language support";
  };
  config = lib.mkIf config.nevica.languages.rust.enable {
    plugins = {
      rustaceanvim = {
        enable = true;
        package = pkgs.vimPlugins.rustaceanvim;
        settings = {
          server = {
            auto_attach = true;
          };
          dap = {
            autoload_configurations = true;
          };
          tools.enable_clippy = true;
          default_settings = {
            rust-analyzer = {
              check = {
                command = "clippy";
              };
              inlayHints = {
                lifetimeElisionHints = {
                  enable = "always";
                };
              };
            };
          };
        };
      };
    };
  };
}
