{ pkgs, ... }:
{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings = {
      update_in_insert = false;
    #  on_attach = ''
    #    function(client, bufnr)
    #      if client.supports_method "textDocument/formatting" then
    #        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    #        vim.api.nvim_create_autocmd("BufWritePre", {
    #          group = augroup,
    #          buffer = bufnr,
    #          callback = function()
    #            vim.lsp.buf.format { bufnr = bufnr }
    #          end,
    #        })
    #      end
    #    end
    #  '';
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
