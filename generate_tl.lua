-- Script to generate LÖVE Teal definitions

---@class LoveAPI
---@field public version string
---@field public functions LoveAPIFunction[]
---@field public callbacks LoveAPIFunction[]
---@field public types LoveAPIType[]
---@field public modules LoveAPIModule[]

---@class LoveAPIFunction
---@field public name string
---@field public variants LoveAPIFunctionVariant[]

---@class LoveAPIFunctionVariant
---@field public arguments? LoveAPIFunctionVariable[]
---@field public returns? LoveAPIFunctionVariable[]

---@class LoveAPIFunctionVariable
---@field public name string
---@field public type string
---@field public table? LoveAPIFunctionVariable[]
---@field package typename? string generate_tl.lua-specific
---@field package arraytype? string generate_tl.lua-specific
---@field package keytype? string generate_tl.lua-specific
---@field package valuetype? string generate_tl.lua-specific

---@class LoveAPIType
---@field public name string
---@field package supertypes? string[]
---@field package fields? LoveAPIFunctionVariable[] generate_tl.lua-specific
---@field package arraytype? string generate_tl.lua-specific
---@field public functions LoveAPIFunction[]

---@class LoveAPIModule
---@field public name string
---@field public types LoveAPIType[]
---@field public functions LoveAPIFunction[]
---@field public enums LoveAPIEnum[]

---@class LoveAPIEnum
---@field public name string
---@field public constants {name:string}

local api = require("love-api.love_api")
---@cast api +LoveAPI

-- Overrides blacklist function for automatic generation
local overrides = {}

---@param moduleName string
---@param functionName string
---@return LoveAPIFunction?
---@overload fun(moduleName:nil,functionName:string):LoveAPIFunction?
---@overload fun(moduleName:string,functionName:nil):LoveAPIModule?
---@overload fun(moduleName:nil,functionName:nil):LoveAPI
local function findAPI(moduleName, functionName)
	local module = api

	if moduleName then
		for _, v in ipairs(api.modules) do
			if v.name == moduleName then
				module = v
				break
			end
		end

		if not functionName then
			return module
		end

		if module == api then
			return nil
		end
	end

	local method = functionName:find(":", 1, true)
	---@type LoveAPIFunction
	local func = nil
	if method then
		local class, name = functionName:sub(1, method - 1), functionName:sub(method + 1)

		for _, v in ipairs(module.types) do
			if v.name == class then
				for _, v2 in ipairs(v.functions) do
					if v2.name == name then
						func = v2
						break
					end
				end
			end
		end
	else
		for _, v in ipairs(module.functions) do
			if v.name == functionName then
				func = v
				break
			end
		end

		if module.callbacks then
			for _, v in ipairs(module.callbacks) do
				if v.name == functionName then
					func = v
					break
				end
			end
		end
	end

	return func
end

-----------------------------
-- Changes to the LÖVE API --
-----------------------------

-- Note: Manipulation should be in alphabetical order in their corresponding module.
do
---@diagnostic disable: need-check-nil

-- Define love.conf table type argument
findAPI(nil, "conf").variants[1].arguments[1].typename = "Configuration"

-- Change return type of love.errorhandler for mainLoop function
findAPI(nil, "errorhandler").variants[1].returns[1].type = "mainLoop"

-- love.load table type arguments is string
local load = findAPI(nil, "load")
load.variants[1].arguments[1].valuetype = "string"
load.variants[1].arguments[2].valuetype = "string"

-- Change return type of love.run for mainLoop function
findAPI(nil, "run").variants[1].returns[1].type = "mainLoop"

-- love.audio.getActiveEffects table type is string
findAPI("audio", "getActiveEffects").variants[1].returns[1].valuetype = "string"

-- love.audio.getRecordingDevices return table type is RecordingDevice
assert(api.modules[1].functions[10].name == "getRecordingDevices")
findAPI("audio", "getRecordingDevices").variants[1].returns[1].valuetype = "RecordingDevice"

-- love.audio.pause table type is Source
local pause = findAPI("audio", "pause")
pause.variants[1].returns[1].valuetype = "Source"
pause.variants[3].arguments[1].valuetype = "Source"

-- love.audio.play 2nd variant table argument
local play = findAPI("audio", "play")
play.variants[2].arguments[1].valuetype = "Source"
play.variants[3].arguments[1].name = "..."

-- love.audio.setEffect table type argument is {string:any}
-- TODO: Is this correct?
local setEffect = findAPI("audio", "setEffect")
setEffect.variants[1].arguments[2].keytype = "string"
setEffect.variants[1].arguments[2].valuetype = "any"

-- Rewrite love.audio.setOrientation arguments
findAPI("audio", "setOrientation").variants[1] = {
	arguments = {
		{type = "number", name = "fx"},
		{type = "number", name = "fy"},
		{type = "number", name = "fz"},
		{type = "number", name = "ux"},
		{type = "number", name = "uy"},
		{type = "number", name = "uz"}
	}
}

