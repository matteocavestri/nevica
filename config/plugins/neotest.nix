{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    neotest
    FixCursorHold-nvim
    neotest-python
    neotest-java
    neotest-go
    neotest-rust
  ];
  extraConfigLua = ''
     require("neotest").setup({
      adapters = {

        require("neotest-python")({
        dap = { justMyCode = false },
        args = {"--log-level", "DEBUG"},
        runner = "pytest",
        python = ".venv/bin/python",
        is_test_file = function(file_path)
            return vim.fn.fnamemodify(file_path, ':t'):match("^test_.*%.py$") ~= nil
        end,
        }),

        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" }
        }),

        require("neotest-rust") {
          args = { "--no-capture" },
        },

      },
      output = { enabled = true, open_on_run = true },
      summary = { enabled = true, },
    })
  '';
}
