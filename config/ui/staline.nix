{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "staline.nvim";
      version = "2024-02-05";
      src = pkgs.fetchFromGitHub {
        owner = "tamton-aquib";
        repo = "staline.nvim";
        rev = "d337bc9b343df3328921ef4c3f8ff604102d0201";
        hash = "sha256-HkuVio/F8HOb6k9N8LkYdQ1vheuyjrqP25RforoWZSk=";
      };
    })
  ];
  extraConfigLua = ''
      require("staline").setup({
      sections = {
        left = { "-mode", "cool_symbol", "branch" },
        mid = { "lsp_name" },
        right = { "lsp", "file_name", "line_column" },
      },
      inactive_sections = {
        left = { "-mode", "cool_symbol", "branch" },
        mid = { "lsp_name" },
        right = { "lsp", "file_name", "line_column" },
      },
      defaults = {
        left_separator = " ",
        right_separator = "  ",
        branch_symbol = " ",
        lsp_client_symbol = " ",
        null_ls_symbol = "",
        mod_symbol = "",
        cool_symbol = " ",
        line_column = "[%l/%L]" ,
        inactive_color = "#80a6f2",
        inactive_bgcolor = "none",
        expand_null_ls = false,
        lsp_client_character_length = 35,
      },
      special_table = {
        lazy = { "Plugins", "💤 " },
        TelescopePrompt = { "Telescope", "  " },
        oil = { "Oil", "󰏇 " },
        lazygit = { "LazyGit", " " },
        ["neo-tree"] = {"NeoTree", "  "},
      },
      lsp_symbols = {
        Error=" ",
        Info=" ",
        Warn=" ",
        Hint=" ",
      },
      mode_icons = {
        ["n"] = "NORMAL",
        ["no"] = "NORMAL",
        ["nov"] = "NORMAL",
        ["noV"] = "NORMAL",
        ["niI"] = "NORMAL",
        ["niR"] = "NORMAL",
        ["niV"] = "NORMAL",
        ["i"] = "INSERT",
        ["ic"] = "INSERT",
        ["ix"] = "INSERT",
        ["s"] = "INSERT",
        ["S"] = "INSERT",
        ["v"] = "VISUAL",
        ["V"] = "VISUAL",
        [""] = "VISUAL",
        ["r"] = "REPLACE",
        ["r?"] = "REPLACE",
        ["R"] = "REPLACE",
        ["c"] = "COMMAND",
        ["t"] = "TERMINAL",
      },
    })
  '';
}
