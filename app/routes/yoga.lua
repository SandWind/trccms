local lor = require("lor.index")
local YogaRouter = lor:Router()

YogaRouter:get("/detail", function(req, res, next)
	res:render("detail",{title = "瑜伽"})
end)

return YogaRouter