{pkgs, ...}: {
  plugins = {
    lsp.servers = {
      docker-compose-language-service = {
        enable = true;
        filetypes = [
          "yaml"
          "yml"
        ];
        cmd = [
          "${pkgs.docker-compose-language-service}/bin/docker-compose-langserver"
          "--stdio"
        ];
        rootDir = {
          __raw = ''
            function(fname)
              local filename = vim.fn.fnamemodify(fname, ":t")
              if filename == "compose.yml" or filename == "compose.yaml" then
                return vim.fn.fnamemodify(fname, ":p:h")
              end
            end,
          '';
        };
      };
      dockerls = {
        enable = true;
      };
    };
    none-ls.sources = {
      diagnostics = {
        hadolint.enable = true;
      };
    };
  };
}