-- love.audio.stop 2nd variant table argument
local stop = findAPI("audio", "stop")
stop.variants[3].arguments[1].name = "..."
stop.variants[4].arguments[1].valuetype = "Source"

-- Source:getActiveEffects table type is string
findAPI("audio", "Source:getActiveEffects").variants[1].returns[1].valuetype = "string"

-- Define Source:getFilter table return type record
local getEffect = findAPI("audio", "Source:getEffect")
getEffect.variants[1].arguments[2].literal = true
getEffect.variants[1].returns[1].typename = "FilterSettings"

-- Define Source:getFilter table return type record
findAPI("audio", "Source:getFilter").variants[1].returns[1].typename = "FilterSettings"

-- Define Source:setEffect table argument type record
findAPI("audio", "Source:setEffect").variants[2].arguments[2].typename = "FilterSettings"

-- Define Source:setFilter table argument type record
findAPI("audio", "Source:setFilter").variants[1].arguments[1].typename = "FilterSettings"

-- Override love.data.compress so it only has 1 variant
overrides["data.compress[1]"] = "compress: function(container: ContainerType, format: CompressedDataFormat, data: string|Data, level: number): string|CompressedData"
overrides["data.compress[2]"] = ""

-- Override love.data.decode so it only has 1 variant
overrides["data.decode[1]"] = "decode: function(container: ContainerType, format: EncodeFormat, source: string|love.Data): string|ByteData"
overrides["data.decode[2]"] = ""

-- Override love.data.decompress so it only has 2 variants
overrides["data.decompress[1]"] = "decompress: function(container: ContainerType, compressedData: CompressedData): string|ByteData"
overrides["data.decompress[2]"] = "decompress: function(container: ContainerType, format: CompressedDataFormat, compressed: string|ByteData): string|ByteData"
overrides["data.decompress[3]"] = ""

-- Override love.data.encode so it only has 1 variant
overrides["data.encode[1]"] = "encode: function(container: ContainerType, format: EncodeFormat, source: string|love.Data, linelength: number): string|ByteData"
overrides["data.encode[2]"] = ""

-- Override love.data.pack
overrides["data.pack[1]"] = "pack: function(container: ContainerType, format: string, ...: any): string|ByteData"

-- Override love.data.unpack so it only has 1 variant
overrides["data.unpack[1]"] = "unpack: function(format: string, data: string|love.Data, pos: number): any..."
overrides["data.unpack[2]"] = ""

-- Override love.event.poll
overrides["event.poll[1]"] = "poll: function(): function(): string, any..."

-- Override love.event.push
overrides["event.push[1]"] = "push: function(n: string, ...: any)"

-- Override love.event.wait
overrides["event.wait[1]"] = "wait: function(): string, any..."

-- love.event.quit override
overrides["event.quit[1]"] = "quit: function(exitstatus: number|string)"
overrides["event.quit[2]"] = ""

-- Remove love.event.Event enum
local event = findAPI("event")
assert(event.enums[1].name == "Event")
table.remove(event.enums, 1)

-- love.filesystem.getDirectoryItems table return type and 2nd variant override
findAPI("filesystem", "getDirectoryItems").variants[1].returns[1].valuetype = "string"
overrides["filesystem.getDirectoryItems[2]"] = "getDirectoryItems: function(dir: string, callback: function(filename: string)): {string}"

-- Define love.filesystem.getInfo table return type record
local getInfo = findAPI("filesystem", "getInfo")
getInfo.variants[1].returns[1].typename = "FileInfo"
getInfo.variants[2].arguments[2].literal = true
getInfo.variants[2].returns[1].typename = "FileInfo"
getInfo.variants[3].arguments[3].literal = true
getInfo.variants[3].returns[1].typename = "FileInfo"

-- Override love.filesystem.lines
overrides["filesystem.lines[1]"] = "lines: function(name: string): function(): string"

-- Override love.filesystem.load
overrides["filesystem.load[1]"] = "load: function(name: string): function(...: any): any..., string"

-- Override love.filesystem.read
overrides["filesystem.read[1]"] = "read: function(name: string, size: number): string, number|string"
overrides["filesystem.read[2]"] = "read: function(container: data.ContainerType, name: string, size: number): string|FileData, number|string"

-- Override File:lines
overrides["filesystem.File:lines[1]"] = "lines: function(self: File): function(): string"

-- Override File:read 2nd variant
overrides["filesystem.File:read[2]"] = "read: function(self: File, container: data.ContainerType, bytes: number): string|FileData"

-- Rasterizer:hasGlyphs override
overrides["font.Rasterizer:hasGlyphs[1]"] = "hasGlyphs: function(self: Rasterizer, ...: number|string): boolean"

