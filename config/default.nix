{
  imports = [
    # -------------- Coding --------------------
    # ----- Color highlighting ------------
    ./highlighting/treesitter.nix
    # ----- Language Servers --------------
    ./lsp/default.nix
    # ----- Formatters & Linters ----------
    ./none-ls/default.nix
    # ----- Languages configurations ------
    ./languages/default.nix
    # ----- Frameworks configurations ----
    ./frameworks/default.nix
    # ----- Debugger ----------------------
    ./dap/dap.nix
    # ----- Tests -------------------------
    ./test/default.nix
    # ----- Code completion ---------------
    ./completion/default.nix
    # ----- Snippets ----------------------
    ./snippets/luasnip.nix

    # -------------- Look ---------------------
    # ----- Interface ---------------------
    ./ui/default.nix
    # ----- Colorschemes ------------------
    ./colorscheme/colorscheme.nix

    # -------------- Other ---------------------
    # ----- Plugins -----------------------
    ./plugins/default.nix
    # ----- Keymaps -----------------------
    ./keymaps.nix
    # ----- Options -----------------------
    ./options.nix
    # ----- Neorg -------------------------
    ./plugins/neorg.nix
    # ----- Performance -------------------
    ./performance.nix
  ];
}
