local lor = require("lor.index")
local HomePageRouter = lor:Router()
local Admodel= require("app.model.ad_model")

HomePageRouter:get("/", function(req, res, next)
	local adtopics_samples = Admodel:get_all_sample()

	res:render("index",{samples = adtopics_samples})
end)

HomePageRouter:get("/index", function(req, res, next)

	res:render("index")
end)

return HomePageRouter