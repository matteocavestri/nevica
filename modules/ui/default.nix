{lib, ...}: {
  imports = [
    ./startpage.nix
    ./statusbar.nix
  ];

  nevica.ui = {
    startpage = {
      dashboard.enable = lib.mkDefault true;
    };
    statusbar = {
      lualine.enable = lib.mkDefault true;
    };
  };
}
