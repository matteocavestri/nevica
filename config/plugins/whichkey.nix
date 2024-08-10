{helpers, ...}: let
  # TODO: use the upcoming `plugins.which-key.settings` options
  registrations = [
    {
      __unkeyed-1 = "<leader>d";
      group = "Debugger";
    }
    {
      __unkeyed-1 = "<leader>f";
      group = "Find";
    }
    {
      __unkeyed-1 = "<leader>g";
      group = "Git";
    }
    {
      __unkeyed-1 = "<leader>s";
      group = "Search";
    }
    {
      __unkeyed-1 = "<leader>w";
      group = "Miscellaneous";
    }
    {
      __unkeyed-1 = "<leader>c";
      group = "Code";
    }
    {
      __unkeyed-1 = "<leader>t";
      group = "Test";
    }
    {
      __unkeyed-1 = "<leader>b";
      group = "Buffers";
    }
    {
      __unkeyed-1 = "<leader>n";
      group = "Neorg";
    }
  ];
in {
  plugins.which-key = {
    enable = true;
    # ignoreMissing = false;
    icons = {
      breadcrumb = "»";
      group = "+";
      separator = ""; # ➜
    };
    # settings.spec = {
    #   "<leader>d" = "Debugger";
    #   "<leader>f" = "Find";
    #   "<leader>g" = "Git";
    #   "<leader>s" = "Search";
    #   "<leader>w" = "Miscellaneous";
    #   "<leader>l" = "Lsp";
    #   "<leader>c" = "Code";
    #   "<leader>t" = "Test";
    #   "<leader>b" = "Buffers";
    #   "<leader>n" = "Neorg";
    # };
    # window = {
    #   border = "none";
    #   winblend = 0;
    # };
  };
  extraConfigLua = ''
    -- Register which-key groups
    require('which-key').add(${helpers.toLuaObject registrations})
  '';
}