-- Override love.graphics.captureScreenshot 2nd variant
overrides["graphics.captureScreenshot[2]"] = "captureScreenshot: function(callback: function(image: image.ImageData))"

-- Override love.graphics.clear 3rd variant
overrides["graphics.clear[3]"] = "clear: function(...: {number}|boolean)"

-- love.graphics.discard 2nd variant table value type
findAPI("graphics", "discard").variants[2].arguments[1].valuetype = "boolean"

-- love.graphics.getCanvasFormats variant table return type
local getCanvasFormats = findAPI("graphics", "getCanvasFormats")
getCanvasFormats.variants[1].returns[1].keytype = "PixelFormat"
getCanvasFormats.variants[1].returns[1].valuetype = "boolean"
getCanvasFormats.variants[2].returns[1].keytype = "PixelFormat"
getCanvasFormats.variants[2].returns[1].valuetype = "boolean"

-- love.graphics.getImageFormats variant table return type
local getImageFormats = findAPI("graphics", "getImageFormats")
getImageFormats.variants[1].returns[1].keytype = "PixelFormat"
getImageFormats.variants[1].returns[1].valuetype = "boolean"

-- love.graphics.getSupported return table type
local getSupported = findAPI("graphics", "getSupported")
getSupported.variants[1].returns[1].keytype = "GraphicsFeature"
getSupported.variants[1].returns[1].valuetype = "boolean"

-- Define love.graphics.getStats table return type record
local getStats = findAPI("graphics", "getStats")
getStats.variants[1].returns[1].typename = "Stats"
getStats.variants[2].returns[1].typename = "Stats"

-- love.graphics.getSystemLimits return table type
local getSystemLimits = findAPI("graphics", "getSystemLimits")
getSystemLimits.variants[1].returns[1].keytype = "GraphicsLimit"
getSystemLimits.variants[1].returns[1].valuetype = "number"

-- love.graphics.getTextureTypes return table type
local getTextureTypes = findAPI("graphics", "getTextureTypes")
getTextureTypes.variants[1].returns[1].keytype = "TextureType"
getTextureTypes.variants[1].returns[1].valuetype = "boolean"

-- love.graphics.line 2nd variant argument table type
local line = findAPI("graphics", "line")
line.variants[1].arguments[1].name = "..."
line.variants[2].arguments[1].valuetype = "number"

-- love.graphics.newArrayImage modification
findAPI("graphics", "newArrayImage").variants[1].arguments[2].typename = "ImageSetting"

-- love.graphics.newCanvas modification
local newCanvas = findAPI("graphics", "newCanvas")
newCanvas.variants[3].arguments[3].typename = "CanvasSetting"
newCanvas.variants[4].arguments[4].typename = "CanvasSetting"

-- Define love.graphics.newCubeImage table type argument
local newCubeImage = findAPI("graphics", "newCubeImage")
newCubeImage.variants[1].arguments[2].typename = "ImageSetting"
newCubeImage.variants[2].arguments[2].typename = "ImageSetting"

-- Define love.graphics.newImage table type argument
assert(api.modules[6].functions[54].name == "newImage")
local newImage = findAPI("graphics", "newImage")
newImage.variants[4].arguments[2].typename = "ImageSetting"
newImage.variants[1].arguments[2].typename = "ImageSetting"
newImage.variants[2].arguments[2].typename = "ImageSetting"
newImage.variants[3].arguments[2].typename = "ImageSetting"

-- Override love.graphics.newMesh 1st, 3rd & 4th variant
overrides["graphics.newMesh[1]"] = "newMesh: function(vertices: {{number}}, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh"
overrides["graphics.newMesh[3]"] = "newMesh: function(vertexformat: {{number|string}}, vertices: {{number}}, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh"
overrides["graphics.newMesh[4]"] = "newMesh: function(vertexformat: {{number|string}}, vertexcount: number, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh"

-- Blacklist (wrong) love.graphics.newShader 3rd variant
overrides["graphics.newShader[3]"] = ""

-- Define love.graphics.newVideo table type argument
findAPI("graphics", "newVideo").variants[3].arguments[2].typename = "VideoSetting"

-- Define love.graphics.newVolumeImage table type name
findAPI("graphics", "newVolumeImage").variants[1].arguments[2].type = "ImageSetting"

-- love.graphics.polygon 2nd variant table argument type
findAPI("graphics", "polygon").variants[2].arguments[2].valuetype = "number"

-- Override love.graphics.points
overrides["graphics.points[1]"] = "points: function(...: number)"
overrides["graphics.points[2]"] = "points: function(points: {number})"
overrides["graphics.points[3]"] = "points: function(points: {{number}})"

-- Override love.graphics.print 2nd, 4th, & 6th variant
overrides["graphics.print[2]"] = "print: function(coloredtext: {table|string}, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)"
overrides["graphics.print[4]"] = "print: function(coloredtext: {table|string}, transform: math.Transform)"
overrides["graphics.print[6]"] = "print: function(coloredtext: {table|string}, font: Font, transform: math.Transform)"

