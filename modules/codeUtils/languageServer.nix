{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.languageServer = {
      enable = lib.mkEnableOption "Enable Language Server Prototcol";
      trouble.enable = lib.mkEnableOption "Enable Trouble";
      lspSaga.enable = lib.mkEnableOption "Enable lspSaga";
    };
  };
  config = {
    plugins = {
      lsp = lib.mkIf config.nevica.codeUtils.languageServer.enable {
        enable = true;
        package = pkgs.vimPlugins.nvim-lspconfig;
        capabilities = "offsetEncoding = { 'utf-8', 'utf-16'}";
        servers = {};
      };
      trouble = lib.mkIf config.nevica.codeUtils.languageServer.trouble.enable {
        enable = true;
        package = pkgs.vimPlugins.trouble-nvim;
        settings = {
          auto_close = true;
        };
      };
      lspsaga = lib.mkIf config.nevica.codeUtils.languageServer.lspSaga.enable {
        enable = true;
        package = pkgs.vimPlugins.lspsaga-nvim;
        beacon.enable = true;
        ui = {
          border = "rounded"; # One of none, single, double, rounded, solid, shadow
          codeAction = "💡"; # Can be any symbol you want 💡
        };
        hover = {
          openCmd = "!floorp"; # Choose your browser
          openLink = "gx";
        };
        diagnostic = {
          borderFollow = true;
          diagnosticOnlyCurrent = false;
          showCodeAction = true;
        };
        symbolInWinbar = {
          enable = true; # Breadcrumbs
        };
        codeAction = {
          extendGitSigns = false;
          showServerName = true;
          onlyInCursor = true;
          numShortcut = true;
          keys = {
            exec = "<CR>";
            quit = ["<Esc>" "q"];
          };
        };
        lightbulb = {
          enable = false;
          sign = false;
          virtualText = true;
        };
        implement = {
          enable = false;
        };
        rename = {
          autoSave = false;
          keys = {
            exec = "<CR>";
            quit = ["<C-k>" "<Esc>"];
            select = "x";
          };
        };
        outline = {
          autoClose = true;
          autoPreview = true;
          closeAfterJump = true;
          layout = "normal"; # normal or float
          winPosition = "right"; # left or right
          keys = {
            jump = "e";
            quit = "q";
            toggleOrJump = "o";
          };
        };
        scrollPreview = {
          scrollDown = "<C-f>";
          scrollUp = "<C-b>";
        };
      };
    };
    extraConfigLua = lib.mkIf config.nevica.codeUtils.languageServer.enable ''
      local _border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = _border
        }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = _border
        }
      )

      vim.diagnostic.config{
        float={border=_border}
      };

      require('lspconfig.ui.windows').default_options = {
        border = _border
      }
    '';
  };
}
