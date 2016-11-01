local lor = require("lor.index")
local YogaRouter = lor:Router()
local Covermodel =  require("app.model.cover_model")
local GymnasiumPicsModel = require("app.model.gymnasium_pics_model")
local GymnasiumDescriModel = require("app.model.gymnasium_descri_model")
local TrainnerPicsModel = require("app.model.trainner_pics_model")
local TrainnerDescriModel = require("app.model.trainner_descri_model")
local CourseModel =  require("app.model.course_model") 

YogaRouter:get("/detail", function(req, res, next)

	local pagename = "yoga"
	local covers = Covermodel:query_by_pagename(pagename)
	local gymnasiumPics = GymnasiumPicsModel:query_by_pagename(pagename)
	local GymnasiumDescri = GymnasiumDescriModel:query_descri_by_pagename(pagename)
	local TrainnerPics  = TrainnerPicsModel:query_by_pagename(pagename)
	local TrainnerDescr = TrainnerDescriModel:query_by_pagename(pagename)
	local Courses  = CourseModel:query_by_pagename(pagename)

	res:render("detail",{ title = "瑜伽",
						  covers = covers,
						  gymnasiumPics=gymnasiumPics,
						  gymnasiumDescri =  GymnasiumDescri,
						  TrainnerPics = TrainnerPics, 
						  TrainnerDescr = TrainnerDescr,
						  Courses = Courses
						})
end)

return YogaRouter