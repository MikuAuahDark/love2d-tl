-- Script to generate LÖVE Teal definitions

local api = require("love-api.love_api")

-- Overrides blacklist function for automatic generation
local overrides = {}

-----------------------------
-- Changes to the LÖVE API --
-----------------------------

-- love.graphics.newFont 4th dpiscale parameter for TrueType overload
assert(api.modules[5].name == "graphics" and api.modules[5].functions[52].name == "newFont")
api.modules[5].functions[52].variants[2].arguments[4] = {
	type = "number",
	name = "dpiscale",
	description = "The DPI scale factor of the font.",
	default = "love.graphics.getDPIScale()",
}

-- Move "Drawable" to love.graphics
assert(api.types[3].name == "Drawable")
table.insert(api.modules[5].types, 1, table.remove(api.types, 3))

-- Move ByteData to love.data
assert(api.types[1].name == "ByteData")
table.insert(api.modules[2].types, table.remove(api.types, 1))

-- Source:getActiveEffects table type is string
assert(api.modules[1].types[2].functions[2].name == "getActiveEffects")
api.modules[1].types[2].functions[2].variants[1].returns[1].valuetype = "string"

-- Remove Source:getEffect table fields and define the table type
assert(api.modules[1].types[2].functions[9].name == "getEffect")
api.modules[1].types[2].functions[9].variants[1].arguments[2].literal = true
api.modules[1].types[2].functions[9].variants[1].returns[1].table = nil
api.modules[1].types[2].functions[9].variants[1].returns[1].typename = "FilterSettings"

-- Define Source:getFilter table return type record
assert(api.modules[1].types[2].functions[10].name == "getFilter")
api.modules[1].types[2].functions[10].variants[1].returns[1].typename = "FilterSettings"

-- Define love.filesystem.getInfo table return type record
assert(api.modules[4].name == "filesystem" and api.modules[4].functions[8].name == "getInfo")
api.modules[4].functions[8].variants[1].returns[1].typename = "FileInfo"
api.modules[4].functions[8].variants[2].arguments[2].literal = true
api.modules[4].functions[8].variants[2].returns[1].typename = "FileInfo"
api.modules[4].functions[8].variants[3].arguments[3].literal = true
api.modules[4].functions[8].variants[3].returns[1].typename = "FileInfo"

-- Override Mesh:getVertexFormat
overrides["graphics.Mesh:getVertexFormat[1]"] = "getVertexFormat: function(self: Mesh): {{number|string}}"

-- Define graphics.getStats table return type record
assert(api.modules[5].functions[37].name == "getStats")
api.modules[5].functions[37].variants[1].returns[1].typename = "GraphicsStats"
api.modules[5].functions[37].variants[2].returns[1].typename = "GraphicsStats"

-- Define window.getMode table return type record
assert(api.modules[18].name == "window" and api.modules[18].functions[9].name == "getMode")
api.modules[18].functions[9].variants[1].returns[3].typename = "WindowSetting"

-- Set window.setMode table flags type record
assert(api.modules[18].functions[28].name == "setMode")
api.modules[18].functions[28].variants[1].arguments[3].typename = "WindowSetting"

-- Set window.updateMode table flags type record
assert(api.modules[18].functions[34].name == "updateMode")
api.modules[18].functions[34].variants[1].arguments[3].typename = "WindowSetting"

-- Add window.DisplayOrientation enum
table.insert(api.modules[18].enums, 1, {
	name = "DisplayOrientation",
	constants = {
		{name = "unknown"},
		{name = "landscape"},
		{name = "landscapeflipped"},
		{name = "portrait"},
		{name = "portraitflipped"}
	}
})

-- Add filesystem.DroppedFile type
table.insert(api.modules[4].types, 1, {
	name = "DroppedFile",
	supertypes = {"File", "Object"},
	functions = {}
})

-- Add Object functions
assert(api.types[2].name == "Object")
api.types[2].functions = {
	{
		name = "release",
		variants = {
			{
				returns = {
					{type = "boolean"}
				}
			}
		}
	},
	{
		name = "type",
		variants = {
			{
				returns = {
					{type = "string"}
				}
			}
		}
	},
	{
		name = "typeOf",
		variants = {
			{
				arguments = {
					{
						name = "name",
						type = "string"
					}
				},
				returns = {
					{type = "boolean"}
				}
			}
		}
	}
}

-- Add Data functions
assert(api.types[1].name == "Data")
api.types[1].functions = {
	{
		name = "clone",
		variants = {
			{
				returns = {
					{type = "Data"}
				}
			}
		}
	},
	{
		name = "getFFIPointer",
		variants = {
			{
				returns = {
					{type = "cdata"}
				}
			}
		}
	},
	{
		name = "getPointer",
		variants = {
			{
				returns = {
					{type = "light userdata"}
				}
			}
		}
	},
	{
		name = "getSize",
		variants = {
			{
				returns = {
					{type = "number"}
				}
			}
		}
	},
	{
		name = "getString",
		variants = {
			{
				returns = {
					{type = "string"}
				}
			}
		}
	}
}

