{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.utils.telescope = {
      enable = lib.mkEnableOption "Enable Telescope for better navigation";
      fzf-native.enable = lib.mkEnableOption "Enable Telescope fzf-native extensions with customizations";
      ui-select.enable = lib.mkEnableOption "Enable Telescope ui-select extensions with customizations";
      undo.enable = lib.mkEnableOption "Enable Telescope undo extension with customizations";
    };
  };
  config = {
    # Basic install of Telescope
    plugins.telescope = lib.mkIf config.nevica.utils.telescope.enable {
      enable = true;
      package = pkgs.vimPlugins.telescope-nvim;
      batPackage = pkgs.bat;
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "^output/"
            "^data/"
            "%.ipynb"
          ];
          layout_config = {
            prompt_position = "top";
          };
          sorting_strategy = "ascending";
        };
      };
      extensions = {
        # fzf-native plugin definition with some edit (fuzzy, case_mode ...)
        fzf-native = lib.mkIf config.nevica.utils.telescope.fzf-native.enable {
          enable = true;
          package = pkgs.vimPlugins.telescope-fzf-native-nvim;
          settings = {
            case_mode = "smart_case";
            fuzzy = true;
            override_file_sorter = false;
            override_generic_sorter = true;
          };
        };
        # ui-select plugin definition
        ui-select = {
          enable = true;
          package = pkgs.vimPlugins.telescope-ui-select-nvim;
          settings = {
            specific_opts = {
              codeactions = false;
            };
          };
        };
        # Undo plugin definition with custom edits. There are also mappings for Normal and Insert mode
        undo = {
          enable = true;
          package = pkgs.vimPlugins.telescope-undo-nvim;
          settings = {
            entry_format = "state #$ID, $STAT, $TIME";
            side_by_side = true;
            time_format = "%H:%M %d-%m-%Y"; # European DateTime
            use_delta = true;
            use_custom_command = [
              "bash"
              "-c"
              "echo '$DIFF' | delta"
            ];
            vim_diff_opts = {
              ctxlen = 8;
            };
            mappings = {
              i = {
                "<c-cr>" = "require('telescope-undo.actions').restore";
                "<cr>" = "require('telescope-undo.actions').yank_additions";
                "<s-cr>" = "require('telescope-undo.actions').yank_deletions";
              };
              n = {
                Y = "require('telescope-undo.actions').yank_deletions";
                u = "require('telescope-undo.actions').restore";
                y = "require('telescope-undo.actions').yank_additions";
              };
            };
          };
        };
      };
    };
  };
}
