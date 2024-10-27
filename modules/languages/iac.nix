{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.languages.iac.enable = lib.mkEnableOption "Enable Infrastructure as Code";
  };

  config = lib.mkIf config.nevica.languages.iac.enable {
    plugins = {
      treesitter.settings.ensure_installed = [
        "yaml"
      ];
      lsp.servers = {
        # Generic language server for yaml (for example kubernetes)
        yamlls = {
          enable = true;
          package = pkgs.yaml-language-server;
        };
        # Docker compose language server. It works in compose.yaml or compose.yml
        docker_compose_language_service = {
          enable = true;
          package = pkgs.docker-compose-language-service;
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
        # Dockerfile language server
        dockerls = {
          enable = true;
          package = pkgs.dockerfile-language-server-nodejs;
        };
      };
      none-ls.sources = {
        diagnostics = {
          hadolint.enable = true;
        };
      };
      lsp-format = {
        lspServersToEnable = [
          "dockerls"
        ];
      };
      schemastore = {
        enable = true;
        package = pkgs.vimPlugins.SchemaStore-nvim;
        json.enable = false;
        yaml.enable = true;
      };
    };
  };
}
