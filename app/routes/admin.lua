local lor = require("lor.index")
local AdimPageRouter = lor:Router()


local category = {
					first="广告",
					second = "柔道",
					third  = "瑜伽",
					fouth  = "自由力量",
					fiveth = "有氧运动"
}




AdimPageRouter:get("/",function(req, res, next)

		res:redirect "/admin/ad"
	
	end)


AdimPageRouter:get("/ad",function(req, res, next)

		res:render("admin_ad",{ title = category.first})

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


return AdimPageRouter
