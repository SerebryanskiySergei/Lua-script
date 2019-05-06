-- sudo luarocks install lua-cjson 2.1.0-1
-- sudo luarocks install inspect
-- sudo luarocks install http

local utils = require "utils"
local inspect = require('inspect')
local io = require("io")
require('mdns')

local res = mdns_query()

if (res) then
    for k,v in pairs(res) do
        print(k)
        for k1,v1 in pairs(v) do
            print('  '..k1..': '..v1)
        end
    end
else
    print('no result')
end

-- local node_api_uri = "http://192.168.59.213:3000"
-- local cm_api_uri = "http://192.168.59.213:8000"

-- -------------------------------------
-- -- Selecting sender and receiver
-- -------------------------------------
-- local senders = utils.getResource(node_api_uri .. "/x-nmos/node/v1.3/senders")
-- local receivers = utils.getResource(node_api_uri .. "/x-nmos/node/v1.3/receivers")

-- for key,value in pairs(senders) do
--     print("Sender: " .. key .. " -> " .. senders[key].label)
-- end

-- print("Select sender for a connection ->")
-- local sender_num = tonumber(io.read())
-- print("Selected sender -> " .. inspect(senders[sender_num]))

-- for key,value in pairs(receivers) do
--     print("Receiver: " .. key .. " -> " .. receivers[key].label)
-- end

-- print("Select receiver for a connection ->")
-- local receiver_num = tonumber(io.read())
-- print("Selected receiver -> " .. inspect(receivers[receiver_num]))

-- -------------------------------------
-- -- Activating sender
-- -------------------------------------
-- local activator = {
--     receiver_id = nil,
--     master_enable = "true",
--     activation = {
--         mode = "activate_immediate",
--         requested_time = nil
--     }
-- }
-- utils.patchResource(cm_api_uri .. "/x-nmos/connection/v1.0/single/senders/" .. senders[sender_num].id .. "/staged", activator)

-- -------------------------------------
-- -- Activating receiver
-- -------------------------------------
-- local sdp_file = utils.getTransportFile(cm_api_uri .. "/x-nmos/connection/v1.0/single/senders/" .. senders[sender_num].id .. "/transportfile")
-- local stage_sdp = {
--     sender_id = senders[sender_num].id,
--     transport_file = {
--       data = sdp_file,
--       type = "application/sdp"
--     }
--   }
-- activator = {
--     master_enable = "true",
--     activation = {
--         mode = "activate_immediate",
--         requested_time = nil
--     }
-- }
-- utils.patchResource(cm_api_uri .. "/x-nmos/connection/v1.0/single/receivers/" .. receivers[receiver_num].id .. "/staged", stage_sdp)
-- utils.patchResource(cm_api_uri .. "/x-nmos/connection/v1.0/single/receivers/" .. receivers[receiver_num].id .. "/staged", activator)