-- Override love.run
overrides["love.run[1]"] = "run: function(): function(): string|number"

-- love.load table type arguments is string
assert(api.callbacks[19].name == "load")
api.callbacks[19].variants[1].arguments[1].valuetype = "string"
api.callbacks[19].variants[1].arguments[2].valuetype = "string"

-- Define love.conf table type argument
assert(api.callbacks[1].name == "conf")
api.callbacks[1].variants[1].arguments[1].typename = "Configuration"

-- Define Source:setEffect table argument type record
assert(api.modules[1].types[2].functions[30].name == "setEffect")
api.modules[1].types[2].functions[30].variants[2].arguments[2].typename = "FilterSettings"

-- Define Source:setFilter table argument type record
assert(api.modules[1].types[2].functions[31].name == "setFilter")
api.modules[1].types[2].functions[31].variants[1].arguments[1].typename = "FilterSettings"

-- love.audio.setEffect table type argument is {string:any}
-- TODO: Is this correct?
assert(api.modules[1].functions[21].name == "setEffect")
api.modules[1].functions[21].variants[1].arguments[2].keytype = "string"
api.modules[1].functions[21].variants[1].arguments[2].valuetype = "any"
api.modules[1].functions[21].variants[1].arguments[2].table = nil

-- Mesh:setVertex 2nd & 4th variant type arguments is number
assert(api.modules[5].types[5].name == "Mesh" and api.modules[5].types[5].functions[17].name == "setVertex")
api.modules[5].types[5].functions[17].variants[2].arguments[2].valuetype = "number"
api.modules[5].types[5].functions[17].variants[2].arguments[2].table = nil
api.modules[5].types[5].functions[17].variants[4].arguments[2].valuetype = "number"
api.modules[5].types[5].functions[17].variants[4].arguments[2].table = nil

-- Override Mesh:setVertices
assert(api.modules[5].types[5].functions[20].name =="setVertices")
overrides["graphics.Mesh:setVertices[1]"] = "setVertices: function(self: Mesh, vertices: {{number}}, startvertex: number)"
api.modules[5].types[5].functions[20].variants[3] = nil

-- Override Text:add 2nd variant
assert(api.modules[5].types[10].name == "Text")
overrides["graphics.Text:add[2]"] = "add: function(self: Text, coloredtext: {table|string}, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number"

-- Override Text:addf 2nd variant
overrides["graphics.Text:addf[2]"] = "addf: function(self: Text, coloredtext: {table|string}, wraplimit: number, align: AlignMode, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number"

-- Override Text:set 2nd variant
overrides["graphics.Text:set[2]"] = "set: function(self: Text, coloredtext: {table|string})"

-- Override Text:setf 2nd variant
overrides["graphics.Text:setf[2]"] = "setf: function(self: Text, coloredtext: {table|string}, wraplimit: number, alignmode: AlignMode)"

-- love.graphics.newArrayImage modification
assert(api.modules[5].functions[49].name == "newArrayImage")
api.modules[5].functions[49].variants[1].arguments[1].literal = true
api.modules[5].functions[49].variants[1].arguments[2].typename = "ImageSetting"

-- love.graphics.newCanvas modification
assert(api.modules[5].functions[50].name == "newCanvas")
api.modules[5].functions[50].variants[3].arguments[3].typename = "CanvasSetting"
api.modules[5].functions[50].variants[4].arguments[4].typename = "CanvasSetting"
overrides["graphics.newCanvas[5]"] = ""
api.modules[5].functions[50].variants[6].arguments[3].type = "PixelFormat"

-- Define love.graphics.newCubeImage table type argument
assert(api.modules[5].functions[51].name == "newCubeImage")
api.modules[5].functions[51].variants[1].arguments[2].typename = "ImageSetting"
api.modules[5].functions[51].variants[2].arguments[1].literal = true
api.modules[5].functions[51].variants[2].arguments[2].typename = "ImageSetting"

-- Define love.graphics.newImage table type argument
assert(api.modules[5].functions[53].name == "newImage")
api.modules[5].functions[53].variants[4].arguments[2].typename = "ImageSetting"
api.modules[5].functions[53].variants[5].arguments[2].type = "PixelFormat"

-- Override love.graphics.newMesh 1st, 3rd & 4th variant
overrides["graphics.newMesh[1]"] = "newMesh: function(vertices: {{number}}, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh"
overrides["graphics.newMesh[3]"] = "newMesh: function(vertexformat: {{number|string}}, vertices: {{number}}, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh"
overrides["graphics.newMesh[4]"] = "newMesh: function(vertexformat: {{number|string}}, vertexcount: number, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh"

