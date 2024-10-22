{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.cc.enable = lib.mkEnableOption "Enable C/C++ support";
  };
  config = lib.mkIf config.nevica.languages.cc.enable {
    plugins = {
      treesitter.settings.ensure_installed = [
        "c"
        "cpp"
      ];
      lsp.servers.clangd = {
        enable = true;
        package = pkgs.clang-tools;
        filetypes = ["c" "cpp"];
      };
      none-ls.sources = {
        formatting = {
          clang_format = {
            enable = true;
            package = pkgs.clang-tools;
          };
        };
        diagnostics = {
          cppcheck = {
            enable = true;
            package = pkgs.cppcheck;
          };
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
  };
}
