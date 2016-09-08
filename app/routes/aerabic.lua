local lor = require("lor.index")
local AerabicRouter = lor:Router()

AerabicRouter:get("/detail", function(req, res, next)
	res:render("detail",{title = "有氧训练"})
end)

return AerabicRouter