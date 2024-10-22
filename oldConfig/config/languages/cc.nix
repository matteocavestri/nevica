{
  plugins = {
    lsp.servers = {
      clangd = {
        enable = true;
        filetypes = ["c" "cpp"];
      };
    };
    none-ls.sources = {
      formatting = {
        clang_format.enable = true;
      };
      diagnostics = {
        cppcheck.enable = true;
      };
    };
  };
  extraConfigLua = ''
    local dap = require("dap")
    dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
    }
    local dap = require("dap")
    dap.configurations.c = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
      	return vim.fn.input('Path of the executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = "''${workspaceFolder}",
    },
    }
    local dap = require("dap")
    dap.configurations.cpp = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = function()
      	return vim.fn.input('Path of the executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = "''${workspaceFolder}",
    },
    }
  '';
  # TODO: Configure gtest
}
