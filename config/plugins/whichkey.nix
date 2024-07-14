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
      #   "<leader>t" = " Terminal";
      "<leader>d" = "󰃤 Debugger";
      "<leader>f" = " Find";
      "<leader>g" = "󰊢 Git";
      "<leader>s" = " Whichkey";
      "<leader>u" = "󰔚 Miscellaneous";
    };
    window = {
      border = "none";
      winblend = 0;
    };
  };
}
