{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.python.enable = lib.mkEnableOption "Enable python support";
  };
  config = lib.mkIf config.nevica.languages.python.enable {
    plugins = {
      lsp.servers = {
        pyright = {
          enable = true;
          package = pkgs.pyright;
        };
        ruff_lsp = {
          enable = true;
          package = pkgs.ruff-lsp;
        };
      };
      none-ls.sources = {
        formatting = {
          black = {
            enable = true;
            package = pkgs.python3.pkgs.black;
            settings = ''
              {
                extra_args = { "--fast" },
              }
            '';
          };
        };
        diagnostics = {
          pylint = {
            enable = true;
            package = pkgs.pylint;
          };
        };
      };
      dap.extensions = {
        dap-python = {
          enable = true;
          package = pkgs.vimPlugins.nvim-dap-python;
        };
      };
    };
  };
}