-- Define love.graphics.newVideo table type argument
assert(api.modules[5].functions[61].name == "newVideo")
api.modules[5].functions[61].variants[3].arguments[2].typename = "VideoSetting"

-- Define love.graphics.newVolumeImage table type name
assert(api.modules[5].functions[62].name == "newVolumeImage")
api.modules[5].functions[62].variants[1].arguments[1].literal = true
api.modules[5].functions[62].variants[1].arguments[2].type = "ImageSetting"

-- Override love.graphics.points 2nd & 3rd variant
overrides["graphics.points[2]"] = "points: function(points: {number})"
overrides["graphics.points[3]"] = "points: function(points: {{number}})"

-- Override love.graphics.print 2nd, 4th, & 6th variant
overrides["graphics.print[2]"] = "print: function(coloredtext: {table|string}, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)"
overrides["graphics.print[4]"] = "print: function(coloredtext: {table|string}, transform: math.Transform)"
overrides["graphics.print[6]"] = "print: function(coloredtext: {table|string}, font: Font, transform: math.Transform)"

-- Add 7th love.graphics.print variant
assert(api.modules[5].functions[68].name == "print")
api.modules[5].functions[68].variants[7] = {
	arguments = {
		api.modules[5].functions[68].variants[1].arguments[1],
		api.modules[5].functions[68].variants[6].arguments[2],
		api.modules[5].functions[68].variants[1].arguments[2],
		api.modules[5].functions[68].variants[1].arguments[3],
		api.modules[5].functions[68].variants[1].arguments[4],
		api.modules[5].functions[68].variants[1].arguments[5],
		api.modules[5].functions[68].variants[1].arguments[6],
		api.modules[5].functions[68].variants[1].arguments[7],
		api.modules[5].functions[68].variants[1].arguments[8],
		api.modules[5].functions[68].variants[1].arguments[9],
		api.modules[5].functions[68].variants[1].arguments[10]
	}
}

-- Override love.graphics.printf 5-8th variant
overrides["graphics.printf[5]"] = "printf: function(coloredtext: {table|string}, x: number, y: number, limit: number, align: AlignMode, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)"
overrides["graphics.printf[6]"] = "printf: function(coloredtext: {table|string}, font: Font, x: number, y: number, limit: number, align: AlignMode, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)"
overrides["graphics.printf[7]"] = "printf: function(coloredtext: {table|string}, transform: math.Transform, limit: number, align: AlignMode)"
overrides["graphics.printf[8]"] = "printf: function(coloredtext: {table|string}, font: Font, transform: math.Transform, limit: number, align: AlignMode)"

-- love.audio.getActiveEffects table type is string
assert(api.modules[1].functions[1].name == "getActiveEffects")
api.modules[1].functions[1].variants[1].returns[1].valuetype = "string"

-- love.audio.getRecordingDevices return table type is RecordingDevice
assert(api.modules[1].functions[10].name == "getRecordingDevices")
api.modules[1].functions[10].variants[1].returns[1].valuetype = "RecordingDevice"

-- love.audio.pause table type is Source
assert(api.modules[1].functions[17].name == "pause")
api.modules[1].functions[17].variants[1].returns[1].valuetype = "Source"
api.modules[1].functions[17].variants[3].arguments[1].valuetype = "Source"

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

-- Remove love.event.Event enum
assert(api.modules[3].name == "event")
assert(api.modules[3].enums[1].name == "Event")
table.remove(api.modules[3].enums, 1)

-- Override love.event.push
overrides["event.push[1]"] = "push: function(n: string, ...: any)"

-- Override love.event.wait
overrides["event.wait[1]"] = "wait: function(): string, any..."

-- Override File:lines
overrides["filesystem.File:lines[1]"] = "lines: function(self: File): function(): string"

-- Override File:read 2nd variant
overrides["filesystem.File:read[2]"] = "read: function(self: File, container: data.ContainerType, bytes: number): string|FileData"

-- love.filesystem.getDirectoryItems table return type and 2nd variant override
assert(api.modules[4].functions[6].name == "getDirectoryItems")
api.modules[4].functions[6].variants[1].returns[1].valuetype = "string"
overrides["filesystem.getDirectoryItems[2]"] = "getDirectoryItems: function(dir: string, callback: function(filename: string)): {string}"

-- Override love.filesystem.lines
overrides["filesystem.lines[1]"] = "lines: function(name: string): function(): string"

-- Override love.filesystem.load
overrides["filesystem.load[1]"] = "load: function(name: string): function(...: any): any..., string"

-- Override love.filesystem.read
overrides["filesystem.read[1]"] = "read: function(name: string, size: number): string, number|string"
overrides["filesystem.read[2]"] = "read: function(container: data.ContainerType, name: string, size: number): string|FileData, number|string"

