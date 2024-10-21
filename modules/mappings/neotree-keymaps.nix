{
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree toggle reveal_force_cwd<cr>";
      options = {
        silent = true;
        desc = "File Explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>ge";
      action = ":Neotree git_status<CR>";
      options = {
        silent = true;
        desc = "Git Explorer";
      };
    }
  ];
}
