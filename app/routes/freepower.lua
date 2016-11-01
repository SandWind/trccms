local lor = require("lor.index")
local FreePowerRouter = lor:Router()
local Covermodel =  require("app.model.cover_model")
local GymnasiumPicsModel = require("app.model.gymnasium_pics_model")
local GymnasiumDescriModel = require("app.model.gymnasium_descri_model")
local TrainnerPicsModel = require("app.model.trainner_pics_model")
local TrainnerDescriModel = require("app.model.trainner_descri_model")
local CourseModel =  require("app.model.course_model") 

FreePowerRouter:get("/detail", function(req, res, next)
	

	local pagename = "freepower"
	local covers = Covermodel:query_by_pagename(pagename)
	local gymnasiumPics = GymnasiumPicsModel:query_by_pagename(pagename)
	local GymnasiumDescri = GymnasiumDescriModel:query_descri_by_pagename(pagename)
	local TrainnerPics  = TrainnerPicsModel:query_by_pagename(pagename)
	local TrainnerDescr = TrainnerDescriModel:query_by_pagename(pagename)
	local Courses  = CourseModel:query_by_pagename(pagename)

	res:render("detail",{ title = "自由力量",
						  covers = covers,
						  gymnasiumPics=gymnasiumPics,
						  gymnasiumDescri =  GymnasiumDescri,
						  TrainnerPics = TrainnerPics, 
						  TrainnerDescr = TrainnerDescr,
						  Courses = Courses
						})
end)

return FreePowerRouter