{
  plugins = {
    bufferline = {
      enable = true;
      separatorStyle = "thick"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
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
}
