{pkgs, ...}: {
  plugins = {
    lsp.servers = {
      kotlin_language_server = {
        enable = true;
      };
    };
    none-ls.sources = {
      formatting = {
        ktlint = {
          enable = true;
        };
      };
      diagnostics = {
        ktlint = {
          enable = true;
        };
      };
    };
  };
  # extraPlugins = [
  #   (pkgs.vimUtils.buildVimPlugin {
  #     name = "nvim-dap-kotlin";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "Mgenuit";
  #       repo = "nvim-dap-kotlin";
  #       rev = "d3c491a13d54ef5a288f56075e74385daffc70de";
  #       sha256 = "01a33qa0x4m43nlfddlm52id8i9v8lkdqxknczc4shv8anaw2gbj";
  #     };
  #   })
  # ];
  # extraConfigLua = ''
  #   require('nvim-dap-kotlin').setup {
  #       dap_command = "kotlin-debug-adapter",
  #       project_root = "''${workspaceFolder}",
  #       enable_logging = false,
  #       log_file_path = "",
  #   }
  # '';
}
