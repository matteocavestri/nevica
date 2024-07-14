{
  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native = {
        enable = true;
      };
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = true;
          };
        };
      };
      undo = {
        enable = true;
      };
    };
    # If you'd prefer Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
    settings = {
      defaults = {
        mappings = {
          i = {
            "<esc>" = {
              __raw = ''
                function(...)
                  return require("telescope.actions").close(...)
                end'';
            };
          };
        };
      };
    };
    keymaps = {
      # Find mappings
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find Files";
      };
      "<leader>fa" = {
        action = "live_grep";
        options.desc = "Live Grep";
      };
      "<leader>fc" = {
        action = "command_history";
        options.desc = "Find Command History";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Find Recent";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Find Buffers";
      };
      "<leader>fk" = {
        action = "keymaps";
        options.desc = "Find Keymaps";
      };
      "<leader>fm" = {
        action = "marks";
        options.desc = "Find Mark";
      };

      # Git mappings
      "<leader>gf" = {
        action = "git_files";
        options.desc = "Git files";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Git Commits";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Git Status";
      };

      # Search mappings
      "<leader>sa" = {
        action = "autocommands";
        options.desc = "Search Auto Commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Search Buffer";
      };
      "<leader>sc" = {
        action = "command_history";
        options.desc = "Search Command History";
      };
      "<leader>sC" = {
        action = "commands";
        options.desc = "Search Commands";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "Serch Help pages";
      };
      "<leader>sH" = {
        action = "highlights";
        options.desc = "Search Highlight Groups";
      };
      "<leader>sM" = {
        action = "man_pages";
        options.desc = "Search Man pages";
      };
      "<leader>so" = {
        action = "vim_options";
        options.desc = "Search Vim options";
      };
      "<leader>sR" = {
        action = "resume";
        options.desc = "Search Resume";
      };
      "<leader>st" = {
        action = "colorscheme";
        options.desc = "Search Colorscheme";
      };

      # Options
      "<leader>wD" = {
        action = "diagnostics";
        options.desc = "Workspace diagnostics";
      };
    };
  };
  keymaps = [
    # {
    #   mode = "n";
    #   key = "<leader>,";
    #   action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
    #   options = {
    #     desc = "Switch Buffer";
    #   };
    # }
  ];
  extraConfigLua = ''
    local telescope = require('telescope')
    telescope.setup{
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
    }
  '';
}
