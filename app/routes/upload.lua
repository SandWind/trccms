local pairs = pairs
local ipairs = ipairs
local utils = require("app.libs.utils")
local lor = require("lor.index")
local upload_router = lor:Router()


upload_router:post("/test", function(req, res, next)

    ngx.req.read_body()
    
    local data = ngx.req.get_body_data()
    ngx.log(ngx.ERR," data:\n", data)

    res:send("测试完毕")
end)



upload_router:post("/avatar", function(req, res, next)
    local file = req.file or {}
    -- local userid = req.session.get("user").userid;
    
    if file.success and file.filename then 
        -- user_model:update_avatar(userid, file.filename)

        -- ngx.log(ngx.ERR, "用户:", userid, " 上传头像:", file.filename, " 成功")
        ngx.log(ngx.ERR," 上传头像:", file.filename, " 成功")
        res:json({
        	success = true, 
	        originFilename = file.origin_filename,
	        filename = file.filename
	    })
    else
    	-- ngx.log(ngx.ERR, "用户:", userid, " 上传头像失败:", file.msg)
        ngx.log(ngx.ERR," 上传头像失败:", file.msg)
		res:json({
        	success = false, 
	        msg = file.msg
	    })
    end
end)


upload_router:post("/file", function(req, res, next)
    local file = req.file or {}
    -- local userid = req.session.get("user").userid;

    if file.success then 
    	-- ngx.log(ngx.ERR, "用户:", userid, " 上传文件:", file.filename, " 成功")
        res:json({
        	success = true, 
	        imgUrl  = file.url,
	    })
    else
    	-- ngx.log(ngx.ERR, "用户:", userid, " 上传文件失败:", file.msg)
		res:json({
        	success = false, 
	        msg = file.msg
	    })
    end

end)





upload_router:post("/img", function(req, res, next)
    local file  = req.file or {}
    -- local userid = req.session.get("user").userid;

    if file.success then 
       res:send(file.url)
    else
        ngx.log(ngx.ERR," 上传文件失败:", files.msg)
        res:send(files.msg)
    end
end)





return upload_router