-- Add another love.graphics.print variant
local print = findAPI("graphics", "print")
print.variants[#print.variants + 1] = {
	arguments = {
		print.variants[1].arguments[1],
		print.variants[6].arguments[2],
		print.variants[1].arguments[2],
		print.variants[1].arguments[3],
		print.variants[1].arguments[4],
		print.variants[1].arguments[5],
		print.variants[1].arguments[6],
		print.variants[1].arguments[7],
		print.variants[1].arguments[8],
		print.variants[1].arguments[9],
		print.variants[1].arguments[10]
	}
}

-- Override love.graphics.printf 5-8th variant
overrides["graphics.printf[5]"] = "printf: function(coloredtext: {table|string}, x: number, y: number, limit: number, align: AlignMode, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)"
overrides["graphics.printf[6]"] = "printf: function(coloredtext: {table|string}, font: Font, x: number, y: number, limit: number, align: AlignMode, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)"
overrides["graphics.printf[7]"] = "printf: function(coloredtext: {table|string}, transform: math.Transform, limit: number, align: AlignMode)"
overrides["graphics.printf[8]"] = "printf: function(coloredtext: {table|string}, font: Font, transform: math.Transform, limit: number, align: AlignMode)"

-- override love.graphics.setBackgroundColor second variant
overrides["graphics.setBackgroundColor[2]"] = "setBackgroundColor: function(rgba1: {{number}}, rgba2: {{number}}, rgba8: {{number}})"

-- love.graphics.setCanvas 5th variant table type
local setCanvas = findAPI("graphics", "setCanvas")
setCanvas.variants[5].arguments[1].typename = "CanvasSetup"
-- Remove number and ellipsis variant
local setCanvasTable = setCanvas.variants[5].arguments[1].table
for i = #setCanvasTable, 1, -1 do
	if setCanvasTable[i].name == "..." or tonumber(setCanvasTable[i].name) ~= nil then
		table.remove(setCanvasTable, i)
	end
end

-- love.graphics.setColor 2nd variant table argument type
findAPI("graphics", "setColor").variants[2].arguments[1].valuetype = "number"

-- Override love.graphics.stencil
overrides["graphics.stencil[1]"] = "stencil: function(stencilfunction: function(), action: StencilAction, value: number, keepvalues: boolean)"

-- Create new RenderTargetSetup type for 5th variant of love.graphics.setCanvas
local graphics = findAPI("graphics")
graphics.types[#graphics.types + 1] = {
	name = "RenderTargetSetup",
	arraytype = "Canvas",
	fields = {
		{
			name = "mipmap",
			type = "number"
		},
		{
			name = "layer",
			type = "number"
		},
		{
			name = "face",
			type = "number"
		},
	}
}

-- Create new CanvasSetup type for 5th variant of love.graphics.setCanvas
graphics.types[#graphics.types + 1] = {
	name = "CanvasSetup",
	arraytype = "RenderTargetSetup",
	fields = {
		{
			name = "stencil",
			type = "boolean"
		},
		{
			name = "depth",
			type = "boolean"
		},
		{
			name = "depthstencil",
			type = "RenderTargetSetup"
		},
	}
}

-- Override Canvas:renderTo
overrides["graphics.Canvas:renderTo[1]"] = "renderTo: function(func: function())"

-- Define Font:getWrap table return type
findAPI("graphics", "Font:getWrap").variants[1].returns[2].valuetype = "string"

-- Remove Image:getFlags
overrides["graphics.Image:getFlags[1]"] = ""

-- Override Mesh:getVertexFormat
overrides["graphics.Mesh:getVertexFormat[1]"] = "getVertexFormat: function(self: Mesh): {{number|string}}"

-- Mesh:getVertexMap table return type is number
findAPI("graphics", "Mesh:getVertexMap").variants[1].returns[1].valuetype = "number"

-- Mesh:setVertex 2nd & 4th variant type arguments is number
local setVertex = findAPI("graphics", "Mesh:setVertex")
setVertex.variants[2].arguments[2].valuetype = "number"
setVertex.variants[4].arguments[2].valuetype = "number"

-- Mesh:setVertexMap tweaks
local setVertexMap = findAPI("graphics", "Mesh:setVertexMap")
setVertexMap.variants[1].arguments[1].valuetype = "number"
setVertexMap.variants[2].arguments[1].name = "..."

-- Override Mesh:setVertices
overrides["graphics.Mesh:setVertices[1]"] = "setVertices: function(self: Mesh, vertices: {{number}}, startvertex: number)"
findAPI("graphics", "Mesh:setVertices").variants[3] = nil

