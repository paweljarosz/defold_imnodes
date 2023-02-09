local M = {}
local string_config = require "imnodes.string_config"
local node_templates = require "imnodes.node_templates"
local node_helper = require "imnodes.node_helper"

M.filename = "/home/pjarosz4/Desktop/defold/test_save.ini"
local force_link_creation = true

local function handle_save(nodes_config, links)
	local n_config = nodes_config and string_config.convert_table_into_string(nodes_config) or ""
	local l_config = links and string_config.convert_table_into_string(links) or ""
	local string_to_save = "@" .. n_config .. "@" .. l_config .. "@"
	pprint("Save", string_to_save)
	imgui.save_current_editor_to_file_with_config(M.filename, string_to_save, #string_to_save)
end

local function handle_load(nodes_config, links, nodes)
	local loaded_string = imgui.load_current_editor_from_file_with_config(M.filename)
	local config = string_config.split_string_into_table(loaded_string, "@")

	if config[2] then
		nodes_config = {}
		nodes_config = string_config.convert_string_into_table(config[2])
		nodes = {}
		pprint("Load Nodes", nodes_config)
		nodes = node_helper.create_nodes_from_config(nodes_config, node_templates)
	end

	if config[3] then
		links = {}
		links = string_config.convert_string_into_table(config[3])
		pprint("Load Links", links)
		node_helper.handle_link_creation(links, force_link_creation)
	end
	return links
end

function M.handle(nodes, links, nodes_config)
	if imgui.begin_main_menu_bar() then
		if imgui.begin_menu("File") then

			if imgui.menu_item("Save", "Ctrl+S") then
				handle_save(nodes_config, links)
			end

			if imgui.menu_item("Load", "Ctrl+L") then
				links = handle_load(nodes_config, links, nodes)
			end

			if imgui.menu_item("Quit", "Ctrl+Q") then
				sys.exit(0)
			end

			imgui.end_menu()
		end
		imgui.end_main_menu_bar()
	end
	return links
end

return M