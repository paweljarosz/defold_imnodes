local M = {}

local uid = require "uid.uid"
local styles = require "imnodes.node_styles"
local imgui = imgui

--------------------------------------------------------------------------------
-- NODE TEMPLATES
--------------------------------------------------------------------------------

--------------------------------------------
-- VALUE - Single_Modified_Output
--------------------------------------------
function M.Value(config)
	config = config or {}
	local node_id = config[2] or uid()
	local out_id = config[3] or uid()
	local out = {}
	out[1] = {id = out_id, output = {label = "", text = "C"}}
	local result = {
		id = node_id, title = "Value",
		outputs = out,
		style = styles.gray
	}
	return result
end

---------------------------------------------
-- MODIFY - One_Input_One_Output
--------------------------------------------
function M.Modify(config)
	config = config or {}
	local node_id = config[2] or uid()
	local in_id = config[3] or uid()
	local out_id = config[4] or uid()
	local inp = {}
	inp[1] = {id = in_id, text = "A"}
	local out = {}
	out[1] = {id = out_id, text = "~A"}
	local result = {
		id = node_id, title = "Not",
		inputs = inp,
		outputs = out,
		style = styles.grayblue
	}
	return result
end

---------------------------------------------
-- ADD - Two_Inputs_One_Output
--------------------------------------------
function M.Add()
	config = config or {}
	local node_id = uid()
	local in_id = config[2] or uid()
	local in_id2 = config[3] or uid()
	local out_id = config[4] or uid()
	local inp = {}
	inp[1] = {id = in_id, text = "A"}
	inp[2] = {id = in_id2, text = "B"}
	local out = {}
	out[1] = {id = out_id, text = "A+B"}
	local result = {
		id = node_id, title = "Add",
		inputs = inp,
		outputs = out,
		style = styles.red
	}
	return result
end

return M