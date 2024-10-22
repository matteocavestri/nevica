{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.debugging = {
      dap = {
        enable = lib.mkEnableOption "Enable DAP";
        ui.enable = lib.mkEnableOption "Enable DapUI";
        virtualText.enable = lib.mkEnableOption "Enable Dap Virtual text";
      };
    };
  };
  config = {
    plugins = {
      dap = lib.mkIf config.nevica.codeUtils.debugging.dap.enable {
        enable = true;
        package = pkgs.vimPlugins.nvim-dap;
        adapters = {};
        configurations = {};
        signs = {
          dapBreakpoint = {
            text = "●";
            texthl = "DapBreakpoint";
          };
          dapBreakpointCondition = {
            text = "●";
            texthl = "DapBreakpointCondition";
          };
          dapLogPoint = {
            text = "◆";
            texthl = "DapLogPoint";
          };
        };
        extensions = {
          dap-ui = lib.mkIf config.nevica.codeUtils.debugging.dap.ui.enable {
            enable = true;
            package = pkgs.vimPlugins.nvim-dap-ui;
            floating.mappings = {
              close = ["<ESC>" "q"];
            };
          };
          dap-virtual-text = lib.mkIf config.nevica.codeUtils.debugging.dap.virtualText.enable {
            enable = true;
            package = pkgs.vimPlugins.nvim-dap-virtual-text;
          };
        };
      };
    };
  };
}
