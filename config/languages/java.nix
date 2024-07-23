{pkgs, ...}: {
  plugins = {
    nvim-jdtls = {
      enable = true;
      cmd = [
        "${pkgs.jdt-language-server}/bin/jdtls"
      ];
      # configuration = "/path/to/configuration";
      data = "~/.cache/jdtls/workspace";
      settings = {
        java = {
          signatureHelp = true;
          completion = true;
        };
      };
      initOptions = {
        bundles = [
          "${pkgs.vscode-extensions.vscjava.vscode-java-debug}/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.50.0.jar"
          "${pkgs.vscode-extensions.vscjava.vscode-java-test}/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-0.40.1.jar"
        ];
      };
    };
    dap.configurations = {
      java = [
        {
          type = "java";
          request = "launch";
          name = "Debug (Attach) - Remote";
          hostName = "127.0.0.1";
          port = 5005;
        }
      ];
    };
    none-ls.sources = {
      diagnostics = {
        checkstyle = {
          enable = true;
          settings = ''
            {
              extra_args = { "-c", "/google_checks.xml" }, -- /sun_checks.xml /google_checks.xml
            }
          '';
        };
      };
    };
    # FIX: Neotest doesn't work with java
    neotest.adapters.java = {
      enable = true;
    };
  };
  extraConfigLua = ''
    require("neotest").setup({
     adapters = {
       require("neotest-java")({
         ignore_wrapper = false,
         junit_jar = nil,
       }),
     },
    })
  '';
}