-- Define love.graphics.MipmapMode enum
api.modules[5].enums[#api.modules[5].enums + 1] = {
	name = "MipmapMode",
	constants = {
		{name = "none"},
		{name = "manual"},
		{name = "auto"}
	}
}

-- Override Canvas:renderTo
overrides["graphics.Canvas:renderTo[1]"] = "renderTo: function(func: function())"

-- Font:getWrap table return type is string
assert(api.modules[5].types[3].name == "Font" and api.modules[5].types[3].functions[9].name == "getWrap")
api.modules[5].types[3].functions[9].variants[1].returns[2].valuetype = "string"

-- Remove almost all functions from Image object as it was inherited from Texture
assert(api.modules[5].types[4].name == "Image")
api.modules[5].types[4].functions[9] = nil
api.modules[5].types[4].functions[8] = nil
table.remove(api.modules[5].types[4].functions, 6)
table.remove(api.modules[5].types[4].functions, 5)
table.remove(api.modules[5].types[4].functions, 4)
table.remove(api.modules[5].types[4].functions, 2)

-- Define Image:isCompressed
api.modules[5].types[4].functions[1] = {
	name = "isCompressed",
	variants = {
		{
			returns = {
				{type = "boolean"}
			}
		}
	}
}

-- Add ImageFlag enum
api.modules[5].enums[#api.modules[5].enums + 1] = {
	name = "ImageFlag",
	constants = {
		{name = "linear"},
		{name = "mipmaps"}
	}
}

-- Image:getFlags table return type is ImageFlag
assert(api.modules[5].types[4].functions[2].name == "getFlags")
api.modules[5].types[4].functions[2].variants[1].returns[1].valuetype = "ImageFlag"

-- Add VertexAttributeStep enum
api.modules[5].enums[#api.modules[5].enums + 1] = {
	name = "VertexAttributeStep",
	constants = {
		{name = "pervertex"},
		{name = "perinstance"}
	}
}

-- Mesh:getVertexMap table return type is number
assert(api.modules[5].types[5].functions[11].name == "getVertexMap")
api.modules[5].types[5].functions[11].variants[1].returns[1].valuetype = "number"

-- Mesh:setVertexMap tweaks
assert(api.modules[5].types[5].functions[19].name == "setVertexMap")
api.modules[5].types[5].functions[19].variants[1].arguments[1].valuetype = "number"
api.modules[5].types[5].functions[19].variants[2].arguments[1].name = "..."

-- Define IndexDataType enum
api.modules[5].enums[#api.modules[5].enums + 1] = {
	name = "IndexDataType",
	constants = {
		{name = "uint16"},
		{name = "uint32"}
	}
}

-- ParticleSystem:getQuads table return type is Quad
assert(api.modules[5].types[6].name == "ParticleSystem" and api.modules[5].types[6].functions[16].name == "getQuads")
api.modules[5].types[6].functions[16].variants[1].returns[1].valuetype = "Quad"

-- love.audio.play 2nd variant table argument
assert(api.modules[1].functions[18].name == "play")
api.modules[1].functions[18].variants[2].arguments[1].valuetype = "Source"
api.modules[1].functions[18].variants[3].arguments[1].name = "..."

-- love.audio.stop 2nd variant table argument
assert(api.modules[1].functions[27].name == "stop")
api.modules[1].functions[27].variants[3].arguments[1].name = "..."
api.modules[1].functions[27].variants[4].arguments[1].valuetype = "Source"

-- ParticleSystem:setQuads modification
assert(api.modules[5].types[6].functions[46].name == "setQuads")
api.modules[5].types[6].functions[46].variants[1].arguments[1].name = "..."
api.modules[5].types[6].functions[46].variants[2].arguments[1].valuetype = "Quad"

-- Shader:send modification
assert(api.modules[5].types[8].name == "Shader" and api.modules[5].types[8].functions[3].name == "send")
api.modules[5].types[8].functions[3].variants[1].arguments[2].name = "..."
api.modules[5].types[8].functions[3].variants[2].arguments[2].name = "..."
api.modules[5].types[8].functions[3].variants[2].arguments[2].valuetype = "number"
overrides["graphics.Shader:send[3]"] = "send: function(self: Shader, name: string, ...: {{number}})"
api.modules[5].types[8].functions[3].variants[5].arguments[2].name = "..."
api.modules[5].types[8].functions[3].variants[5].arguments[2].valuetype = "number"
overrides["graphics.Shader:send[6]"] = "send: function(self: Shader, name: string, matrixLayout: math.MatrixLayout, ...: {{number}})"

-- Shader:sendColor modification
assert(api.modules[5].types[8].functions[4].name == "sendColor")
api.modules[5].types[8].functions[4].variants[1].arguments[2].name = "..."
api.modules[5].types[8].functions[4].variants[1].arguments[2].valuetype = "number"

