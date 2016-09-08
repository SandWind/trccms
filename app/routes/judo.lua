local lor = require("lor.index")
local JudoRouter = lor:Router()

JudoRouter:get("/detail", function(req, res, next)
	res:render("detail",{title = "柔道"})
end)

return JudoRouter