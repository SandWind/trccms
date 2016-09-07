local lor = require("lor.index")
local JudoRouter = lor:Router()

JudoRouter:get("/detail", function(req, res, next)
	res:render("deatail")
end)

return JudoRouter