-- Define PixelFormat enum
api.modules[6].enums[#api.modules[6].enums + 1] = {
	name = "PixelFormat",
	constants = {
		{name = "unknown"},

		{name = "normal"},
		{name = "hdr"},

		{name = "r8"},
		{name = "rg8"},
		{name = "rgba8"},
		{name = "rgba8"},
		{name = "srgba8"},
		{name = "r16"},
		{name = "rg16"},
		{name = "rgba16"},
		{name = "r16f"},
		{name = "rg16f"},
		{name = "rgba16f"},
		{name = "r32f"},
		{name = "rg32f"},
		{name = "rgba32f"},

		{name = "la8"},

		{name = "rgba4"},
		{name = "rgb5a1"},
		{name = "rgb565"},
		{name = "rgb10a2"},
		{name = "rg11b10f"},

		{name = "stencil8"},
		{name = "depth16"},
		{name = "depth24"},
		{name = "depth32f"},
		{name = "depth24stencil8"},
		{name = "depth32fstencil8"},

		{name = "DXT1"},
		{name = "DXT3"},
		{name = "DXT5"},
		{name = "BC4"},
		{name = "BC4s"},
		{name = "BC5"},
		{name = "BC5s"},
		{name = "BC6h"},
		{name = "BC6hs"},
		{name = "BC7"},
		{name = "PVR1rgb2"},
		{name = "PVR1rgb4"},
		{name = "PVR1rgba2"},
		{name = "PVR1rgba4"},
		{name = "ETC1"},
		{name = "ETC2rgb"},
		{name = "ETC2rgba"},
		{name = "ETC2rgba1"},
		{name = "EACr"},
		{name = "EACrs"},
		{name = "EACrg"},
		{name = "EACrgs"},
		{name = "ASTC4x4"},
		{name = "ASTC5x4"},
		{name = "ASTC5x5"},
		{name = "ASTC6x5"},
		{name = "ASTC6x6"},
		{name = "ASTC8x5"},
		{name = "ASTC8x6"},
		{name = "ASTC8x8"},
		{name = "ASTC10x5"},
		{name = "ASTC10x6"},
		{name = "ASTC10x8"},
		{name = "ASTC10x10"},
		{name = "ASTC12x10"},
		{name = "ASTC12x12"}
	}
}

-- Override love.graphics.captureScreenshot 2nd variant
overrides["graphics.captureScreenshot[2]"] = "captureScreenshot: function(callback: function(image: image.ImageData))"

-- Override love.graphics.clear 3rd variant
overrides["graphics.clear[3]"] = "clear: function(...: {number}|boolean)"

-- love.graphics.discard 2nd variant table value type
assert(api.modules[5].functions[6].name == "discard")
api.modules[5].functions[6].variants[2].arguments[1].valuetype = "boolean"

-- love.graphics.getCanvasFormats variant table return type
assert(api.modules[5].functions[15].name == "getCanvasFormats")
api.modules[5].functions[15].variants[1].returns[1].keytype = "PixelFormat"
api.modules[5].functions[15].variants[1].returns[1].valuetype = "boolean"
api.modules[5].functions[15].variants[2].returns[1].keytype = "PixelFormat"
api.modules[5].functions[15].variants[2].returns[1].valuetype = "boolean"

-- Define VertexWinding enum
api.modules[5].enums[#api.modules[5].enums + 1] = {
	name = "VertexWinding",
	constants = {
		{name = "cw"},
		{name = "ccw"}
	}
}

-- love.graphics.getImageFormats variant table return type
assert(api.modules[5].functions[25].name == "getImageFormats")
api.modules[5].functions[25].variants[1].returns[1].keytype = "PixelFormat"
api.modules[5].functions[25].variants[1].returns[1].valuetype = "boolean"

-- love.graphics.getStats modification
assert(api.modules[5].functions[37].name == "getStats")
api.modules[5].functions[37].variants[1].returns[1].typename = "Stats"
api.modules[5].functions[37].variants[2].arguments[1].literal = true
api.modules[5].functions[37].variants[2].returns[1].typename = "Stats"

-- love.graphics.getSupported return table type
assert(api.modules[5].functions[39].name == "getSupported")
api.modules[5].functions[39].variants[1].returns[1].keytype = "GraphicsFeature"
api.modules[5].functions[39].variants[1].returns[1].valuetype = "boolean"

-- love.graphics.getSystemLimits return table type
assert(api.modules[5].functions[40].name == "getSystemLimits")
api.modules[5].functions[40].variants[1].returns[1].keytype = "GraphicsLimit"
api.modules[5].functions[40].variants[1].returns[1].valuetype = "boolean"

