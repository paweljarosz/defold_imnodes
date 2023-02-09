local M = {}
local table_insert, pairs, imgui = table.insert, pairs, imgui
local uid = require "uid.uid"

function M.create_config_from_nodes(nodes)
	local config = {}
	for i, v in pairs(nodes) do
		config[i] = {v.id}
		if v.inputs then
			for _,n in pairs(v.inputs) do
				table_insert(config[i], n.id)
			end
		end
		if v.outputs then
			for _,n in pairs(v.outputs) do
				table_insert(config[i], n.id)
			end
		end
	end
	return config
end

function M.create_nodes_from_config(config, templates)
	local nodes = {}
	for i, v in pairs(config) do
		nodes[i] = templates[v[1]](v)
	end
	-- recreate also config with nodes created from templates:
	config = M.create_config_from_nodes(nodes)
	return nodes
end

function M.push_styles(node)
	if node.style then
		for i, c in pairs(node.style) do
			-- Format of styles: [imnodes_col_id] = {r,g,b,a}
			imgui.push_node_color_style(i, c[1], c[2], c[3], c[4])
		end
	end
end

function M.pop_styles(node)
	if node.style then
		for _, _ in pairs(node.style) do
			imgui.pop_node_color_style()
		end
	end
end

function M.set_node_title(node)
	if node.title then
		imgui.begin_node_title_bar()
		imgui.text(node.title)
		imgui.end_node_title_bar()
	end
end

function M.set_node_inputs(node)
	if node.inputs then
		for _, input in pairs(node.inputs) do
			imgui.begin_input_attribute(input.id)
			if input.text then
				imgui.text(input.text)
			end
			if input.input then
				imgui.push_item_width(100.0)
				imgui.input_text(input.input.label or "", input.input.text or "")
				imgui.pop_item_width()
			end
			imgui.end_input_attribute()
		end
	end
end

function M.set_node_outputs(node)
	if node.outputs then
		for _, output in pairs(node.outputs) do
			imgui.begin_output_attribute(output.id)
			if output.text then
				imgui.text(output.text)
			end
			if output.output then
				imgui.push_item_width(100.0)
				imgui.input_text(output.output.label or "", output.output.text or "")
				imgui.pop_item_width()
			end
			imgui.end_output_attribute()
		end
	end
end

function M.handle_link_creation(links, force)
	local link_created, start_id, start_pin_id, end_id, end_pin_id, from_snap = imgui.is_link_created()
	if link_created or force then
		table_insert(links, {uid(), start_pin_id, end_pin_id})
	end
	return links
end

return M