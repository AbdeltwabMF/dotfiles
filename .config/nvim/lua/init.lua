-- init.lua
-- Author: Abd El-Twab M. Fakhry
-- Version: v0.1.0
-- Description: This is my vim configuration file for lua
-- License: GPL-3.0


-- Vanilla Config
require('amf.settings')
require('amf.autocmd')
require('amf.plugins')
require('amf.keybinds')

---Pretty print lua table
function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end
