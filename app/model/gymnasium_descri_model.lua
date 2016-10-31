local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")

local gymnasium_descri_model= {}

function gymnasium_descri_model:new(gymnasium_descri,pagename)
	return db:query("insert into gymnasium_introduce (gymnasium_descri,page_name) value(?,?)",{gymnasium_descri,page_name})
end
 

function gymnasium_descri_model:query_descri_by_pagename(pagename)
	
	local  res,err = db:query("select * from gymnasium_introduce where pagename = ?",{pagename})

	if not res or err or type(res) ~= "table" or #res <= 0 then
        return {}
    else
        return res
    end
end


function gymnasium_descri_model:delete_by_id( gymnasium_id )
	local res,err = db:query("delete from gymnasium_introduce where gymnasium_id=?", {gymnasium_id})

    if res and not err then
        return true
    else
        return false
    end
	
end

-- SELECT a.* FROM product a LEFT JOIN product_details b
--        ON a.id=b.id AND b.weight!=44 AND b.exist=0
--        WHERE b.id IS NULL

function gymnasium_descri_model:update_by_id(gymnasium_id,gymnasium_descri)
	local res,err = db:query("update gymnasium_introduce set gymnasium_descri = ? where gymnasium_id=?", {gymnasium_descri,gymnasium_id})

    if res and not err then
        return true
    else
        return false
    end
	
end



return gymnasium_descri_model