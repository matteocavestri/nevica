{
  plugins = {
    typescript-tools = {
      enable = true;
      onAttach = ''
        function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          --if vim.lsp.inlay_hint then
          --  vim.lsp.inlay_hint(bufnr, false)
          --end
        end
      '';
      settings = {
        tsserverFilePreferences = {
          # Inlay Hints
          includeInlayParameterNameHints = "all";
          includeInlayParameterNameHintsWhenArgumentMatchesName = true;
          includeInlayFunctionParameterTypeHints = true;
          includeInlayVariableTypeHints = true;
          includeInlayVariableTypeHintsWhenTypeMatchesName = true;
          includeInlayPropertyDeclarationTypeHints = true;
          includeInlayFunctionLikeReturnTypeHints = true;
          includeInlayEnumMemberValueHints = true;
        };
      };
    };
    ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = false;
    };
    ts-autotag = {
      enable = true;
    };
    lsp.servers = {
      eslint.enable = true;
      tsserver.enable = false;
    };
    lint.lintersByFt = {
      javascript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      typescript = ["eslint_d"];
      typescriptreact = ["eslint_d"];
    };
  };
}