-- override ParticleSystem:setColors second variant
overrides["graphics.ParticleSystem:setColors[2]"] = "setColors: function(self: ParticleSystem, rgba1: {{number}}, rgba2: {{number}}, rgba8: {{number}})"

-- Override Text:add 2nd variant
overrides["graphics.Text:add[2]"] = "add: function(self: Text, coloredtext: {table|string}, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number"

-- Override Text:addf 2nd variant
overrides["graphics.Text:addf[2]"] = "addf: function(self: Text, coloredtext: {table|string}, wraplimit: number, align: AlignMode, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number"

-- Override Text:set 2nd variant
overrides["graphics.Text:set[2]"] = "set: function(self: Text, coloredtext: {table|string})"

-- Override Text:setf 2nd variant
overrides["graphics.Text:setf[2]"] = "setf: function(self: Text, coloredtext: {table|string}, wraplimit: number, alignmode: AlignMode)"

-- ParticleSystem:getQuads table return type is Quad
findAPI("graphics", "ParticleSystem:getQuads").variants[1].returns[1].valuetype = "Quad"

-- ParticleSystem:setQuads modification
assert(api.modules[6].types[6].functions[46].name == "setQuads")
local setQuads = findAPI("graphics", "ParticleSystem:setQuads")
setQuads.variants[1].arguments[1].name = "..."
setQuads.variants[2].arguments[1].valuetype = "Quad"

-- Shader:send modification
assert(api.modules[6].types[8].name == "Shader" and api.modules[6].types[8].functions[3].name == "send")
local send = findAPI("graphics", "Shader:send")
send.variants[1].arguments[2].name = "..."
send.variants[2].arguments[2].name = "..."
send.variants[2].arguments[2].valuetype = "number"
send.variants[5].arguments[2].name = "..."
send.variants[5].arguments[2].valuetype = "number"
overrides["graphics.Shader:send[3]"] = "send: function(self: Shader, name: string, ...: {{number}})"
overrides["graphics.Shader:send[6]"] = "send: function(self: Shader, name: string, matrixLayout: math.MatrixLayout, ...: {{number}})"

-- Shader:sendColor modification
assert(api.modules[6].types[8].functions[4].name == "sendColor")
local sendColor = findAPI("graphics", "Shader:sendColor")
sendColor.variants[1].arguments[2].name = "..."
sendColor.variants[1].arguments[2].valuetype = "number"

-- Override ImageData:mapPixel
overrides["image.ImageData:mapPixel[1]"] = "mapPixel: function(self: ImageData, pixelFunction: function(x: number, y: number, r: number, g: number, b: number, a: number): (number, number, number, number), x: number, y: number, width: number, height: number)"

-- love.joystick.getJoysticks table return type
findAPI("joystick", "getJoysticks").variants[1].returns[1].valuetype = "Joystick"

-- love.math.gammaToLinear table argument type
findAPI("math", "gammaToLinear").variants[2].arguments[1].valuetype = "number"

-- love.math.isConvex modification
local isConvex = findAPI("math", "isConvex")
isConvex.variants[1].arguments[1].valuetype = "number"
isConvex.variants[2].arguments[1].name = "..."

-- love.math.linearToGamma table argument type
findAPI("math", "linearToGamma").variants[2].arguments[1].valuetype = "number"

-- love.math.newBezierCurve modification
local newBezierCurve = findAPI("math", "newBezierCurve")
newBezierCurve.variants[1].arguments[1].valuetype = "number"
newBezierCurve.variants[2].arguments[1].name = "..."

-- love.math.triangulate modification
local triangulate = findAPI("math", "triangulate")
triangulate.variants[1].arguments[1].valuetype = "number"
triangulate.variants[1].returns[1].valuetype = "number"
triangulate.variants[2].arguments[1].name = "..."
triangulate.variants[2].returns[1].valuetype = "number"

-- BezierCurve:render table return type
findAPI("math", "BezierCurve:render").variants[1].returns[1].valuetype = "number"

-- BezierCurve:renderSegment table return type
findAPI("math", "BezierCurve:renderSegment").variants[1].returns[1].valuetype = "number"

-- Transform:setMatrix modification
local setMatrix = findAPI("math", "Transform:setMatrix")
setMatrix.variants[1].arguments[1].name = "..."
setMatrix.variants[2].arguments[2].name = "..."
setMatrix.variants[3].arguments[2].valuetype = "number"
overrides["math.Transform:setMatrix[4]"] = "setMatrix: function(self: Transform, layout: MatrixLayout, matrix: {{number}}): Transform"

-- love.mouse.isDown modifications
findAPI("mouse", "isDown").variants[1].arguments[1].name = "..."
overrides["mouse.isDown[2]"] = ""

-- Body:getContacts table return type
findAPI("physics", "Body:getContacts").variants[1].returns[1].valuetype = "Contact"

