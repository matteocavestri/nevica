{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    neotest
    FixCursorHold-nvim
    neotest-python
    neotest-java
    neotest-go
    neotest-rust
  ];
  extraConfigLua = ''
     require("neotest").setup({
      adapters = { },
      output = { enabled = true, open_on_run = true },
      summary = { enabled = true, },
    })
  '';
}
