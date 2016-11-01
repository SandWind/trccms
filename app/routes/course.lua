local lor = require("lor.index")
local CourseRouter = lor:Router()
local CourseModel =  require("app.model.course_model")


CourseRouter:post("/new", function(req, res, next)
	
	local mor_time    =  req.body.mor_time
	local after_time  =  req.body.after_time
	local monday_mor  =  req.body.monday_mor
	local monday_after=  req.body.monday_after
	local tuesday_mor =  req.body.tuesday_mor
	local tuesday_after =  req.body.tuesday_after
	local wednesday_mor=  req.body.wednesday_mor
	local wednesday_after=  req.body.wednesday_after
	local thursday_mor=  req.body.thursday_mor
	local thursday_after=  req.body.thursday_after
	local friday_mor=  req.body.friday_mor
	local friday_after=  req.body.friday_after
	local saturday_mor=  req.body.saturday_mor
	local saturday_after=  req.body.saturday_after
	local sunday_mor=  req.body.sunday_mor
	local sunday_after=  req.body.sunday_after
	local pagename    =  req.body.pagename
	local result,err = CourseModel:new(mor_time,after_time,monday_mor,monday_after,tuesday_mor,tuesday_after,wednesday_mor,wednesday_after,thursday_mor,thursday_after,friday_mor,friday_after,saturday_mor,saturday_after,sunday_mor,sunday_after,pagename)
	
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



CourseRouter:post("/update", function(req, res, next)
	local id = req.body.id
	local mor_time    =  req.body.mor_time
	local after_time  =  req.body.after_time
	local monday_mor  =  req.body.monday_mor
	local monday_after=  req.body.monday_after
	local tuesday_mor =  req.body.tuesday_mor
	local tuesday_after =  req.body.tuesday_after
	local wednesday_mor=  req.body.wednesday_mor
	local wednesday_after=  req.body.wednesday_after
	local thursday_mor=  req.body.thursday_mor
	local thursday_after=  req.body.thursday_after
	local friday_mor=  req.body.friday_mor
	local friday_after=  req.body.friday_after
	local saturday_mor=  req.body.saturday_mor
	local saturday_after=  req.body.saturday_after
	local pagename    =  req.body.pagename

	if CourseModel:update_by_id(id,mor_time,after_time,monday_mor,monday_after,tuesday_mor,tuesday_after,wednesday_mor,wednesday_after,thursday_mor,thursday_after,friday_mor,friday_after,saturday_mor,saturday_after,sunday_mor,sunday_after) then
	  res:json({
	  			success = true
	  	})
	else
	  res:json({
	  			success = false
	  	})
	end
end)



return CourseRouter