-- love.graphics.getTextureTypes return table type
assert(api.modules[5].functions[41].name == "getTextureTypes")
api.modules[5].functions[41].variants[1].returns[1].keytype = "TextureTypes"
api.modules[5].functions[41].variants[1].returns[1].valuetype = "boolean"

-- Define TextureTypes enum
api.modules[5].enums[#api.modules[5].enums + 1] = {
	name = "TextureTypes",
	constants = {
		{name = "2d"},
		{name = "array"},
		{name = "cube"},
		{name = "volume"}
	}
}

-- love.graphics.line 2nd variant argument table type
assert(api.modules[5].functions[48].name == "line")
api.modules[5].functions[48].variants[1].arguments[1].name = "..."
api.modules[5].functions[48].variants[2].arguments[1].valuetype = "number"

-- love.font module
api.modules[#api.modules + 1] = {
	name = "font",
	types = {
		{
			name = "GlyphData",
			supertypes = {"Data", "Object"},
			functions = {}
		},
		{
			name = "Rasterizer",
			supertypes = {"Object"},
			functions = {
				{
					name = "getAdvance",
					variants = {
						{
							returns = {
								{type = "number"}
							}
						}
					}
				},
				api.modules[5].types[3].functions[1],
				api.modules[5].types[3].functions[4],
				{
					name = "getGlyphCount",
					variants = {
						{
							returns = {
								{type = "number"}
							}
						}
					}
				},
				{
					name = "getGlyphData",
					variants = {
						{
							arguments = {
								{type = "string", name = "glyph"}
							},
							returns = {
								{type = "GlyphData"}
							}
						},
						{
							arguments = {
								{type = "number", name = "glyphNumber"}
							},
							returns = {
								{type = "GlyphData"}
							}
						}
					}
				},
				api.modules[5].types[3].functions[6],
				api.modules[5].types[3].functions[7],
				{
					name = "hasGlyphs",
					variants = {
						{
							arguments = {
								{type = "string or number", name = "..."}
							},
							returns = {
								{type = "boolean"}
							}
						}
					}
				}
			}
		}
	},
	enums = {
		{
			name = "HintingMode",
			constants = {
				{name = "normal"},
				{name = "light"},
				{name = "mono"},
				{name = "none"}
			}
		}
	}
}

-- Rasterizer:hasGlyphs override
overrides["font.Rasterizer:hasGlyphs[1]"] = "hasGlyphs: function(self: Rasterizer, ...: number|string): boolean"

-- love.graphics.newShader 2nd variant override
assert(api.modules[5].functions[58].name == "newShader")
api.modules[5].functions[58].variants[2] = {
	arguments = {
		{type = "string", name = "pixelcode"},
		{type = "string", name = "vertexcode"}
	},
	returns = {
		{type = "Shader"}
	}
}

-- love.graphics.polygon 2nd variant table argument type
assert(api.modules[5].functions[65].name == "polygon")
api.modules[5].functions[65].variants[2].arguments[2].valuetype = "number"

-- love.graphics.setColor 2nd variant table argument type
assert(api.modules[5].functions[79].name == "setColor")
api.modules[5].functions[79].variants[2].arguments[1].valuetype = "number"

-- Override love.graphics.stencil
overrides["graphics.stencil[1]"] = "stencil: function(stencilfunction: function(), action: StencilAction, value: number, keepvalues: boolean)"

-- Override ImageData:mapPixel
overrides["image.ImageData:mapPixel[1]"] = "mapPixel: function(self: ImageData, pixelFunction: function(x: number, y: number, r: number, g: number, b: number, a: number): (number, number, number, number), x: number, y: number, width: number, height: number)"

-- love.joystick.getJoysticks table return type
assert(api.modules[7].name == "joystick" and api.modules[7].functions[3].name == "getJoysticks")
api.modules[7].functions[3].variants[1].returns[1].valuetype = "Joystick"

-- BezierCurve:render table return type
assert(api.modules[9].name == "math" and api.modules[9].types[1].name == "BezierCurve" and api.modules[9].types[1].functions[9].name == "render")
api.modules[9].types[1].functions[9].variants[1].returns[1].valuetype = "number"

-- BezierCurve:renderSegment table return type
assert(api.modules[9].types[1].functions[10].name == "renderSegment")
api.modules[9].types[1].functions[10].variants[1].returns[1].valuetype = "number"

-- Rename Transform:isAffine to Transform:isAffine2DTransform
assert(api.modules[9].types[4].name == "Transform")
api.modules[9].types[4].functions[6].name = "isAffine2DTransform"

-- Transform:setMatrix modification
assert(api.modules[9].types[4].functions[10].name == "setMatrix")
api.modules[9].types[4].functions[10].variants[1].arguments[1].name = "..."
api.modules[9].types[4].functions[10].variants[2].arguments[2].name = "..."
api.modules[9].types[4].functions[10].variants[3].arguments[2].valuetype = "number"
overrides["math.Transform:setMatrix[4]"] = "setMatrix: function(self: Transform, layout: MatrixLayout, matrix: {{number}}): Transform"

