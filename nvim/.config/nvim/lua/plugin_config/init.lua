local scandir = require('plenary.scandir').scan_dir

local plugin_config_path = vim.fn.stdpath('config') .. '/lua/plugin_config'

local get_filename = function(s)
    local filename_start, filename_end = string.find(s,
                                                     'plugin_config/[%l_]+[.]lua$')

    if filename_start ~= nil and filename_end ~= nil then
        return string.sub(s, filename_start, filename_end - 4)
    end

    return nil
end

scandir(plugin_config_path, {
    on_insert = function(entry)
        local filename = get_filename(entry)
        if filename ~= 'plugin_config/init' then require(filename) end
    end
})

require'fidget'.setup {}
