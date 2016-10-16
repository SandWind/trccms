local upload = require("resty.upload")
local uuid = require("app.libs.uuid.uuid")

local sfind = string.find
local match = string.match
local ngx_var = ngx.var




local function getextension(filename)
	return filename:match(".+%.(%w+)$")
end


local function _get_formdata(config)

	local form, err = upload:new(config.chunk_size)
	if not form then
		ngx.log(ngx.ERR, "failed to new upload: ", err)
		ngx.exit(500)
	end
	form:set_timeout(config.recieve_timeout)
	

	local unique_name = uuid()
	local success, msg = false, ""
	local datatype = ""
	while true do
		local typ, res, err = form:read()

		if not typ then
			success = false
			msg = "failed to read"
			ngx.log(ngx.ERR, "failed to read: ", err)
			return success, msg
		end

		if typ == "header" then
			if res[1] == "Content-Type" then

			end
 			
 			if res[1] == "Content-Disposition" then
			
			end

			-- if res[1] == "Content-Disposition" then
			-- 	key = match(res[2], "form-data; name=\"(.-)\"")
			-- 	origin_filename = match(res[2], "filename=\"(.-)\"")
			-- elseif res[1] == "Content-Type" then
			-- 	filetype = res[2]
			-- end

			-- if origin_filename and filetype then
			-- 	if not extname then
			-- 		extname = getextension(origin_filename)
			-- 	end

			-- 	if extname ~= "png" and extname ~= "jpg" and extname ~= "jpeg"  and extname ~= "bmp"  and extname ~= "gif" then
			-- 		success = false
			-- 		msg = "not allowed upload file type"
			-- 		ngx.log(ngx.ERR, "not allowed upload file type:", origin_filename)
			-- 		return success, msg
			-- 	end  

			-- 	filename = unique_name .. "." .. extname
			-- 	path = config.dir.. "/" .. filename
			
				
			-- 	file, err = io.open(path, "w+")

			-- 	if err then
			-- 		success = false
			-- 		msg = "open file error"
			-- 		ngx.log(ngx.ERR, "open file error:", err)
			-- 		return success, msg
			-- 	end
			-- else
			--   ngx.log(ngx.ERR, "upload file error, origin_filename:", origin_filename) 
			-- end
			-- ngx.log(ngx.ERR,"res[1]:",res[1].."\n")
			-- ngx.log(ngx.ERR,"res[2]:",res[2].."\n")
	
		elseif typ == "body" then
			ngx.log(ngx.ERR,"boy:",res.."\n")
			-- if file then
			-- 	file:write(res)
			-- 	success = true
			-- else
			-- 	success = false
			-- 	msg = "upload file error"
			-- 	ngx.log(ngx.ERR, "upload file error, path:", path)
			-- 	return success, msg
			-- end
		elseif typ == "part_end" then
            -- file:close()
            -- file = nil
		elseif typ == "eof" then
			break
		else
			-- do nothing
		end
	end

	return success, msg
end



local function form_data(config)
	return function(req, res, next)

		if ngx_var.request_method == "POST" then
			local get_headers = ngx.req.get_headers()
			local header = get_headers['Content-Type']
			if header then
				local is_multipart = sfind(header, "multipart")
				if is_multipart and is_multipart>0 then
					config = config or {}
					config.dir = config.dir or "/tmp"
					config.chunk_size = config.chunk_size or 4096
					config.recieve_timeout = config.recieve_timeout or 20000 -- 20s
					
					-- local success, msg, origin_filename, extname, path, filename = _get_formdata(config)
					-- local success.msg = _get_formdata(config)
					-- if success then
					-- 	req.form = req.form or {}
					-- 	req.form.success = true
					-- 	req.form.origin_filename = origin_filename
					-- 	req.form.extname = extname
					-- 	req.form.path = path
					-- 	req.form.filename = filename
					-- 	req.form.url = "/static/images/"..filename
					-- else
					-- 	req.form = req.form or {}
					-- 	req.form.success = false
					-- 	req.form.msg = msg
					-- end
					next()
					
				else
					next()
				end
			else
				next()
			end
		else
			next()
		end
	end
end




return form_data

