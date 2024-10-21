{lib, ...}: {
  imports = [
    ./telescope.nix
    ./mini.nix
  ];

  nevica.utils = {
    telescope = {
      enable = lib.mkDefault true;
      fzf-native.enable = lib.mkDefault true;
      ui-select.enable = lib.mkDefault true;
      undo.enable = lib.mkDefault true;
    };
  };
}