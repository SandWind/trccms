local upload = require("resty.upload")
local uuid = require("app.libs.uuid.uuid")

local sfind = string.find
local match = string.match
local ngx_var = ngx.var



local function getextension(filename)
	return filename:match(".+%.(%w+)$")
end



local function _multipart_formdata(config)

	local form, err = upload:new(config.chunk_size)
	if not form then
		ngx.log(ngx.ERR, "failed to new upload: ", err)
		ngx.exit(500)
	end
	form:set_timeout(config.recieve_timeout)
	

	local unique_name = uuid()
	local success, msg = false, ""
	local file,origin_filename, filename, path, extname, url,err
	local prefix,suffix
	local isFile =false
	local params = {}
	local paramKey, paramValue
    
	while true do
		local typ, res, err = form:read()

		if not typ then
			success = false
			msg = "failed to read"
			ngx.log(ngx.ERR, "failed to read: ", err)
			return success, msg
		end

		if err then
		   ngx.log(ngx.ERR, "read form err: ", err)
		end

		if typ == "header" then
			prefix,suffix = res[1],res[2]

			if prefix == "Content-Disposition" then
				paramKey = match(suffix, "name=\"(.-)\"")
				origin_filename = match(suffix, "filename=\"(.-)\"")
			elseif prefix == "Content-Type" then
				filetype = suffix
			end

			if origin_filename then
				isFile = true
			else
				isFile = false
			end

			if isFile and origin_filename and filetype then
			   if not extname then
					extname = getextension(origin_filename)
				end

				if extname ~= "png" and extname ~= "jpg" and extname ~= "jpeg"  and extname ~= "bmp"  and extname ~= "gif" then
					success = false
					msg = "not allowed upload file type"
					ngx.log(ngx.ERR, "not allowed upload file type:", origin_filename)
					return success, msg
				end  

				filename = unique_name .. "." .. extname
				path = config.dir.. "/" .. filename
			
				
				file, err = io.open(path, "w+")

				if err then
					success = false
					msg = "open file error"
					ngx.log(ngx.ERR, "open file error:", err)
					return success, msg
				end
			end

		elseif typ == "body" then

		  if isFile then 
		    if file then
			   file:write(res)
			   success = true
			else
			   success = false
			   msg = "upload file error"
			   ngx.log(ngx.ERR, "upload file error, path:", path)
			   return success, msg
			end
		  else
		  	success = true
		    paramValue = res
		  end
			
		elseif typ == "part_end" then
		
		  if isFile then
		     file:close()
		     url = '/static/images/'..filename
             file = nil
             filename = nil
             origin_filename = nil
		  else
		  	params[paramKey] = paramValue
		  end 
     
		elseif typ == "eof" then
			break
		end
	end

	return success, msg, url,params
end



local function uploader(config)
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
					
					local success, msg, url,params= _multipart_formdata(config)

       				req.file = {}
       				
					if success then
						req.file.success = true
						req.file.url  = url 
						req.params =  params or {}
					else
						req.file.success = false
						req.file.msg = msg
					end
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

return uploader

