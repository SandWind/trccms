local lor = require("lor.index")
local coverRouter = lor:Router()
local Covermodel =  require("app.model.cover_model")


coverRouter:post("/new", function(req, res, next)

	local imageurl =  req.body.imageurl
	local pagename    =  req.body.pagename
	local result,err = Covermodel:new(imageurl,pagename)
	for k,v in pairs(result) do
		ngx.log(ngx.ERR,"result[",k.."]:",v)
	end
	if not result or err then
	  res:json({
                success = false,
                msg = "保存失败",
            })
	else
	  
	  res:json({
                success = true,
                msg = "保存成功",
                coverId = result.insert_id
            })
	end
end)

coverRouter:post("/delete", function(req, res, next)

	local id =  req.body.id
	if  Covermodel:delete_by_id(id) then
		res:json({
                success = true,
            })
	else
		es:json({
                success = false,
            })
	end

end)



return coverRouter