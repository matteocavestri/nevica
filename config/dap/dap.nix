{pkgs, ...}: {
  plugins.dap = {
    enable = true;
    adapters = {
      # FIX: C/Cpp debugger
      executables = {
        gdb = {
          command = "gdb";
          args = ["-i" "dap"];
        };
      };
    };
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
      dap-ui = {
        enable = true;
        floating.mappings = {
          close = ["<ESC>" "q"];
        };
      };
      dap-virtual-text = {
        enable = true;
      };
    };
    configurations = {
      c = [
        {
          type = "gdb";
          request = "launch";
          name = "Launch";
          program = ''
            function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end
          '';
        }
      ];
    };
  };
}
