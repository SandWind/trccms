local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")

local  _M = {}

function _M:new(imageurl,pagename)
	return db:query("insert into trainer_pics(trainer_img,pagename) values(?,?)",{imageurl,pagename})
	-- body
end


function _M:query_by_pagename(pagename)
	local res,err

    res,err = db:query("select * from trainer_pics where pagename = ?",{pagename})

    if not res or err or type(res) ~= "table" or #res <= 0 then
        return {}
    else
        return res
    end
end



function _M:update_by_id(img,id)
	return db:query("update trainer_pics set trainer_img=? where trainer_pic_id=?",{img,id})
	-- body
end




function _M:delete_by_id(id)
    local res,err = db:query("delete from trainer_pics where trainer_pic_id=?", {id})

    if res and not err then
        return true
    else
        return false
    end
end





return _M
