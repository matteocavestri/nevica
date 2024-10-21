{
  keymaps = [
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
  ];
}
