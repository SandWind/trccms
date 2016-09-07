local lor = require("lor.index")
local HomePageRouter = lor:Router()

HomePageRouter:get("/", function(req, res, next)
	res:render("index")
end)

HomePageRouter:get("/index", function(req, res, next)
	res:render("index")
end)

return HomePageRouter