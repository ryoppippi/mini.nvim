local M = {}

--- Test for `@class`, `@field`, and `@type`
---
---@class User
---
---@field login string User login.
---@field password string User password.
---@field address? string User address (should expand to optional).
---
---@type table
M.User = {}

--- Test `@diagnostic` (should be ignored in output) and `@overload`
---
---@param x string Variable.
---
---@overload fun(x: string)
---@diagnostic disable
local f = function(x, y) return x + 1 end
---@diagnostic enable

--- Test for `@private`
---
--- Private method that shouldn't be present in output
---@private
---
---@param x number Should not error if there are sections after `@private`.
---@return number Should not error if there are sections after `@private`.
M._private_method = function(x) return x + 2 end

--- Test for `@seealso` and `@usage`
---
---@usage `M.fun(1, 2)`
---
---@seealso |test-f| |f-test-different-line|
M.fun = function(a, b) return true end

--- Test for `@signature` and `@tag`
---
--- `@signature` should override default title inference where it is placed.
--- `@tag` should enclose non-whitespace group separately.
---
---@signature fun(x, y)
---@tag test-f f-test
--- f-test-different-line
local f = function() end


--- Test for smart empty line append
--- Some text
---   

--- Test for smart empty line before tag
--- >lua
---   -- This is code block
--- <
---@tag important-tag

--- Test for `@text`
---
---@param a string
---@text
--- This illustrates some code:
--- >
---   require('mini.doc').setup()
--- <
