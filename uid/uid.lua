local M = {}

local uid = 0

return setmetatable( M, { __call = function() 
	uid = uid + 1
	return uid
end} )