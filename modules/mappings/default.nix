{lib, ...}: {
  imports = [
    ./whichkey.nix
    ./neotree-keymaps.nix
    ./telescope-keymaps.nix
    ./notify-keymaps.nix
    ./bufferline-keymaps.nix
  ];

  globals.mapleader = " ";

  nevica.mappings = {
    whichKey.enable = lib.mkDefault true;
  };
}
