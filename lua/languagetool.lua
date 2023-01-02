-- File: ~/.local/share/nvim/plugged/languagetool/plugin/languagetool.lua

local api_key = "your_api_key_here"

local function check_grammar()
  -- Check the grammar of the current buffer
  local text = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  text = vim.fn.join(text, "\n")
  local command = "curl -X POST -d 'language=en-US&text=" .. vim.fn.shellescape(text) .. "' 'https://api.languagetoolplus.com/v2/check?key=" .. api_key .. "'"
  local lt_output = vim.fn.system(command)

  -- Extract the grammar errors from the output
  local errors = {}
  local pattern = [[\v"message":"(.+?)"]]
  while lt_output:match(pattern) do
    errors[#errors + 1] = lt_output:match(pattern)
    lt_output = lt_output:gsub(pattern, "")
  end

  -- Print the errors to the console
  vim.api.nvim_command("echomsg 'Grammar errors found:'")
  for _, error in ipairs(errors) do
    vim.api.nvim_command("echomsg '- " .. error .. "'")
  end
end



