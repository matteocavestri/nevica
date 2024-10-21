{lib, ...}: {
  imports = [
    ./ui
    ./nixvim
    ./utils
    ./codeUtils
    ./mappings
    ./languages
  ];

  nevica = {
    # NEVICA UI DEFAULT VALUES
    ui = {
      # Dashboard is enabled by default
      startpage = {
        dashboard.enable = lib.mkDefault true;
      };
      # Lualine is enabled by default
      statusbar = {
        lualine.enable = lib.mkDefault true;
      };
      # The default colorscheme is catppuccin mocha.
      # base16 is enabled, so you can see other themes using <leader>st
      # If you want to use base16 disable catppuccin. (Catppuccin has better support)
      colorscheme = {
        base16.enable = lib.mkDefault true;
        catppuccin.enable = lib.mkDefault true;
      };
      bufferbar = {
        bufferline.enable = lib.mkDefault true;
      };
      noice.enable = lib.mkDefault true;
      filetree = {
        neotree.enable = lib.mkDefault true;
      };
    };

    # NEVICA NIXVIM DEFAULT VALUES
    nixvim = {
      # Recommended Nixvim performance tuning
      performance.enableRecommended = lib.mkDefault true;
      options.enableRecommended = lib.mkDefault true;
    };

    # NEVICA UTILS DEFAULT VALUES
    utils = {
      # Telescope and telescope plugins are enabled by default.
      # You can override it using lib.mkForce (e.g. nevica.utils.telescope.undo.enable = lib.mkForce false;)
      telescope = {
        enable = lib.mkDefault true;
        fzf-native.enable = lib.mkDefault true;
        ui-select.enable = lib.mkDefault true;
        undo.enable = lib.mkDefault true;
      };
      # Mini is enabled by default
      mini = {
        enable = lib.mkDefault true;
      };
      notify = {
        nvimNotify.enable = lib.mkDefault true;
      };
      terminal = {
        toggleterm.enable = lib.mkDefault true;
      };
    };

    # NEVICA CODEUTILS DEFAULT VALUES
    codeUtils = {
      completion.cmp.enable = lib.mkDefault true;
      snippet.luasnip.enable = lib.mkDefault true;
      highlighting.treesitter.enable = lib.mkDefault true;
      languageServer = {
        enable = lib.mkDefault true;
        trouble.enable = lib.mkDefault true;
        lspSaga.enable = lib.mkDefault true;
      };
      formatting = {
        lspFormat.enable = lib.mkDefault true;
        noneLs.enable = lib.mkDefault true;
      };
      debugging.dap = {
        enable = lib.mkDefault true;
        ui.enable = lib.mkDefault true;
        virtualText.enable = lib.mkDefault true;
      };
    };

    # NEVICA MAPPINGS DEFAULT VALUES
    mappings = {
      whichKey.enable = lib.mkDefault true;
    };

    # NEVICA LANGUAGES DEFAULT VALUES
    languages = {
      nix.enable = lib.mkDefault true;
    };
  };
}
