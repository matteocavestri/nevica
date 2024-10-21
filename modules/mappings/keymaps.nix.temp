{
  globals.mapleader = " ";

  keymaps = [
    # NEOTEST
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>";
      options = {
        desc = "Run File";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tT";
      action = "<cmd>lua require('neotest').run.run(vim.loop.cwd())<CR>";
      options = {
        desc = "Run All Test Files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tr";
      action = "<cmd>lua require('neotest').run.run()<CR>";
      options = {
        desc = "Run Nearest";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>";
      options = {
        desc = "Run Nearest with debugger";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<cmd>lua require('neotest').summary.toggle()<CR>";
      options = {
        desc = "Test Summary";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>to";
      action = "<cmd>lua require('neotest').output.open{ enter = true, auto_close = true }<CR>";
      options = {
        desc = "Test Output";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tO";
      action = "<cmd>lua require('neotest').output_panel.toggle()<CR>";
      options = {
        desc = "Test Output Panel";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tS";
      action = "<cmd>lua require('neotest').run.stop()<CR>";
      options = {
        desc = "Test Stop";
        silent = true;
      };
    }

    # GIT
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "LazyGit";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>gh";
      action = "gitsigns";
      options = {
        silent = true;
        desc = "  Hunks";
      };
    }
    {
      mode = "n";
      key = "<leader>ghb";
      action = ":Gitsigns blame_line<CR>";
      options = {
        silent = true;
        desc = "Blame line";
      };
    }
    {
      mode = "n";
      key = "<leader>ghd";
      action = ":Gitsigns diffthis<CR>";
      options = {
        silent = true;
        desc = "Diff This";
      };
    }
    {
      mode = "n";
      key = "<leader>ghp";
      action = ":Gitsigns preview_hunk<CR>";
      options = {
        silent = true;
        desc = "Preview hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>ghR";
      action = ":Gitsigns reset_buffer<CR>";
      options = {
        silent = true;
        desc = "Reset Buffer";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ghr";
      action = ":Gitsigns reset_hunk<CR>";
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ghs";
      action = ":Gitsigns stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>ghS";
      action = ":Gitsigns stage_buffer<CR>";
      options = {
        silent = true;
        desc = "Stage Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>ghu";
      action = ":Gitsigns undo_stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Undo Stage Hunk";
      };
    }

    # TAGBAR
    {
      mode = "n";
      key = "<leader>ct";
      action = "<cmd>TagbarToggle<CR>";
      options = {
        desc = "Code Tagbar";
      };
    }

    # NEORG
    {
      mode = "n";
      key = "<leader>no";
      action = ":Neorg<CR>";
      options = {
        desc = "Neorg";
      };
    }
    {
      mode = "n";
      key = "<leader>nw";
      action = ":Neorg workspace<CR>";
      options = {
        desc = "Default workspace";
      };
    }
    {
      mode = "n";
      key = "<leader>ni";
      action = ":Neorg index<CR>";
      options = {
        desc = "Neorg index";
      };
    }
    {
      mode = "n";
      key = "<leader>nj";
      action = ":Neorg journal today<CR>";
      options = {
        desc = "Today's journal";
      };
    }
    {
      mode = "n";
      key = "<leader>nm";
      action = ":Neorg inject-metadata<CR>";
      options = {
        desc = "Inject metadata";
      };
    }
    {
      mode = "n";
      key = "<leader>nt";
      action = ":Neorg toc<CR>";
      options = {
        desc = "Table of Content";
      };
    }
    {
      mode = "n";
      key = "<leader>nu";
      action = ":Neorg update-metadata<CR>";
      options = {
        desc = "Update metadata";
      };
    }
    {
      mode = "n";
      key = "<leader>ns";
      action = ":Neorg generate-workspace-summary<CR>";
      options = {
        desc = "Generate workspace summary";
      };
    }
    # COMPILER
    {
      mode = "n";
      key = "<leader>cc";
      action = ":CompilerOpen<CR>";
      options = {
        desc = "Code Compile";
      };
    }
  ];
}
