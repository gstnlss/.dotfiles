local function does_file_exist(path)
  local file = io.open(path, 'r')
  if file ~= nil then
    io.close(file)
    return true
  else
    return false
  end
end

return { does_file_exist = does_file_exist }
