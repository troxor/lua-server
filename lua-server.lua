-- lua-server.lua
local xavante = require "xavante"

port = 8001

function sleep(n)
	os.execute("sleep "..tonumber(n))
end

xavante.HTTP {
	server = { host = "*", port = tonumber(port) },
	defaultHost = {
		rules = {
			{
				match = ".",
				with = function(req, res)
					res.headers["Content-type"] = "text/html"
					sleep(5)
					res.content = "Hello " .. os.date()
					return res
				end
			}
		}
	}
}

xavante.start()
