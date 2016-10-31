local lor = require("lor.index")
local AdimPageRouter = lor:Router()
local Admodel= require("app.model.ad_model")
local Covermodel =  require("app.model.cover_model")
local GymnasiumPicsModel = require("app.model.gymnasium_pics_model")
local GymnasiumDescriModel = require("app.model.gymnasium_descri_model")
local TrainnerPicsModel = require("app.model.trainner_pics_model")
local TrainnerDescriModel = require("app.model.trainner_descri_model")
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
		
		local adtopics_sample = Admodel:get_all_sample()
		
		res:render("admin_ad",{ 
			title = category.first,
			samlpes = adtopics_sample
			})

	end)


AdimPageRouter:get("/judo",function(req, res, next)

		local pagename = "judo"
		local covers = Covermodel:query_by_pagename(pagename)
		local gymnasiumPics = GymnasiumPicsModel:query_by_pagename(pagename)
		local GymnasiumDescri = GymnasiumDescriModel:query_descri_by_pagename(pagename)
		local TrainnerPics  = TrainnerPicsModel:query_by_pagename(pagename)
		local TrainnerDescr = TrainnerDescriModel:query_by_pagename(pagename)
		res:render("admin_judo",{ title = category.second,
								  pagename = pagename, 
								  covers = covers,
								  gymnasiumPics=gymnasiumPics,
								  gymnasiumDescri =  GymnasiumDescri,
								  TrainnerPics = TrainnerPics, 
								  TrainnerDescr = TrainnerDescr
								 })
	
	end)


AdimPageRouter:get("/yoga",function(req, res, next)

		-- res:render("admin_yoga",{ title = category.third})
		local pagename = "yoga"
		local covers = Covermodel:query_by_pagename(pagename)
		local gymnasiumPics = GymnasiumPicsModel:query_by_pagename(pagename)
		local GymnasiumDescri = GymnasiumDescriModel:query_descri_by_pagename(pagename)
		local TrainnerPics  = TrainnerPicsModel:query_by_pagename(pagename)
		local TrainnerDescr = TrainnerDescriModel:query_by_pagename(pagename)

		res:render("admin_judo",{ title = category.third,
								  pagename = pagename, 
								  covers = covers,
								  gymnasiumPics=gymnasiumPics,
								  gymnasiumDescri =  GymnasiumDescri,
								  TrainnerPics = TrainnerPics, 
								  TrainnerDescr = TrainnerDescr
								 })
	
	end)


AdimPageRouter:get("/freepower",function(req, res, next)

		-- res:render("admin_freepower",{ title = category.fouth})
		local pagename = "freepower"
		local covers = Covermodel:query_by_pagename(pagename)
		local gymnasiumPics = GymnasiumPicsModel:query_by_pagename(pagename)
		local GymnasiumDescri = GymnasiumDescriModel:query_descri_by_pagename(pagename)
		local TrainnerPics  = TrainnerPicsModel:query_by_pagename(pagename)
		local TrainnerDescr = TrainnerDescriModel:query_by_pagename(pagename)

		res:render("admin_judo",{ title = category.fouth,
								  pagename = pagename, 
								  covers = covers,
								  gymnasiumPics=gymnasiumPics,
								  gymnasiumDescri =  GymnasiumDescri,
								  TrainnerPics = TrainnerPics, 
								  TrainnerDescr = TrainnerDescr
								 })
	
	end)

AdimPageRouter:get("/aerabic",function(req, res, next)


		-- res:render("admin_aerabic",{  title = category.fiveth})
		local pagename = "aerabic"
		local covers = Covermodel:query_by_pagename(pagename)
		local gymnasiumPics = GymnasiumPicsModel:query_by_pagename(pagename)
		local GymnasiumDescri = GymnasiumDescriModel:query_descri_by_pagename(pagename)
		res:render("admin_judo",{ title = category.fiveth,
								  pagename = pagename, 
								  covers = covers,
								  gymnasiumPics=gymnasiumPics,
								  gymnasiumDescri =  GymnasiumDescri,
								  TrainnerPics = TrainnerPics, 
								  TrainnerDescr = TrainnerDescr
								 })

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
