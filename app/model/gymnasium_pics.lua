local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")

local  _M = {}

function _M:new(imageurl,pagename)
	return db:query("insert into cover_pics(cover_img,pagename,uuid) values(?,?,?)",{imageurl,pagename,uuid()})
	-- body
end


function _M:query_by_pagename(pagename)
	local res,err

    res,err = db:query("select * from cover_pics where pagename = ?",{pagename})

    if not res or err or type(res) ~= "table" or #res <= 0 then
        return {}
    else
        return res
    end
end



function _M:query_by_pagename(pagename)
	local res,err

    res,err = db:query("select * from cover_pics where pagename = ?",{pagename})

    if not res or err or type(res) ~= "table" or #res <= 0 then
        return {}
    else
        return res
    end
end



function _M:update_by_uuid(cover_img,pagename,uuid)
	return db:query("update cover_pics set cover_img=?, pagename=? where uuid=?",{cover_img,pagename,uuid})
	-- body
end




function _M:delete_by_uuid(uuid)
    local res,err = db:query("delete from cover_pics where uuid=?", {uuid})

    if res and not err then
        return true
    else
        return false
    end
end


function _M:delete_by_id(id)
    local res,err = db:query("delete from cover_pics where cover_id=?", {id})

    if res and not err then
        return true
    else
        return false
    end
end



return _M
