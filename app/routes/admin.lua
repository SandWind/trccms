local lor = require("lor.index")
local AdimPageRouter = lor:Router()
local Admodel= require("app.model.ad_model")


local category = {
					first="广告",
					second = "柔道",
					third  = "瑜伽",
					fouth  = "自由力量",
					fiveth = "有氧运动"
}

local preview_data = {}


AdimPageRouter:get("/",function(req, res, next)

		res:redirect "/admin/ad"
	
	end)


AdimPageRouter:get("/ad",function(req, res, next)
		
		local adcount = Admodel:get_total_count()
		
		local adtopics = Admodel:get_all()
		
		res:render("admin_ad",{ 
			title = category.first,
			adcount = adcount,
		    adtopics = adtopics
			})

	end)


AdimPageRouter:get("/judo",function(req, res, next)

		res:render("admin_judo",{ title = category.second})
	
	end)


AdimPageRouter:get("/yoga",function(req, res, next)

		res:render("admin_yoga",{ title = category.third})
	
	end)


AdimPageRouter:get("/freepower",function(req, res, next)

		res:render("admin_freepower",{ title = category.fouth})
	
	end)

AdimPageRouter:get("/aerabic",function(req, res, next)


		res:render("admin_aerabic",{  title = category.fiveth})

	end)

AdimPageRouter:post("/adpreview",function(req, res, next)
		
		preview_data = {} 
		preview_data.title = req.body.title
		preview_data.coverimg   =  req.body.coverimg
		preview_data.content    = tostring(req.body.content)
		
		 res:json({
            success = true
        })
	end)



AdimPageRouter:get("/adpreview",function(req, res, next)

		res:render("AdPreview",{title = preview_data.title,coverimg = preview_data.coverimg,content= preview_data.content })
		
		-- for k,v in pairs(req.body) do
		-- 	ngx.log(ngx.ERR,"body=[",k.."]:\n",v)
		-- end

	end)



return AdimPageRouter
