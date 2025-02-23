love2d-tl
=====

[![LOVE](https://img.shields.io/badge/L%C3%96VE-11.5-EA316E.svg)](http://love2d.org/)

[Teal type](https://github.com/teal-language/teal-types) definition for LÖVE, an *awesome* framework you can use to make 2D games in Lua. Based on definitions provided by [love-api](https://github.com/love2d-community/love-api).

Note that this does not include type definition of [bit](https://bitop.luajit.org/), [FFI](http://luajit.org/ext_ffi.html), LuaSocket, ENet, and utf8 libraries!

Blacklisted Functions
-----

Lists of function (variants) that are currently blacklisted due to limitations in `generate_tl.lua`:

* [`love.audio.getEffect`](https://love2d.org/wiki/love.audio.getEffect)

* [`World:getCallbacks`](https://love2d.org/wiki/World:getCallbacks)

* [`World:getContactFilter`](https://love2d.org/wiki/World:getContactFilter)

* [`World:setCallbacks`](https://love2d.org/wiki/World:setCallbacks)

* [`World:setContactFilter`](https://love2d.org/wiki/World:setContactFilter)

* [`love.window.showMessageBox` 2nd variant](https://love2d.org/wiki/love.window.showMessageBox#Function_2)
