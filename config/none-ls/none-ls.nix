{pkgs, ...}: {
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings = {
      update_in_insert = false;
    };
    sources = {
      code_actions = {
        gitsigns.enable = true;
      };
      formatting = {
        # Yaml
        yamlfmt = {
          enable = true;
        };
        # Various
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
          withArgs = ''
            {
              extra_args = { "--no-semi", "--single-quote" },
            }
          '';
        };
      };
    };
  };
}
