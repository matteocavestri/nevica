{
  plugins.which-key = {
    enable = true;
    ignoreMissing = false;
    icons = {
      breadcrumb = "»";
      group = "+";
      separator = ""; # ➜
    };
    registrations = {
      "<leader>d" = "󰃤 Debugger";
      "<leader>f" = " Find";
      "<leader>g" = "󰊢 Git";
      "<leader>s" = " Search";
      "<leader>w" = "󰔚 Miscellaneous";
      "<leader>l" = " LSP";
      "<leader>c" = " Code";
      "<leader>t" = "󰙨Test";
    };
    window = {
      border = "none";
      winblend = 0;
    };
  };
}
