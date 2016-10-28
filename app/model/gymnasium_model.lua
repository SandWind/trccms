local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")

local gymnasium_model= {}

function gymnasium_model:new(gymnasium_descri,pagename,gymnasium_pics)
	local res,err =  db:query("insert into gymnasium_introduce (gymnasium_descri,page_name) value(?,?)",{gymnasium_descri,page_name})
	local gymnasium_id 
	if res and  not err then 
		gymnasium_id = res.insert_id
	else
	  return false;
	end

	if gymnasium_id then
	   if type(gymnasium_pics) == "table" and #gymnasium_pics > 0 then

	   	  for _,v in pairs(gymnasium_pics) do
	   	  	res,err = db:query("insert into gymnasium_pics (gymnasium_pic,gymnasium_id) value(?,?)",{v,gymnasium_id})
	   	  	if not res or err then
	   	  	  return false
	   	  	end 
	   	  end

	   end 
	end

	return true
end


function 

function gymnasium_model:query_pic_by_pagename(pagename)
	
	local  res,err = db:query("select * from gymnasium_pics p left join gymnasium_introduce  i on p.gymnasium_id = i.gymnasium_id where i.pagename = ?",{pagename})

	if not res or err or type(res) ~= "table" or #res <= 0 then
        return {}
    else
        return res
    end
end


function gymnasium_model:delete_by_id( gymnasium_id )
	local res,err = db:query("delete from gymnasium_pics where gymnasium_id=?", {gymnasium_id})

    if res and not err then
        return true
    else
        return false
    end
	
end

-- SELECT a.* FROM product a LEFT JOIN product_details b
--        ON a.id=b.id AND b.weight!=44 AND b.exist=0
--        WHERE b.id IS NULL

function gymnasium_model:update_by_id( gymnasium_pic,gymnasium_id )
	local res,err = db:query("update gymnasium_pics set gymnasium_pic = ? where gymnasium_id=?", {gymnasium_id})

    if res and not err then
        return true
    else
        return false
    end
	
end



return gymnasium_model