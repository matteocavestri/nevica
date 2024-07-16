{pkgs, ...}: {
  files."after/ftplugin/norg.lua" = {
    localOpts.conceallevel = 2;
  };
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults".__empty = null;
      "core.concealer".__empty = null;
      "core.completion".config.engine = "nvim-cmp";
      "core.qol.toc".config.close_after_use = true;
      "core.summary".__empty = null;
      "core.itero".__empty = null;
      "core.ui.calendar".__empty = null;
      "core.promo".__empty = null;
      "core.keybinds".config = {
        default_keybinds = true;
        preset = "neorg";
      };
      "core.dirman" = {
        config = {
          workspaces = {
            home = "~/notes/home";
            work = "~/notes/work";
          };
          default_workspace = "home";
        };
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    neorg-telescope
    (pkgs.vimUtils.buildVimPlugin {
      name = "lua-utils";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-neorg";
        repo = "lua-utils.nvim";
        rev = "e565749421f4bbb5d2e85e37c3cef9d56553d8bd";
        sha256 = "0bnl2kvxs55l8cjhfpa834bm010n8r4gmsmivjcp548c076msagn";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "pathlib";
      src = pkgs.fetchFromGitHub {
        owner = "pysan3";
        repo = "pathlib.nvim";
        rev = "7a5a6facd29e306bc73a37719fa67c0d2226f852";
        sha256 = "04ppkwlg779iyja5iz3b9xdy0bdfp6nya3wmlri0z63vp0fn0vy3";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "plenary";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-lua";
        repo = "plenary.nvim";
        rev = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683";
        sha256 = "0n2p8krzwiw682f0yb6n8faamffpp336rjy50pbqf3jmc6czd5z4";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-nio";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-neotest";
        repo = "nvim-nio";
        rev = "a428f309119086dc78dd4b19306d2d67be884eee";
        sha256 = "0n40q6znpy1xzywd1hwyivx7y1n0i0fcp3m7jp0vgipm6qssda4b";
      };
    })
  ];
}
