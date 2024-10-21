{lib, ...}: {
  imports = [
    ./completion.nix
    ./snippet.nix
    ./highlighting.nix
  ];

  nevica.codeUtils = {
    completion.cmp.enable = lib.mkDefault true;
    snippet.luasnip.enable = lib.mkDefault true;
    highlighting.treesitter.enable = lib.mkDefault true;
  };
}
