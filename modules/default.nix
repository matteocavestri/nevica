{lib, ...}: {
  imports = [
    ./ui
    ./nixvim
    ./utils
    ./codeUtils
    ./mappings
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
      colorscheme = {
        base16.enable = lib.mkDefault true;
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
      lsp.enable = lib.mkDefault true;
    };

    # NEVICA MAPPINGS DEFAULT VALUES
    mappings = {
      whichKey.enable = lib.mkDefault true;
    };
  };
}
