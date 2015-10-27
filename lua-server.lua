-- lua-server.lua
require "luarocks.loader"
local xavante = require "xavante"

port = 8001

xavante.HTTP {
	server = { host = "*", port = tonumber(port) },
	defaultHost = {
		rules = {
			{
				match = ".",
				with = function(req, res)
					res.headers["Content-type"] = "text/html"
					res.content = "Hello " .. os.date()
					return res
				end
			}
		}
	}
}

xavante.start()
