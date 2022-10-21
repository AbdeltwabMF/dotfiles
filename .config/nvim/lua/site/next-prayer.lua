--
local function next_prayer()
	local command = "next-prayer --hybrid"
	local tmp_file = "/tmp/nvim-next-prayer"
	os.execute(command .. " > " .. tmp_file)
	local f = io.open(tmp_file, "r")
	if not f then
		return ""
	end
	local line = f:read("*line")
	f:close()
	return line:lower()
end

io.write(next_prayer())
