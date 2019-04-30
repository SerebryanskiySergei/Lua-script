local Utils = {}
local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require "cjson"
local inspect = require('inspect')


function Utils.getResource(uri)
    local result, statuscode, content = http.request(uri)
    return json.decode(result)
end

function Utils.getTransportFile(uri)
    local result, statuscode, content = http.request(uri)
    return result
end

function Utils.patchResource(uri, data)
    local response_body = { }
    local payload = json.encode(data)
    local res, code, response_headers, status = http.request
    {
      url = uri,
      method = "PATCH",
      headers =
      {
        ["Content-Type"] = "application/json",
        ["Content-Length"] = payload:len()
      },
      source = ltn12.source.string(payload),
      sink = ltn12.sink.table(response_body)
    }
    print(table.concat(response_body))
    return response_body
end

return Utils

