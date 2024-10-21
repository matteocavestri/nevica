{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.testing = {
      neotest.enable = lib.mkEnableOption "Enable Neotest";
    };
  };
  config = {
    plugins = {
      neotest = lib.mkIf config.nevica.codeUtils.testing.neotest.enable {
        enable = true;
        package = pkgs.vimPlugins.neotest;
        settings = {
          output = {
            enabled = true;
            open_on_run = true;
          };
          output_panel = {
            enabled = true;
            open = "botright split | resize 15";
          };
          quickfix = {
            enabled = true;
            open = false;
          };
          summary = {
            enabled = true;
          };
          highlights = {
            adapter_name = "NeotestAdapterName";
            border = "NeotestBorder";
            dir = "NeotestDir";
            expand_marker = "NeotestExpandMarker";
            failed = "NeotestFailed";
            file = "NeotestFile";
            focused = "NeotestFocused";
            indent = "NeotestIndent";
            marked = "NeotestMarked";
            namespace = "NeotestNamespace";
            passed = "NeotestPassed";
            running = "NeotestRunning";
            select_win = "NeotestWinSelect";
            skipped = "NeotestSkipped";
            target = "NeotestTarget";
            test = "NeotestTest";
            unknown = "NeotestUnknown";
            watching = "NeotestWatching";
          };
          diagnostic = {
            enabled = true;
            severity = "error";
          };
          discovery.enabled = true;
          floating = {
            border = "rounded";
          };
          status = {
            enabled = true;
            signs = true;
            virtual_text = true;
          };
          watch = {
            enable = true;
          };
        };
      };
    };
  };
}
