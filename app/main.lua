local lor = require("lor.index")
local config = require("app.config.config")
local router = require("app.router")
local reponse_time_middleware = require("app.middleware.response_time")
local view_config = config.view_config
local upload_config = config.upload_config
local app = lor()

-- session和cookie支持，如果不需要可注释以下四行
-- local middleware_cookie = require("lor.lib.middleware.cookie")
local session_middleware = require("lor.lib.middleware.session")


app:conf("view enable", true)
app:conf("view engine", view_config.engine)
app:conf("view ext", view_config.ext)
app:conf("views",view_config.views)


app:use(reponse_time_middleware({
    digits = 0,
    header = 'X-Response-Time',
    suffix = true
}))

app:use(session_middleware({
    secret = config.session_secret -- 必须修改此值
}))


-- app:use(check_login_middleware(whitelist))   --检查是否登录

-- app:use(function(req, res, next)
--     -- 插件，在处理业务route之前的插件，可作编码解析、过滤等操作
--     next()
-- end)


router(app) -- 业务路由处理


-- 404 error
app:use(function(req, res, next)
    if req:is_found() ~= true then
        res:status(404):send("sorry, not found.")
    end
end)


-- 错误处理插件，可根据需要定义多个
app:erroruse(function(err, req, res, next)
    -- err是错误对象
    res:status(500):send(err)
end)

app:run() -- 启动lor

