local M = {}
local imgui = imgui

--------------------------------------------------------------------------------
-- STYLES
--------------------------------------------------------------------------------

local node_bg = imgui and imgui.ImNodesCol_NodeBackground or 0
local node_bg_hovered = imgui and imgui.ImNodesCol_NodeBackgroundHovered or 1
local node_bg_selected = imgui and imgui.ImNodesCol_NodeBackgroundSelected or 2
local node_outline = imgui and imgui.ImNodesCol_NodeOutline or 3
local title_bar = imgui and imgui.ImNodesCol_TitleBar or 4
local title_bar_hovered = imgui and imgui.ImNodesCol_TitleBarHovered or 5
local title_bar_selected = imgui and imgui.ImNodesCol_TitleBarSelected or 6


-- Format of Styles: [imnodes_col_id] = {r,g,b,a}

------------------------------------------------------
-- RED
M.red = {}
M.red[node_bg]				= {35, 20, 20, 255}
M.red[node_bg_hovered]		= {40, 25, 25, 255}
M.red[node_bg_selected]		= {45, 30, 30, 255}
M.red[node_outline]			= {160, 20, 20, 255}
M.red[title_bar]			= {140, 20, 20, 255}
M.red[title_bar_hovered]	= {150, 25, 25, 255}
M.red[title_bar_selected]	= {160, 30, 30, 255}

------------------------------------------------------
-- GRAY
M.gray = {}
M.gray[node_bg]				= {30, 30, 30, 255}
M.gray[node_bg_hovered]		= {35, 35, 35, 255}
M.gray[node_bg_selected]	= {40, 40, 40, 255}
M.red[node_outline]			= {40, 40, 40, 255}
M.gray[title_bar]			= {100, 100, 100, 255}
M.gray[title_bar_hovered]	= {120, 120, 120, 255}
M.gray[title_bar_selected]	= {140, 140, 140, 255}

------------------------------------------------------
-- GRAY BLUE
M.grayblue = {}
M.grayblue[node_bg]				= {70, 70, 100, 255}
M.grayblue[node_bg_hovered]		= {90, 90, 120, 255}
M.grayblue[node_bg_selected]	= {110, 110, 140, 255}
M.red[node_outline]				= {110, 110, 140, 255}
M.grayblue[title_bar]			= {120, 120, 150, 255}
M.grayblue[title_bar_hovered]	= {140, 140, 170, 255}
M.grayblue[title_bar_selected]	= {160, 160, 190, 255}

return M