-- Body:getFixtures table return type
findAPI("physics", "Body:getFixtures").variants[1].returns[1].valuetype = "Fixture"

-- Body:getJoints table return type
findAPI("physics", "Body:getJoints").variants[1].returns[1].valuetype = "Joint"

-- World:getBodies table return type
findAPI("physics", "World:getBodies").variants[1].returns[1].valuetype = "Body"

-- World:getContacts table return type
findAPI("physics", "World:getContacts").variants[1].returns[1].valuetype = "Contact"

-- World:getJoints table return type
findAPI("physics", "World:getJoints").variants[1].returns[1].valuetype = "Joint"

-- Override World:queryBoundingBox
overrides["physics.World:queryBoundingBox[1]"] = "queryBoundingBox: function(self: World, topLeftX: number, topLeftY: number, bottomRightX: number, bottomRightY: number, callback: function(fixture: Fixture): boolean)"

-- Override World:rayCast
overrides["physics.World:rayCast[1]"] = "rayCast: function(self: World, x1: number, y1: number, x2: number, y2: number, callback: (function(fixture: Fixture, x: number, y: number, xn: number, yn: number, fraction: number): number))"

-- love.physics.newChainShape modification
local newChainShape = findAPI("physics", "newChainShape")
newChainShape.variants[1].arguments[2].name = "..."
newChainShape.variants[2].arguments[2].valuetype = "number"

-- love.physics.newPolygonShape modification
local newPolygonShape = findAPI("physics", "newPolygonShape")
newPolygonShape.variants[1].arguments[1].name = "..."
newPolygonShape.variants[2].arguments[1].valuetype = "number"

-- Blacklist Channel:demand 1st variant so it only has 1 variant
overrides["thread.Channel:demand[1]"] = ""

-- Override Channel:performAtomic
overrides["thread.Channel:performAtomic[1]"] = "performAtomic: function(self: Channel, func: function(...: any): any..., ...: any): any..."

-- love.touch.getTouches return table type
findAPI("touch", "getTouches").variants[1].returns[1].valuetype = "light userdata"

-- Override love.window.getFullscreenModes return type to match a table of modes
overrides["window.getFullscreenModes[1]"] = "getFullscreenModes: function(displayindex: number): {FullscreenMode}"

-- Define love.window.getMode table return type record
findAPI("window", "getMode").variants[1].returns[3].typename = "WindowSetting"

-- Set love.window.setMode table flags type record
findAPI("window", "setMode").variants[1].arguments[3].typename = "WindowSetting"

-- Set love.window.updateMode table flags type record
findAPI("window", "updateMode").variants[1].arguments[3].typename = "WindowSetting"

-- Define FullscreenMode type
local Window = findAPI("window")
Window.types[#Window.types + 1] = {
	name = "FullscreenMode",
	fields = {
		{type = "number", name = "width"},
		{type = "number", name = "height"}
	}
}

-------------------------------------
-- Blacklisted Functions with TODO --
-------------------------------------

-- FIXME: Blacklist love.audio.getEffect until we have know how the table structured
overrides["audio.getEffect[1]"] = ""

-- FIXME: Blacklist World:getCallbacks and World:setCallbacks until we have better way to describe it
overrides["physics.World:getCallbacks[1]"] = ""
overrides["physics.World:setCallbacks[1]"] = ""

-- FIXME: Blacklist World:getContactFilter and World:setContactFilter until we have better way to describe it
overrides["physics.World:getContactFilter[1]"] = ""
overrides["physics.World:setContactFilter[1]"] = ""

-- FIXME: Blacklist love.window.showMessageBox 2nd variant until we have better way to describe it
overrides["window.showMessageBox[2]"] = ""

---@diagnostic enable: need-check-nil
end

------------------------------------
-- End of Changes to the LÖVE API --
------------------------------------

io.stderr:write("LÖVE API Version: ", api.version, "\n")

-- List all object and enum mapping first so we can reference it later
---@type table<string,{[1]:string,[2]:LoveAPIType|LoveAPIEnum}>
local loveTypes = {}

local function override(exec, module, name, ttype, variant)
	local key = ttype and (module.."."..ttype..":"..name) or module.."."..name

	if variant then
		key = key.."["..variant.."]"
	end

	if overrides[key] then
		if exec then
			local t = type(overrides[key])

			if t == "function" then
				return overrides[key]()
			elseif t == "string" or t == "table" then
				return overrides[key]
			end
		end

		return true
	end

	return false
end

