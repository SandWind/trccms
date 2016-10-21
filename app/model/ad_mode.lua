local DB = require("app.libs.db")
local db = DB:new()
local uuid = require("app.libs.uuid.uuid")
local utils  = require("app.libs.utils")


local  Ad_Model = {}

function Ad_Model:new(title,coverImage,content)
	local unique_number = uuid();
    local creat_time = utils.now()
	return  db:query("insert into ad_topic(title, coverImage, content,ad_uuid,creat_time) values(?,?,?,?,?)",
            {title,coverImage,context,unique_number,creat_time})

end

function Ad_Model:query_by_uuid(uuid)
	local result, err =  db:query("select * from ad_topic where ad_uuid=?", {uuid})
    if not result or err or type(result) ~= "table" or #result ~=1 then
        return nil, err
    else
        return result[1], err
    end
end

function Ad_Model:delete_by_uuid(uuid)
    local res,err
    res,err = db:query("delete ad_topic topic where ad_uuid=?", {uuid})

    if res and not err then
        return true
    else
        return false
    end
end

function Ad_Model:update_ad_topic_by_uuid(title,coverImage,content,uuid)
	return db:query("update ad_topic set title=?,coverImage=?,content=? where ad_uuid=?", {title,coverImage,content,uuid})
end


function Ad_Model:get_total_count()
    local res,err
    res, err =  db:query("select count(id) as c from topic")

    if err or not res or #res~=1 or not res[1].c then
        return 0
    else
        return res[1].c
    end
end

function Ad_Model:get_all()
    local res,err
    -- body
    res,err = db:query("select * from ad_topic")

end


return Ad_Model