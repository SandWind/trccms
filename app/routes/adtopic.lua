local lor = require("lor.index")
local AdtopicRouter = lor:Router()
local Admodel= require("app.model.ad_model")



AdtopicRouter:post("/new",function(req, res, next)
	    local title = req.body.title
		local coverimg   =  req.body.coverimg
		local content    =  req.body.content
  	    local reslut,err = Admodel:new(title,coverimg,content)

		if not reslut or err then
        	res:json({
                success = false,
                msg = "保存失败"
            })
    	else
            res:json({
                success = true,
                msg = "保存成功",
                data = {
                    id = res.ad_uuid
                }
            })
    	end
   	end)


AdtopicRouter:get("/count",function(req, res, next)
	local adcount = Admodel:get_total_count()
	res:json({
            	success = true,
            	ad_count = adcount
        	})	
    end)



AdtopicRouter:get("/:ad_uuid/detail", function(req, res, next)
	local uuid = req.params.ad_uuid
	local adtopic = Admodel:query_by_uuid(uuid)

    res:render("adtopic/adtopic",{adtopic = adtopic })


	end)




return AdtopicRouter
