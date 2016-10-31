local lor = require("lor.index")
local TrainnerPicsRouter = lor:Router()
local TrainnerPicsModel =  require("app.model.trainner_pics_model")


TrainnerPicsRouter:post("/new", function(req, res, next)

	local imageurl =  req.body.imageurl
	local pagename    =  req.body.pagename
	local result,err = TrainnerPicsModel:new(imageurl,pagename)
	
	if not result or err then
	  res:json({
                success = false,
                msg = "保存失败",
            })
	else
	  
	  res:json({
                success = true,
                msg = "保存成功",
                PicId = result.insert_id
            })
	end
end)

TrainnerPicsRouter:post("/delete", function(req, res, next)

	local id =  req.body.id
	if  TrainnerPicsModel:delete_by_id(id) then
		res:json({
                success = true,
            })
	else
		es:json({
                success = false,
            })
	end

end)



return TrainnerPicsRouter