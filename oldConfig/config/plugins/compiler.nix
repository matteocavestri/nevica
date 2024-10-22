{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    compiler-nvim
  ];
}
