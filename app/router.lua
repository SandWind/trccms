-- 业务路由管理
local userRouter = require("app.routes.user")
local HomePageRouter= require("app.routes.homepage")
local judoPageRouter= require("app.routes.judo")
local yogoPageRouter= require("app.routes.yoga")
local freepowerPageRouter =  require("app.routes.freepower")
local AerabicPageRouter= require("app.routes.aerabic")
local AdminPageRouter = require("app.routes.admin")
local AuthRouter =  require("app.routes.auth")
local uploadRouter = require("app.routes.upload")
local AdtopicRouter = require("app.routes.adtopic")
local CoverRouter= require("app.routes.cover")
local GymanasiumPicsRouter= require("app.routes.gymanasium_pics")
local GymnasiumDescriRouter = require("app.routes.gymnasium_descri")
local TrainnerPicRouter =  require("app.routes.trainner_pics")
local TrainnerDescriRouter = require("app.routes.trainner_descri")
local CourseRouter = require("app.routes.course")
return function(app)

    -- -- group router, 对以`/user`开始的请求做过滤处理
    -- app:use("/user", userRouter())

    -- -- group router, 对以`/test`开始的请求做过滤处理
    -- app:use("/test", testRouter())

    -- -- 除使用group router外，也可单独进行路由处理，支持get/post/put/delete...

    -- -- welcome to lor!
    -- app:get("/", function(req, res, next)
    --     res:send("hi! welcome to lor framework.")
    -- end)

    -- -- hello world!
    -- app:get("/index", function(req, res, next)
    --     res:send("hello world!")
    -- end)

    -- -- render html, visit "/view" or "/view?name=foo&desc=bar
    -- app:get("/view", function(req, res, next)
    --     local data = {
    --         name =  req.query.name or "lor",
    --         desc =   req.query.desc or 'a framework of lua based on OpenResty'
    --     }
    --     res:render("index", data)
    -- end)
    app:use("/",HomePageRouter()) --首页
    app:use("/judo",judoPageRouter())
    app:use("/yogo",yogoPageRouter())
    app:use("/freepower",freepowerPageRouter())
    app:use("/aerabic",AerabicPageRouter())
    app:use("/admin",AdminPageRouter())
    app:use("/auth",AuthRouter())
    app:use("/upload",uploadRouter())
    app:use("/adtopic",AdtopicRouter())
    app:use("/cover",CoverRouter())
    app:use("/gymnasiumPic",GymanasiumPicsRouter())
    app:use("/gymnasiumDescri",GymnasiumDescriRouter())
    app:use("/trainnerPic",TrainnerPicRouter())
    app:use("/trainnerDescri",TrainnerDescriRouter())
    app:use("/course",CourseRouter())


end

