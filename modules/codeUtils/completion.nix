{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.codeUtils.completion = {
      cmp.enable = lib.mkEnableOption "Enable cmp completion";
    };
  };
  config = {
    plugins = {
      cmp = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.nvim-cmp;
        autoEnableSources = false;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "dictionary";}
            {name = "emoji";}
            {name = "greek";}
            {name = "luasnip";}
          ];
          experimental = {
            ghost_text = true;
          };
          performance = {
            debounce = 60;
            fetching_timeout = 200;
            max_view_entries = 30;
          };
          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
            };
            documentation = {
              border = "rounded";
            };
          };
          formatting = {
            fields = ["kind" "abbr" "menu"];
            expandable_indicator = true;
          };
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<TAB>'] = cmp.mapping.confirm({ select = true }),
                ['<TAB>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
              })
            '';
          };
        };
      };
      cmp-nvim-lsp = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.cmp-nvim-lsp;
      };
      cmp-path = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.cmp-path;
      };
      cmp-buffer = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.cmp-buffer;
      };
      cmp-dictionary = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.cmp-dictionary;
      };
      cmp-emoji = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.cmp-emoji;
      };
      cmp-greek = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.cmp-greek;
      };
      cmp_luasnip = lib.mkIf config.nevica.codeUtils.completion.cmp.enable {
        enable = true;
        package = pkgs.vimPlugins.cmp_luasnip;
      };
    };
  };
}
