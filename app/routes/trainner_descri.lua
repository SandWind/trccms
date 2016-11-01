local lor = require("lor.index")
local TrainnerDescriRouter = lor:Router()
local TrainnerDescriModel =  require("app.model.trainner_descri_model")


TrainnerDescriRouter:post("/new", function(req, res, next)

	local descri =  req.body.descri
	local pagename    =  req.body.pagename
	local result,err = TrainnerDescriModel:new(descri,pagename)
	
	if not result or err then
	  res:json({
                success = false,
                msg = "保存失败",
            })
	else
	  
	  res:json({
                success = true,
                msg = "保存成功",
                DescriId = result.insert_id
            })
	end
end)



TrainnerDescriRouter:post("/update", function(req, res, next)
	local id =  req.body.id
	local descri =  req.body.descri
	local pagename = req.body.pagename
	if TrainnerDescriModel:update_by_id(id,descri) then
	  res:json({
	  			success = true
	  	})
	else
	  res:json({
	  			success = false
	  	})
	end
end)



return TrainnerDescriRouter