{lib, ...}: {
  imports = [
    ./performance.nix
  ];

  nevica.nixvim = {
    performance.enableRecommended = lib.mkDefault true;
  };
}
