-- Fix for react type definition files showing on go to definition
-- https://github.com/typescript-language-server/typescript-language-server/issues/216
local function filter_react_dts(filename)
  return string.match(filename, 'react/index.d.ts') == nil
end

return filter_react_dts
