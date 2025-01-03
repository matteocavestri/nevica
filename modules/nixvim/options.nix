{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    nevica.nixvim.options.enableRecommended = lib.mkEnableOption "Enable Recommended Nevica options";
  };
  config = lib.mkIf config.nevica.nixvim.options.enableRecommended {
    package = pkgs.neovim-unwrapped;
    enableMan = true;
    viAlias = true;
    vimAlias = true;
    opts = {
      # Enable relative line numbers
      number = true;
      relativenumber = true;
      # Set fold settings
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      # Set tabs to 2 spaces
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;
      # Enable auto indenting and set it to spaces
      smartindent = true;
      shiftwidth = 2;
      # Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
      breakindent = true;
      # Enable incremental searching
      hlsearch = true;
      incsearch = true;
      # Better splitting
      splitbelow = true;
      splitright = true;
      # Enable ignorecase + smartcase for better searching
      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";
      # Enable mouse mode
      mouse = "a"; # Mouse
      # Enable cursor line highlight
      cursorline = true; # Highlight the line where the cursor is located
      # Reduce which-key timeout to 10ms
      timeoutlen = 10;
      # Decrease updatetime
      updatetime = 50; # faster completion (4000ms default)
      # Set completeopt to have a better completion experience
      completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp
      # Enable 24-bit colors
      termguicolors = true;
      # Always keep 8 lines above/below cursor unless at start/end of file
      scrolloff = 5;
      # Set encoding type
      encoding = "utf-8";
      fileencoding = "utf-8";
      # Enable persistent undo history
      swapfile = false;
      backup = false;
      undofile = true;
    };
  };
}
