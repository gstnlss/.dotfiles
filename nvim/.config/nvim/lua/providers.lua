local trim_string = function(s)
  return (s:gsub('^%s*(.-)%s*$', '%1'))
end

local read_cmd_output = function(cmd)
  local cmd_handle = io.popen(cmd, 'r')

  if cmd_handle == nil then
    return ''
  end

  local output = cmd_handle:read('*a')
  cmd_handle:close()
  return trim_string(output)
end

vim.api.nvim_set_var('python_host_prog', read_cmd_output('which python2'))
vim.api.nvim_set_var('python3_host_prog', read_cmd_output('which python3'))
vim.api
  .nvim_set_var('node_host_prog', read_cmd_output('which neovim-node-host'))
vim.api.nvim_set_var('loaded_perl_provider', 0)
