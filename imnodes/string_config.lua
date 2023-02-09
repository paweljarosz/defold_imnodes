local M = {}

function M.split_string_into_table(s,delimiter)
	delimiter = delimiter or '%s'
	local t={}
	local i=1
	for str in string.gmatch(s, '([^'..delimiter..']+)') do
		t[i] = str
		i = i + 1
	end
	return t
end

function M.convert_table_into_string(table_to_convert)
	local data = {}
	for i,v in pairs(table_to_convert) do
		table.insert(data, table.concat(v, ","))
	end	
	return table.concat(data, "|")
end

function M.convert_string_into_table(string_to_convert)
	pprint("S", string_to_convert)
	local data = M.split_string_into_table(string_to_convert, "|")
	for i,v in pairs(data) do
		v = M.split_string_into_table(v, ",")
		data[i] = v
	end
	return data
end

return M