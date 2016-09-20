local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")


local  Ad_Model = {}

function Ad_Model:new(title,coverImage,path,context)
	local unique_name = uuid()
	return  db:query("insert into user(title, coverImage, path,context,ad_uuid) values(?,?,?,?)",
            {title,coverImage,path,context,unique_name})

end

function Ad_Model:query_by_id(uuid)
	local result, err =  db:query("select * from ad_topic where ad_uuid=?", {uuid})
    if not result or err or type(result) ~= "table" or #result ~=1 then
        return nil, err
    else
        return result[1], err
    end
end

function Ad_Model:update_ad_topic_by_uuid(title,coverImage,path,context,uuid)
	db:query("update ad_topic set title=?,coverImage=?,path=?,context=? where ad_uuid=?", {title,coverImage,path,context,uuid})
end



return Ad_Model