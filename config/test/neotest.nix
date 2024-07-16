{pkgs, ...}: {
  plugins.neotest = {
    enable = true;
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
        symbol_queries = {
          python = ''
            (import_from_statement (_ (identifier) @symbol))
            (import_statement (_ (identifier) @symbol))
          '';
        };
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    # neotest-python
    neotest-java
    neotest-go
    neotest-rust
    # (pkgs.vimUtils.buildVimPlugin {
    #   pname = "neotest-vim-test";
    #   version = "2023-04-17";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "nvim-neotest";
    #     repo = "neotest-vim-test";
    #     rev = "75c4228882ae4883b11bfce9b8383e637eb44192";
    #     sha256 = "12ix1lzmqlk3iyngaafby9c02fcl9d5iva965miwxfljvmibjnbw";
    #   };
    # })
  ];
  #extraConfigLua = ''
  #   require("neotest").setup({
  #    adapters = {
  #      require "neotest-vim-test" {
  #        ignore_file_types = { "python", "go", "rust", "java", "vim", "lua", "javascript", "typescript" },
  #      },
  #    },
  #  })
  #'';
}
