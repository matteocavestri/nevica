{
  plugins.notify = {
    enable = true;
    fps = 30;
    render = "minimal";
    timeout = 1000;
    topDown = true;
    stages = "static";
  };
  extraConfigLua = ''
    local notify = require("notify")
    local filtered_message = { "No information available" }

    -- Override notify function to filter out messages
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(message, level, opts)
    	local merged_opts = vim.tbl_extend("force", {
    		on_open = function(win)
    			local buf = vim.api.nvim_win_get_buf(win)
    			vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
    		end,
    	}, opts or {})

    	for _, msg in ipairs(filtered_message) do
    		if message == msg then
    			return
    		end
    	end
    	return notify(message, level, merged_opts)
    end
  '';
}
