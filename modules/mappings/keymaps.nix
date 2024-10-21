{
  globals.mapleader = " ";

  keymaps = [
    # DEBUGGER
    {
      mode = "n";
      key = "<leader>dB";
      action = "
        <cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
      ";
      options = {
        silent = true;
        desc = "Breakpoint Condition";
      };
    }
    {
      mode = "n";
      key = "<leader>db";
      action = ":DapToggleBreakpoint<cr>";
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = ":DapContinue<cr>";
      options = {
        silent = true;
        desc = "Debug Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>da";
      action = "<cmd>lua require('dap').continue({ before = get_args })<cr>";
      options = {
        silent = true;
        desc = "Run with Args";
      };
    }
    {
      mode = "n";
      key = "<leader>dC";
      action = "<cmd>lua require('dap').run_to_cursor()<cr>";
      options = {
        silent = true;
        desc = "Run to cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>dg";
      action = "<cmd>lua require('dap').goto_()<cr>";
      options = {
        silent = true;
        desc = "Go to line (no execute)";
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      action = ":DapStepInto<cr>";
      options = {
        silent = true;
        desc = "Step into";
      };
    }
    {
      mode = "n";
      key = "<leader>dj";
      action = "
        <cmd>lua require('dap').down()<cr>
      ";
      options = {
        silent = true;
        desc = "Debug Down";
      };
    }
    {
      mode = "n";
      key = "<leader>dk";
      action = "<cmd>lua require('dap').up()<cr>";
      options = {
        silent = true;
        desc = "Debug Up";
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = "<cmd>lua require('dap').run_last()<cr>";
      options = {
        silent = true;
        desc = "Run Last";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action = ":DapStepOut<cr>";
      options = {
        silent = true;
        desc = "Step Out";
      };
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = ":DapStepOver<cr>";
      options = {
        silent = true;
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>dp";
      action = "<cmd>lua require('dap').pause()<cr>";
      options = {
        silent = true;
        desc = "Debug Pause";
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = ":DapToggleRepl<cr>";
      options = {
        silent = true;
        desc = "Toggle REPL";
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = "<cmd>lua require('dap').session()<cr>";
      options = {
        silent = true;
        desc = "Debug Session";
      };
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = ":DapTerminate<cr>";
      options = {
        silent = true;
        desc = "Debug Terminate";
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<cr>";
      options = {
        silent = true;
        desc = "Debug UI";
      };
    }
    {
      mode = "n";
      key = "<leader>dw";
      action = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
      options = {
        silent = true;
        desc = "Debug Widgets";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>de";
      action = "<cmd>lua require('dapui').eval()<cr>";
      options = {
        silent = true;
        desc = "Debug Eval";
      };
    }

    # TROUBLE
    {
      mode = "n";
      key = "<leader>clt";
      action = "<cmd>Trouble diagnostics<cr>";
      options = {
        silent = true;
        desc = "Trouble";
      };
    }
    {
      mode = "n";
      key = "<leader>cll";
      action = "<cmd>TodoQuickFix<cr>";
      options = {
        silent = true;
        desc = "Trouble Quickfix List";
      };
    }

    # LSPSAGA
    {
      mode = "n";
      key = "<leader>cld";
      action = "<cmd>Lspsaga finder def<CR>";
      options = {
        desc = "Goto Definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>clr";
      action = "<cmd>Lspsaga finder ref<CR>";
      options = {
        desc = "Goto References";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>clD";
      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = {
        desc = "Goto Declaration";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cli";
      action = "<cmd>Lspsaga finder imp<CR>";
      options = {
        desc = "Goto Implementation";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>clT";
      action = "<cmd>Lspsaga peek_type_definition<CR>";
      options = {
        desc = "Type Definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>clh";
      action = "<cmd>Lspsaga hover_doc<CR>";
      options = {
        desc = "LSP Hover";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>clo";
      action = "<cmd>Lspsaga outline<CR>";
      options = {
        desc = "LSP Outline";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>clR";
      action = "<cmd>Lspsaga rename<CR>";
      options = {
        desc = "LSP Rename";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        desc = "Code Action";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cd";
      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = {
        desc = "Line Diagnostics";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cn";
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      options = {
        desc = "Next Diagnostic";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ch";
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      options = {
        desc = "Previous Diagnostic";
        silent = true;
      };
    }

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
