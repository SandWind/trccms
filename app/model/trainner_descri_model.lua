local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")

local _M= {}

function _M:new(descri,pagename)
	return db:query("insert into trainer_theme (trainer_descri,pagename) value(?,?)",{descri,pagename})
end
 

function _M:query_by_pagename(pagename)
	
	local  res,err = db:query("select * from trainer_theme where pagename = ?",{pagename})

	if not res or err or type(res) ~= "table" or #res <= 0 then
        return {}
    else
        return res
    end
end


function _M:delete_by_id( id )
	local res,err = db:query("delete from trainer_theme where trainer_id=?", {id})

    if res and not err then
        return true
    else
        return false
    end
	
end

-- SELECT a.* FROM product a LEFT JOIN product_details b
--        ON a.id=b.id AND b.weight!=44 AND b.exist=0
--        WHERE b.id IS NULL

function _M:update_by_id(id,descri)
	local res,err = db:query("update trainer_theme set trainer_descri = ? where trainer_id=?", {descri,id})

    if res and not err then
        return true
    else
        return false
    end
	
end

return _M