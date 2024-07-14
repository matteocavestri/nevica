{pkgs, ...}: {
  plugins = {
    lsp.servers = {
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        settings = {
          checkOnSave = true;
          check = {
            #command = "${pkgs.clippy}/bin/clippy-driver";
            command = "clippy";
          };
          # inlayHints = {
          #   enable = true;
          #   showParameterNames = true;
          #   parameterHintsPrefix = "<- ";
          #   otherHintsPrefix = "=> ";
          # };
          procMacro = {
            enable = true;
          };
        };
      };
    };
    #rustaceanvim = {
    #  enable = true;
    #  settings.server = {
    #    auto_attach = true;
    #  };
    #};
  };
}
