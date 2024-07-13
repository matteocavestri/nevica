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
  }
