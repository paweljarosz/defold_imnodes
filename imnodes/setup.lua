local M = {}

function M.set_default_style()
	imgui.set_style_window_rounding(6)
	imgui.set_style_frame_rounding(3)
	imgui.set_style_scrollbar_rounding(10)
	imgui.set_style_color(imgui.ImGuiCol_Text, 0.90, 0.90, 0.90, 0.90)
	imgui.set_style_color(imgui.ImGuiCol_TextDisabled, 0.60, 0.60, 0.60, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_WindowBg, 0.09, 0.09, 0.15, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_PopupBg, 0.05, 0.05, 0.10, 0.85)
	imgui.set_style_color(imgui.ImGuiCol_Border, 0.70, 0.70, 0.70, 0.65)
	imgui.set_style_color(imgui.ImGuiCol_BorderShadow, 0.00, 0.00, 0.00, 0.00)
	imgui.set_style_color(imgui.ImGuiCol_FrameBg, 0.00, 0.00, 0.01, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_FrameBgHovered, 0.90, 0.80, 0.80, 0.40)
	imgui.set_style_color(imgui.ImGuiCol_FrameBgActive, 0.90, 0.65, 0.65, 0.45)
	imgui.set_style_color(imgui.ImGuiCol_TitleBg, 0.00, 0.00, 0.00, 0.83)
	imgui.set_style_color(imgui.ImGuiCol_TitleBgCollapsed, 0.40, 0.40, 0.80, 0.20)
	imgui.set_style_color(imgui.ImGuiCol_TitleBgActive, 0.00, 0.00, 0.00, 0.87)
	imgui.set_style_color(imgui.ImGuiCol_MenuBarBg, 0.01, 0.01, 0.02, 0.80)
	imgui.set_style_color(imgui.ImGuiCol_ScrollbarBg, 0.20, 0.25, 0.30, 0.60)
	imgui.set_style_color(imgui.ImGuiCol_ScrollbarGrab, 0.55, 0.53, 0.55, 0.51)
	imgui.set_style_color(imgui.ImGuiCol_ScrollbarGrabHovered, 0.56, 0.56, 0.56, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_ScrollbarGrabActive, 0.56, 0.56, 0.56, 0.91)
	imgui.set_style_color(imgui.ImGuiCol_CheckMark, 0.90, 0.90, 0.90, 0.83)
	imgui.set_style_color(imgui.ImGuiCol_SliderGrab, 0.70, 0.70, 0.70, 0.62)
	imgui.set_style_color(imgui.ImGuiCol_SliderGrabActive, 0.30, 0.30, 0.30, 0.84)
	imgui.set_style_color(imgui.ImGuiCol_Button, 0.48, 0.72, 0.89, 0.49)
	imgui.set_style_color(imgui.ImGuiCol_ButtonHovered, 0.50, 0.69, 0.99, 0.68)
	imgui.set_style_color(imgui.ImGuiCol_ButtonActive, 0.80, 0.50, 0.50, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_Header, 0.30, 0.69, 1.00, 0.53)
	imgui.set_style_color(imgui.ImGuiCol_HeaderHovered, 0.44, 0.61, 0.86, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_HeaderActive, 0.38, 0.62, 0.83, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_ResizeGrip, 1.00, 1.00, 1.00, 0.85)
	imgui.set_style_color(imgui.ImGuiCol_ResizeGripHovered, 1.00, 1.00, 1.00, 0.60)
	imgui.set_style_color(imgui.ImGuiCol_ResizeGripActive, 1.00, 1.00, 1.00, 0.90)
	imgui.set_style_color(imgui.ImGuiCol_PlotLines, 1.00, 1.00, 1.00, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_PlotLinesHovered, 0.90, 0.70, 0.00, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_PlotHistogram, 0.90, 0.70, 0.00, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_PlotHistogramHovered, 1.00, 0.60, 0.00, 1.00)
	imgui.set_style_color(imgui.ImGuiCol_TextSelectedBg, 0.00, 0.00, 1.00, 0.35)
end

function M.set_default_settings()
	local scale = 2
	imgui.scale_all_sizes(scale)
	local fontsize 		= 12.0 * scale
	local fontsizebase 	= 12.0 * scale
	self.fonts 	= {}
	local regular_data, error = sys.load_resource("/example/bundle/fonts/Montserrat-Regular.ttf")
	self.fonts["Regular"] = imgui.font_add_ttf_data(regular_data, #regular_data, fontsize, fontsizebase)
	local bold_data, error = sys.load_resource("/example/bundle/fonts/Montserrat-Bold.ttf")
	self.fonts["Bold"] = imgui.font_add_ttf_data(bold_data, #bold_data, fontsize, fontsizebase)
	local italic_data, error = sys.load_resource("/example/bundle/fonts/Montserrat-Italic.ttf")
	self.fonts["Italic"] = imgui.font_add_ttf_data(italic_data, #italic_data, fontsize, fontsizebase)
	local bolditalic_data, error = sys.load_resource("/example/bundle/fonts/Montserrat-BoldItalic.ttf")
	self.fonts["BoldItalic"] = imgui.font_add_ttf_data(bolditalic_data, #bolditalic_data, fontsize, fontsizebase)
end

local set_size = true

function M.set_size_once()
	if set_size then
		imgui.set_next_window_size(1250, 780)
		imgui.set_next_window_pos(20, 60)
		set_size = false
	end
end

return M