{lib, ...}: {
  imports = [
    ./startpage.nix
    ./statusbar.nix
    ./colorscheme.nix
    ./bufferbar.nix
  ];

  nevica.ui = {
    startpage = {
      dashboard.enable = lib.mkDefault true;
    };
    statusbar = {
      lualine.enable = lib.mkDefault true;
    };
    colorscheme = {
      base16.enable = lib.mkDefault true;
    };
    bufferbar = {
      bufferline.enable = lib.mkDefault true;
    };
  };
}
