{
  plugins = {
    lsp = {
      enable = true;
      capabilities = "offsetEncoding = { 'utf-8', 'utf-16'}";
      servers = {};
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    for _, range in ipairs(symbols) do
      local err, defs = self.lsp_client.request.textDocument_definition({
        position = { line = range[1], character = range[2] },
        textDocument = { uri = path_uri },
      }, nil, { timeout = 1000 })

      if err then
        logger.debug("Error getting symbol definitions for", path, ":", err)
      end

      if defs ~= nil and type(defs[1]) ~= "table" then
        defs = { defs }
      end

      for _, def in ipairs(defs or {}) do
        dependency_uris[def.uri or def.targetUri] = true
      end
    end
  '';
}
