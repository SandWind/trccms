local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")

local _M= {}

function _M:new(mor_time,after_time,monday_mor,monday_after,tuesday_mor,tuesday_after,wednesday_mor,wednesday_after,thursday_mor,thursday_after,friday_mor,friday_after,saturday_mor,saturday_after,sunday_mor,sunday_after,pagename)
	return db:query("insert into course (mor_time,after_time,monday_mor,monday_after,tuesday_mor,tuesday_after,wednesday_mor,wednesday_after,thursday_mor,thursday_after,friday_mor,friday_after,saturday_mor,saturday_after,sunday_mor,sunday_after,pagename) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",{mor_time,after_time,monday_mor,monday_after,tuesday_mor,tuesday_after,wednesday_mor,wednesday_after,thursday_mor,thursday_after,friday_mor,friday_after,saturday_mor,saturday_after,sunday_mor,sunday_after,pagename})
end
 

function _M:query_by_pagename(pagename)
	
	local  res,err = db:query("select * from course where pagename = ?",{pagename})

	if not res or err or type(res) ~= "table" or #res <= 0 then
        return {}
    else
        return res
    end
end


function _M:delete_by_id( id )
	local res,err = db:query("delete from course where course_id=?", {id})

    if res and not err then
        return true
    else
        return false
    end
	
end

-- SELECT a.* FROM product a LEFT JOIN product_details b
--        ON a.id=b.id AND b.weight!=44 AND b.exist=0
--        WHERE b.id IS NULL

function _M:update_by_id(id,mor_time,after_time,monday_mor,monday_after,tuesday_mor,tuesday_after,wednesday_mor,wednesday_after,thursday_mor,thursday_after,friday_mor,friday_after,saturday_mor,saturday_after,sunday_mor,sunday_after)
	local res,err = db:query("update course set mor_time=?,after_time=?,monday_mor=?,monday_after=?,tuesday_mor=?,tuesday_after=?,wednesday_mor=?,wednesday_after=?,thursday_mor=?,thursday_after=?,friday_mor=?,friday_after=?,saturday_mor=?,saturday_after=? sunday_mor=?,sunday_after=? where course_id=?", {mor_time,after_time,monday_mor,monday_after,tuesday_mor,tuesday_after,wednesday_mor,wednesday_after,thursday_mor,thursday_after,friday_mor,friday_after,saturday_mor,saturday_after,sunday_mor,sunday_after,id})

    if res and not err then
        return true
    else
        return false
    end
	
end



return _M