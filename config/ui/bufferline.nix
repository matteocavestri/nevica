{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          separator_style = "thick";
          offsets = [
            {
              filetype = "neo-tree";
              text = "Neotree";
              highlight = "Directory";
              text_align = "left";
            }
          ];
        };
      };
    };
  };
}
