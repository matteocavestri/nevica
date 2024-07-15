{pkgs, ...}: {
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
      "core.dirman" = {
        config = {
          workspaces = {
            home = "~/notes/home";
            work = "~/notes/work";
          };
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
  ];
}
