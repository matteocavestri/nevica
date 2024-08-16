{
  plugins = {
    neotest.adapters.vitest = {
      enable = true;
      # settings = {
      #   filter_dir = {
      #     __raw = ''
      #       function(name, rel_path, root)
      #         return name ~= "node_modules"
      #       end,
      #     '';
      #   };
      #   is_test_file = {
      #     # __raw = ''
      #     #   is_test_file = function(file_path)
      #     #       if string.match(file_path, "tests/.*test%.js$") or string.match(file_path, "tests/.*test%.ts$") then
      #     #           return true
      #     #       end
      #     #       return false
      #     #   end,

      #     # '';
      #   };
      # };
    };
  };
}