-- love.math.gammaToLinear table argument type
assert(api.modules[9].functions[5].name == "gammaToLinear")
api.modules[9].functions[5].variants[2].arguments[1].valuetype = "number"

-- love.math.isConvex modification
assert(api.modules[9].functions[8].name == "isConvex")
api.modules[9].functions[8].variants[1].arguments[1].valuetype = "number"
api.modules[9].functions[8].variants[2].arguments[1].name = "..."

-- love.math.linearToGamma table argument type
assert(api.modules[9].functions[9].name == "linearToGamma")
api.modules[9].functions[9].variants[2].arguments[1].valuetype = "number"

-- love.math.newBezierCurve modification
assert(api.modules[9].functions[10].name == "newBezierCurve")
api.modules[9].functions[10].variants[1].arguments[1].valuetype = "number"
api.modules[9].functions[10].variants[2].arguments[1].name = "..."

-- love.math.triangulate modification
assert(api.modules[9].functions[18].name == "triangulate")
api.modules[9].functions[18].variants[1].arguments[1].valuetype = "number"
api.modules[9].functions[18].variants[1].returns[1].valuetype = "number"
api.modules[9].functions[18].variants[2].arguments[1].name = "..."
api.modules[9].functions[18].variants[2].returns[1].valuetype = "number"

-- love.mouse.isDown modifications
assert(api.modules[10].name == "mouse" and api.modules[10].functions[9].name == "isDown")
api.modules[10].functions[9].variants[1].arguments[1].name = "..."
overrides["mouse.isDown[2]"] = ""

-- Body:getContacts table return type
assert(api.modules[11].name == "physics" and api.modules[11].types[1].name == "Body" and api.modules[11].types[1].functions[9].name == "getContacts")
api.modules[11].types[1].functions[9].variants[1].returns[1].valuetype = "Contact"

-- Body:getFixtures table return type
assert(api.modules[11].types[1].functions[10].name == "getFixtures")
api.modules[11].types[1].functions[10].variants[1].returns[1].valuetype = "Fixture"

-- Body:getJoints table return type
assert(api.modules[11].types[1].functions[13].name == "getJoints")
api.modules[11].types[1].functions[13].variants[1].returns[1].valuetype = "Joint"

-- World:getBodies table return type
assert(api.modules[11].types[21].name == "World" and api.modules[11].types[21].functions[2].name == "getBodies")
api.modules[11].types[21].functions[2].variants[1].returns[1].valuetype = "Body"

-- World:getContacts table return type
assert(api.modules[11].types[21].functions[7].name == "getContacts")
api.modules[11].types[21].functions[7].variants[1].returns[1].valuetype = "Contact"

-- World:getJoints table return type
assert(api.modules[11].types[21].functions[10].name == "getJoints")
api.modules[11].types[21].functions[10].variants[1].returns[1].valuetype = "Joint"

-- Override World:queryBoundingBox
overrides["physics.World:queryBoundingBox[1]"] = "queryBoundingBox: function(self: World, topLeftX: number, topLeftY: number, bottomRightX: number, bottomRightY: number, callback: function(fixture: Fixture): boolean)"

-- love.physics.newChainShape modification
assert(api.modules[11].functions[4].name == "newChainShape")
api.modules[11].functions[4].variants[1].arguments[2].name = "..."
api.modules[11].functions[4].variants[2].arguments[2].valuetype = "number"

-- love.physics.newPolygonShape modification
assert(api.modules[11].functions[13].name == "newPolygonShape")
api.modules[11].functions[13].variants[1].arguments[1].name = "..."
api.modules[11].functions[13].variants[2].arguments[1].valuetype = "number"

-- Blacklist Channel:demand 1st variant so it only has 1 variant
overrides["thread.Channel:demand[1]"] = ""

-- Override Channel:performAtomic
overrides["thread.Channel:performAtomic[1]"] = "performAtomic: function(self: Channel, func: function(...: any): any..., ...: any): any..."

-- love.touch.getTouches return table type
assert(api.modules[16].name == "touch" and api.modules[16].functions[3].name == "getTouches")
api.modules[16].functions[3].variants[1].returns[1].valuetype = "light userdata"

-- Define FullscreenMode type
assert(api.modules[18].name == "window")
api.modules[18].types[#api.modules[18].types + 1] = {
	name = "FullscreenMode",
	fields = {
		{type = "number", name = "width"},
		{type = "number", name = "height"}
	}
}

-- love.window.getFullscreenModes return table type
assert(api.modules[18].functions[7].name == "getFullscreenModes")
api.modules[18].functions[7].variants[1].returns[1].valuetype = "FullscreenMode"