---@param module string
---@param name string
---@param typeTable LoveAPIType[]
---@param fields LoveAPIFunctionVariable[]
local function insertType(module, name, typeTable, fields)
	if not loveTypes[name] then
		local t = {
			name = name,
			fields = {}
		}

		for _, v in ipairs(fields) do
			t.fields[#t.fields + 1] = {
				name = v.name,
				type = v.type
			}
		end

		loveTypes[name] = {module, t}
		typeTable[#typeTable + 1] = t
	else
		local newFields = {}
		local f = loveTypes[name][2].fields
		---@cast f LoveAPIFunctionVariable[]

		for _, v2 in ipairs(fields) do
			local found = false

			for _, v in ipairs(f) do
				if v.name == v2.name then
					if v.type ~= v2.type then
						io.stderr:write("Different type '", name, "' key '", v.name, "': ", v.type, " vs. ", v2.type, "\n")
					end

					found = true
					break
				end
			end

			if not found then
				newFields[#newFields + 1] = v2
			end
		end

		if #newFields > 0 then
			for _, v in ipairs(newFields) do
				f[#f + 1] = v
			end
		end
	end
end

---@param f LoveAPIFunction
---@param typeTable LoveAPIType[]
---@param module string
---@param typename? string
local function defineTypes(f, typeTable, module, typename)
	for i, v in ipairs(f.variants) do
		if override(false, module, f.name, typename, i) == false then
			if v.arguments then
				for _, arg in ipairs(v.arguments) do
					if arg.type == "table" and arg.table and arg.typename then
						-- Ensure we've created typename for it earlier
						if not arg.typename then
							error("typename not registered for "..module.." "..f.name.." "..(typename or ""))
						end

						-- Okay register
						insertType(module, arg.typename, typeTable, arg.table)
					end
				end
			end

			if v.returns then
				for _, ret in ipairs(v.returns) do
					if ret.type == "table" and ret.table then
						-- Ensure we've created typename for it earlier
						if not ret.typename then
							error("typename not registered for "..module.." "..f.name.." "..(typename or ""))
						end

						-- Okay register
						insertType(module, ret.typename, typeTable, ret.table)
					end
				end
			end
		end
	end
end

---@param data LoveAPI|LoveAPIModule
local function walk(data)
	-- Get enums
	if data.enums then
		for _, e in ipairs(data.enums) do
			local constants = {}

			for _, c in ipairs(e.constants) do
				constants[#constants + 1] = c.name
			end

			loveTypes[e.name] = {data.name or "love", e}
		end
	end

	-- Get types
	if data.types then
		for _, t in ipairs(data.types) do
			loveTypes[t.name] = {data.name or "love", t}

			-- Walk through the functions
			if t.functions then
				for _, f in ipairs(t.functions) do
					defineTypes(f, data.types, data.name or "love", t.name)
				end
			end
		end
	end

	-- Get functions
	if data.functions then
		for _, f in ipairs(data.functions) do
			defineTypes(f, data.types, data.name or "love")
		end
	end

	-- Get callbacks
	if data.callbacks then
		for _, f in ipairs(data.callbacks) do
			defineTypes(f, data.types, data.name or "love")
		end
	end

	if data.modules then
		for _, v in ipairs(data.modules) do
			walk(v)
		end
	end
end

---@param name string
---@param module string
local function getTypeName(name, module)
	-- If it's Teal built-in names, then return as-is
	if name == "any" or name == "boolean" or name == "number" or name == "string" or name == "table" then
		return name
	elseif name == "cdata" or name == "light userdata" or name == "Variant" then
		return "any"
	elseif name == "mainLoop" then
		-- Special case for functions returning the mainLoop
		return "function(): number|string|nil"
	elseif not loveTypes[name] then
		error("unknown type "..name)
	elseif loveTypes[name] and loveTypes[name][1] == module then
		return name
	else
		local type = loveTypes[name][1]
		if type == "thread" then
			return "love.thread."..name
		else
			return type.."."..name
		end
	end
end

-- Now list all methods and functions in classes
io.write(
	"-- generated with generate_tl.lua\n",
	"-- LÖVE ", api.version, "\n\n",
	"global "
)

---@param data LoveAPIFunction
---@param level integer
---@param module string
---@param object? string
local function writeFunction(data, level, module, object)
	local selfParam
	local tab = string.rep("\t", level)

	if object then
		selfParam = "self: "..getTypeName(object, module)
	end

	for i, v in ipairs(data.variants) do
		local ovr = override(true, module, data.name, object, i)

		if ovr then
			if #ovr > 0 then
				if type(ovr) == "table" then
					for j = 1, #ovr do
						io.write(tab, ovr[j], "\n")
					end
				else
					io.write(tab, ovr, "\n")
				end
			end
		else
			local args = {}
			local rets = {}

			-- Add "self"
			if selfParam then
				args[1] = selfParam
			end

			-- Add arguments
			if v.arguments then
				for _, arg in ipairs(v.arguments) do
					local ellipsis = arg.name == "..."
					local type

					if ellipsis then
						type = arg.type and getTypeName(arg.type, module) or "any"
					elseif arg.type == "table" then
						if arg.typename then
							type = getTypeName(arg.typename, module)
						else
							local tkey = arg.keytype or "number"
							local tvalue = arg.valuetype

							if tvalue == nil then
								type = "table"
							elseif tkey == "number" then
								assert(tvalue, "missing argument table value type")
								type = "{"..getTypeName(tvalue, module).."}"
							else
								type = "{"..getTypeName(tkey, module)..":"..getTypeName(tvalue, module).."}"
							end
						end
					else
						type = getTypeName(arg.type, module)
					end

					args[#args + 1] = arg.name..": "..type

					-- Teal doesn't like additional arguments after ellipsis
					if ellipsis then
						break
					end
				end
			end

			-- Add return types
			if v.returns then
				for _, ret in ipairs(v.returns) do
					local ellipsis = ret.name == "..."
					local type

					if ellipsis then
						type = ret.type and (getTypeName(ret.type, module).."...") or "any..."
					elseif ret.type == "table" then
						if ret.typename then
							type = getTypeName(ret.typename, module)
						else
							local tkey = ret.keytype or "number"
							local tvalue = ret.valuetype

							if tvalue == nil then
								type = "table"
							elseif tkey == "number" then
								assert(tvalue, "missing return table value type")
								type = "{"..getTypeName(tvalue, module).."}"
							else
								type = "{"..getTypeName(tkey, module)..":"..getTypeName(tvalue, module).."}"
							end
						end
					else
						type = getTypeName(ret.type, module)
					end

					rets[#rets + 1] = type

					-- Teal doesn't like additional return values after ellipsis
					if ellipsis then
						break
					end
				end
			end

			-- Write function
			io.write(tab, data.name, ": function(", table.concat(args, ", "), ")")

			-- If there's return value, also write those
			if #rets > 0 then
				io.write(": ", table.concat(rets, ", "))
			end

			-- Newline
			io.write("\n")
		end
	end
end

-- Write nested fields
---@param t LoveAPIType|LoveAPIFunctionVariable
---@param level integer
---@param module string
local function writeNestedFields(t, level, module)
	local tab = string.rep("\t", level)
	local tab1 = string.rep("\t", level + 1)

	io.write(tab, "type ", t.name, " = interface\n")

	if t.arraytype then
		io.write(tab1, "{", t.arraytype, "}\n")
	end

	if t.supertypes ~= nil then
		io.write(string.rep("\t", level + 1), "is "..table.concat(t.supertypes, ", "), "\n")
	end

	for _, v in ipairs(t.fields) do
		if v.type == "table" and v.table then
			writeNestedFields(v, level + 1, module)
		else
			io.write(tab1, v.name, ": ", getTypeName(v.type, module), "\n")
		end
	end

	io.write(tab, "end\n\n")
end

-- Create the recursive function for that
---@param name string
---@param data LoveAPI|LoveAPIModule
---@param level integer
local function startLookup(name, data, level)
	-- begin
	io.write(string.rep("\t", level), "type ", name, " = record\n")

	-- Increase indentation
	level = level + 1
	local tab = string.rep("\t", level)

	-- If there's enums, list it
	if data.enums and #data.enums > 0 then
		for _, e in ipairs(data.enums) do
			local tab1 = string.rep("\t", level + 1)

			-- Enumerate constants
			io.write(tab, "type ", e.name, " = enum\n")

			for _, c in ipairs(e.constants) do
				--io.write(tab1, "\"", c.name, "\"\n")
				io.write(tab1, string.format("%q", c.name), "\n")
			end

			io.write(tab, "end\n\n")
		end
	end

	-- If there's object, add it
	if data.types and #data.types > 0 then
		for _, t in ipairs(data.types) do
			if t.fields then
				writeNestedFields(t, level, name)
			else
				io.write(tab, "type ", t.name, " = interface\n")

				if t.supertypes ~= nil then
					io.write(string.rep("\t", level + 1), "is "..table.concat(t.supertypes, ", "), "\n")
				end

				if t.functions and #t.functions > 0 then
					for _, f in ipairs(t.functions) do
						writeFunction(f, level + 1, name, t.name)
					end
				end

				io.write(tab, "end\n\n")
			end
		end
	end

	-- If there's functions, add it
	if data.functions and #data.functions > 0 then
		for _, f in ipairs(data.functions) do
			writeFunction(f, level, name)
		end
		io.write("\n")
	end

	-- If there's callbacks, add it
	if data.callbacks and #data.callbacks > 0 then
		for _, f in ipairs(data.callbacks) do
			writeFunction(f, level, name)
		end
		io.write("\n")
	end

	-- If there's modules, add it too
	if data.modules and #data.modules > 0 then
		for _, m in ipairs(data.modules) do
			startLookup(m.name, m, level)
		end
	end

	-- end
	io.write(string.rep("\t", level - 1), "end\n")
end

-- And finally call it
walk(api)
startLookup("love", api, 0)

-- Finishing
io.write("\nreturn love\n")
