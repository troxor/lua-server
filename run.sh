#!/usr/bin/env bash

uwsgi_lua --socket :3031 --lua lua-server.lua &
