{lib, ...}: {
  imports = [
    ./performance.nix
    ./options.nix
  ];

  nevica.nixvim = {
    performance.enableRecommended = lib.mkDefault true;
    options.enableRecommended = lib.mkDefault true;
  };
}