-- love.event.quit override
overrides["event.quit[1]"] = "quit: function(exitstatus: number|string)"
overrides["event.quit[2]"] = ""

-- Rewrite love.audio.setOrientation arguments
assert(api.modules[1].functions[23].name == "setOrientation")
api.modules[1].functions[23].variants[1] = {
	arguments = {
		{type = "number", name = "fx"},
		{type = "number", name = "fy"},
		{type = "number", name = "fz"},
		{type = "number", name = "ux"},
		{type = "number", name = "uy"},
		{type = "number", name = "uz"}
	}
}

-- Move CompressedDataFormat enum from love.math to love.data
assert(api.modules[9].enums[1].name == "CompressedDataFormat")
api.modules[2].enums[#api.modules[2].enums + 1] = table.remove(api.modules[9].enums, 1)

-- Move CompressedData type from love.math to love.data
assert(api.modules[9].types[2].name == "CompressedData")
api.modules[2].types[#api.modules[2].types + 1] = table.remove(api.modules[9].types, 2)

-------------------------------------
-- Blacklisted Functions with TODO --
-------------------------------------

-- FIXME: Blacklist love.graphics.setCanvas 5th variant until we have better way to describe it
overrides["graphics.setCanvas[5]"] = ""

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

------------------------------------
-- End of Changes to the LÖVE API --
------------------------------------

io.stderr:write("LÖVE API Version: ", api.version, "\n")

-- List all object and enum mapping first so we can reference it later
local loveTypes = {} -- [typename] = modulename

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

local function defineTypes(f, typeTable, module, typename)
	for i, v in ipairs(f.variants) do
		if override(false, module, f.name, typename, i) == false then
			if v.arguments then
				for _, arg in ipairs(v.arguments) do
					if arg.type == "table" and arg.table then
						-- Ensure we've created typename for it earlier
						if not arg.typename then
							error("typename not registered for "..module.." "..f.name.." "..(typename or ""))
						end

						-- Okay register
						if not loveTypes[arg.typename] then
							loveTypes[arg.typename] = module
							typeTable[#typeTable + 1] = {
								name = arg.typename,
								fields = arg.table
							}
						end
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
						if not loveTypes[ret.typename] then
							loveTypes[ret.typename] = module
							typeTable[#typeTable + 1] = {
								name = ret.typename,
								fields = ret.table
							}
						end
					end
				end
			end
		end
	end
end

local function walk(data)
	-- Get enums
	if data.enums then
		for _, e in ipairs(data.enums) do
			local constants = {}

			for _, c in ipairs(e.constants) do
				constants[#constants + 1] = c.name
			end

			loveTypes[e.name] = data.name or "love"
		end
	end

	-- Get types
	if data.types then
		for _, t in ipairs(data.types) do
			loveTypes[t.name] = data.name or "love"

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

local function getTypeName(name, module)
	-- If it's Teal built-in names, then return as-is
	if name == "any" or name == "boolean" or name == "number" or name == "string" or name == "table" then
		return name
	elseif name == "cdata" or name == "light userdata" or name == "Variant" then
		return "any"
	elseif not loveTypes[name] then
		error("unknown type "..name)
	elseif loveTypes[name] == module then
		return name
	else
		local type = loveTypes[name]
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
	"local "
)

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

							assert(arg.table == nil, "need to define type for the argument table")

							if tvalue == nil and arg.literal then
								type = "table"
							else
								if tkey == "number" then
									assert(tvalue, "missing argument table value type")
									type = "{"..getTypeName(tvalue, module).."}"
								else
									type = "{"..getTypeName(tkey, module)..":"..getTypeName(tvalue, module).."}"
								end
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

							assert(ret.table == nil, "need to define type for the return value")

							if tkey == "number" then
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
local function writeNestedFields(name, fields, level, module)
	local tab = string.rep("\t", level)
	local tab1 = string.rep("\t", level + 1)

	io.write(tab, name, " = record\n")

	for _, v in ipairs(fields) do
		if v.type == "table" and v.table then
			writeNestedFields(v.name, v.table, level + 1, module)
		else
			io.write(tab1, v.name, ": ", getTypeName(v.type, module), "\n")
		end
	end

	io.write(tab, "end\n\n")
end

-- Create the recursive function for that
local function startLookup(name, data, level)
	-- begin
	io.write(string.rep("\t", level), name, " = record\n")

	-- Increase indentation
	level = level + 1
	local tab = string.rep("\t", level)

	-- If there's enums, list it
	if data.enums and #data.enums > 0 then
		for _, e in ipairs(data.enums) do
			local tab1 = string.rep("\t", level + 1)

			-- Enumerate constants
			io.write(tab, e.name, " = enum\n")

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
				writeNestedFields(t.name, t.fields, level, name)
			else
				io.write(tab, t.name, " = record\n")

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
