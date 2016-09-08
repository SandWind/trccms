local lor = require("lor.index")
local FreePowerRouter = lor:Router()

FreePowerRouter:get("/detail", function(req, res, next)
	res:render("detail",{title = "自由力量"})
end)

return FreePowerRouter