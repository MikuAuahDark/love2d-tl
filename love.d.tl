-- generated with generate_tl.lua
-- LÖVE 11.3

global type love = record
	type Data = record
		clone: function(self: Data): Data
		getFFIPointer: function(self: Data): any
		getPointer: function(self: Data): any
		getSize: function(self: Data): number
		getString: function(self: Data): string
	end

	type Object = record
		release: function(self: Object): boolean
		type: function(self: Object): string
		typeOf: function(self: Object, name: string): boolean
	end

	type Configuration = record
		identity: string
		appendidentity: boolean
		version: string
		console: boolean
		accelerometerjoystick: boolean
		externalstorage: boolean
		gammacorrect: boolean
		type audio = record
			mic: boolean
			mixwithsystem: boolean
		end

		type window = record
			title: string
			icon: string
			width: number
			height: number
			borderless: boolean
			resizable: boolean
			minwidth: number
			minheight: number
			fullscreen: boolean
			fullscreentype: string
			usedpiscale: boolean
			vsync: number
			depth: number
			stencil: number
			msaa: number
			display: number
			highdpi: boolean
			x: number
			y: number
		end

		type modules = record
			audio: boolean
			event: boolean
			graphics: boolean
			image: boolean
			joystick: boolean
			keyboard: boolean
			math: boolean
			mouse: boolean
			physics: boolean
			sound: boolean
			system: boolean
			timer: boolean
			touch: boolean
			video: boolean
			window: boolean
			thread: boolean
		end

	end

	getVersion: function(): number, number, number, string
	hasDeprecationOutput: function(): boolean
	setDeprecationOutput: function(enable: boolean)

	conf: function(t: Configuration)
	directorydropped: function(path: string)
	displayrotated: function(index: number, orientation: window.DisplayOrientation)
	draw: function()
	errorhandler: function(msg: string)
	filedropped: function(file: filesystem.DroppedFile)
	focus: function(focus: boolean)
	gamepadaxis: function(joystick: joystick.Joystick, axis: joystick.GamepadAxis, value: number)
	gamepadpressed: function(joystick: joystick.Joystick, button: joystick.GamepadButton)
	gamepadreleased: function(joystick: joystick.Joystick, button: joystick.GamepadButton)
	joystickadded: function(joystick: joystick.Joystick)
	joystickaxis: function(joystick: joystick.Joystick, axis: number, value: number)
	joystickhat: function(joystick: joystick.Joystick, hat: number, direction: joystick.JoystickHat)
	joystickpressed: function(joystick: joystick.Joystick, button: number)
	joystickreleased: function(joystick: joystick.Joystick, button: number)
	joystickremoved: function(joystick: joystick.Joystick)
	keypressed: function(key: keyboard.KeyConstant, scancode: keyboard.Scancode, isrepeat: boolean)
	keypressed: function(key: keyboard.KeyConstant, isrepeat: boolean)
	keyreleased: function(key: keyboard.KeyConstant, scancode: keyboard.Scancode)
	load: function(arg: {string}, unfilteredArg: {string})
	lowmemory: function()
	mousefocus: function(focus: boolean)
	mousemoved: function(x: number, y: number, dx: number, dy: number, istouch: boolean)
	mousepressed: function(x: number, y: number, button: number, istouch: boolean, presses: number)
	mousereleased: function(x: number, y: number, button: number, istouch: boolean, presses: number)
	quit: function(): boolean
	resize: function(w: number, h: number)
	run: function(): function(): string|number
	textedited: function(text: string, start: number, length: number)
	textinput: function(text: string)
	threaderror: function(thread: love.thread.Thread, errorstr: string)
	touchmoved: function(id: any, x: number, y: number, dx: number, dy: number, pressure: number)
	touchpressed: function(id: any, x: number, y: number, dx: number, dy: number, pressure: number)
	touchreleased: function(id: any, x: number, y: number, dx: number, dy: number, pressure: number)
	update: function(dt: number)
	visible: function(visible: boolean)
	wheelmoved: function(x: number, y: number)

	type audio = record
		type DistanceModel = enum
			"none"
			"inverse"
			"inverseclamped"
			"linear"
			"linearclamped"
			"exponent"
			"exponentclamped"
		end

		type EffectType = enum
			"chorus"
			"compressor"
			"distortion"
			"echo"
			"equalizer"
			"flanger"
			"reverb"
			"ringmodulator"
		end

		type EffectWaveform = enum
			"sawtooth"
			"sine"
			"square"
			"triangle"
		end

		type FilterType = enum
			"lowpass"
			"highpass"
			"bandpass"
		end

		type SourceType = enum
			"static"
			"stream"
			"queue"
		end

		type TimeUnit = enum
			"seconds"
			"samples"
		end

		type RecordingDevice = record
			getBitDepth: function(self: RecordingDevice): number
			getBitDepth: function(self: RecordingDevice): number
			getChannelCount: function(self: RecordingDevice): number
			getData: function(self: RecordingDevice): sound.SoundData
			getName: function(self: RecordingDevice): string
			getSampleCount: function(self: RecordingDevice): number
			getSampleRate: function(self: RecordingDevice): number
			isRecording: function(self: RecordingDevice): boolean
			start: function(self: RecordingDevice, samplecount: number, samplerate: number, bitdepth: number, channels: number): boolean
			stop: function(self: RecordingDevice): sound.SoundData
		end

		type Source = record
			clone: function(self: Source): Source
			getActiveEffects: function(self: Source): {string}
			getAirAbsorption: function(self: Source): number
			getAttenuationDistances: function(self: Source): number, number
			getChannelCount: function(self: Source): number
			getCone: function(self: Source): number, number, number
			getDirection: function(self: Source): number, number, number
			getDuration: function(self: Source, unit: TimeUnit): number
			getEffect: function(self: Source, name: string, filtersettings: table): FilterSettings
			getFilter: function(self: Source): FilterSettings
			getFreeBufferCount: function(self: Source): number
			getPitch: function(self: Source): number
			getPosition: function(self: Source): number, number, number
			getRolloff: function(self: Source): number
			getType: function(self: Source): SourceType
			getVelocity: function(self: Source): number, number, number
			getVolume: function(self: Source): number
			getVolumeLimits: function(self: Source): number, number
			isLooping: function(self: Source): boolean
			isPlaying: function(self: Source): boolean
			isRelative: function(self: Source): boolean
			pause: function(self: Source)
			play: function(self: Source): boolean
			queue: function(self: Source, sounddata: sound.SoundData): boolean
			seek: function(self: Source, offset: number, unit: TimeUnit)
			setAirAbsorption: function(self: Source, amount: number)
			setAttenuationDistances: function(self: Source, ref: number, max: number)
			setCone: function(self: Source, innerAngle: number, outerAngle: number, outerVolume: number)
			setDirection: function(self: Source, x: number, y: number, z: number)
			setEffect: function(self: Source, name: string, enable: boolean): boolean
			setEffect: function(self: Source, name: string, filtersettings: FilterSettings): boolean
			setFilter: function(self: Source, settings: FilterSettings): boolean
			setFilter: function(self: Source)
			setLooping: function(self: Source, loop: boolean)
			setPitch: function(self: Source, pitch: number)
			setPosition: function(self: Source, x: number, y: number, z: number)
			setRelative: function(self: Source, enable: boolean)
			setRolloff: function(self: Source, rolloff: number)
			setVelocity: function(self: Source, x: number, y: number, z: number)
			setVolume: function(self: Source, volume: number)
			setVolumeLimits: function(self: Source, min: number, max: number)
			stop: function(self: Source)
			tell: function(self: Source, unit: TimeUnit): number
		end

		type FilterSettings = record
			type: FilterType
			volume: number
			highgain: number
			lowgain: number
		end

		getActiveEffects: function(): {string}
		getActiveSourceCount: function(): number
		getDistanceModel: function(): DistanceModel
		getDopplerScale: function(): number
		getMaxSceneEffects: function(): number
		getMaxSourceEffects: function(): number
		getOrientation: function(): number, number
		getPosition: function(): number, number, number
		getRecordingDevices: function(): {RecordingDevice}
		getSourceCount: function(): number
		getVelocity: function(): number, number, number
		getVolume: function(): number
		isEffectsSupported: function(): boolean
		newQueueableSource: function(samplerate: number, bitdepth: number, channels: number, buffercount: number): Source
		newSource: function(filename: string, type: SourceType): Source
		newSource: function(file: filesystem.File, type: SourceType): Source
		newSource: function(decoder: sound.Decoder, type: SourceType): Source
		newSource: function(data: filesystem.FileData, type: SourceType): Source
		newSource: function(data: sound.SoundData): Source
		pause: function(): {Source}
		pause: function(source: Source, ...: Source)
		pause: function(sources: {Source})
		play: function(source: Source)
		play: function(sources: {Source})
		play: function(...: Source)
		setDistanceModel: function(model: DistanceModel)
		setDopplerScale: function(scale: number)
		setEffect: function(name: string, settings: {string:any}): boolean
		setEffect: function(name: string, enabled: boolean): boolean
		setMixWithSystem: function(mix: boolean): boolean
		setOrientation: function(fx: number, fy: number, fz: number, ux: number, uy: number, uz: number)
		setPosition: function(x: number, y: number, z: number)
		setVelocity: function(x: number, y: number, z: number)
		setVolume: function(volume: number)
		stop: function()
		stop: function(source: Source)
		stop: function(...: Source)
		stop: function(sources: {Source})

	end
	type data = record
		type CompressedDataFormat = enum
			"lz4"
			"zlib"
			"gzip"
			"deflate"
		end

		type ContainerType = enum
			"data"
			"string"
		end

		type EncodeFormat = enum
			"base64"
			"hex"
		end

		type HashFunction = enum
			"md5"
			"sha1"
			"sha224"
			"sha256"
			"sha384"
			"sha512"
		end

		type ByteData = record
		end

		type CompressedData = record
			getFormat: function(self: CompressedData): CompressedDataFormat
		end

		compress: function(container: ContainerType, format: CompressedDataFormat, data: string|Data, level: number): string|CompressedData
		decode: function(container: ContainerType, format: EncodeFormat, source: string|love.Data): string|ByteData
		decompress: function(container: ContainerType, compressedData: CompressedData): string|ByteData
		decompress: function(container: ContainerType, format: CompressedDataFormat, compressed: string|ByteData): string|ByteData
		encode: function(container: ContainerType, format: EncodeFormat, source: string|love.Data, linelength: number): string|ByteData
		getPackedSize: function(format: string): number
		hash: function(hashFunction: HashFunction, string: string): string
		hash: function(hashFunction: HashFunction, data: love.Data): string
		newByteData: function(datastring: string): ByteData
		newByteData: function(Data: love.Data, offset: number, size: number): ByteData
		newByteData: function(size: number): ByteData
		newDataView: function(data: love.Data, offset: number, size: number): love.Data
		pack: function(container: ContainerType, format: string, ...: any): string|ByteData
		unpack: function(format: string, data: string|love.Data, pos: number): any...

	end
	type event = record
		clear: function()
		poll: function(): function(): string, any...
		pump: function()
		push: function(n: string, ...: any)
		quit: function(exitstatus: number|string)
		wait: function(): string, any...

	end
	type filesystem = record
		type BufferMode = enum
			"none"
			"line"
			"full"
		end

		type FileDecoder = enum
			"file"
			"base64"
		end

		type FileMode = enum
			"r"
			"w"
			"a"
			"c"
		end

		type FileType = enum
			"file"
			"directory"
			"symlink"
			"other"
		end

		type DroppedFile = record
		end

		type File = record
			close: function(self: File): boolean
			flush: function(self: File): boolean, string
			getBuffer: function(self: File): BufferMode, number
			getFilename: function(self: File): string
			getMode: function(self: File): FileMode
			getSize: function(self: File): number
			isEOF: function(self: File): boolean
			isOpen: function(self: File): boolean
			lines: function(self: File): function(): string
			open: function(self: File, mode: FileMode): boolean, string
			read: function(self: File, bytes: number): string, number
			read: function(self: File, container: data.ContainerType, bytes: number): string|FileData
			seek: function(self: File, pos: number): boolean
			setBuffer: function(self: File, mode: BufferMode, size: number): boolean, string
			tell: function(self: File): number
			write: function(self: File, data: string, size: number): boolean, string
			write: function(self: File, data: love.Data, size: number): boolean, string
		end

		type FileData = record
			getExtension: function(self: FileData): string
			getFilename: function(self: FileData): string
		end

		type FileInfo = record
			type: FileType
			size: number
			modtime: number
		end

		append: function(name: string, data: string, size: number): boolean, string
		append: function(name: string, data: love.Data, size: number): boolean, string
		areSymlinksEnabled: function(): boolean
		createDirectory: function(name: string): boolean
		getAppdataDirectory: function(): string
		getCRequirePath: function(): string
		getDirectoryItems: function(dir: string): {string}
		getDirectoryItems: function(dir: string, callback: function(filename: string)): {string}
		getIdentity: function(): string
		getInfo: function(path: string, filtertype: FileType): FileInfo
		getInfo: function(path: string, info: table): FileInfo
		getInfo: function(path: string, filtertype: FileType, info: table): FileInfo
		getRealDirectory: function(filepath: string): string
		getRequirePath: function(): string
		getSaveDirectory: function(): string
		getSource: function(): string
		getSourceBaseDirectory: function(): string
		getUserDirectory: function(): string
		getWorkingDirectory: function(): string
		init: function(appname: string)
		isFused: function(): boolean
		lines: function(name: string): function(): string
		load: function(name: string): function(...: any): any..., string
		mount: function(archive: string, mountpoint: string, appendToPath: boolean): boolean
		mount: function(filedata: FileData, mountpoint: string, appendToPath: boolean): boolean
		mount: function(data: love.Data, archivename: string, mountpoint: string, appendToPath: boolean): boolean
		newFile: function(filename: string): File
		newFile: function(filename: string, mode: FileMode): File, string
		newFileData: function(contents: string, name: string): FileData
		newFileData: function(filepath: string): FileData, string
		read: function(name: string, size: number): string, number|string
		read: function(container: data.ContainerType, name: string, size: number): string|FileData, number|string
		remove: function(name: string): boolean
		setCRequirePath: function(paths: string)
		setIdentity: function(name: string)
		setIdentity: function(name: string)
		setRequirePath: function(paths: string)
		setSource: function(path: string)
		setSymlinksEnabled: function(enable: boolean)
		unmount: function(archive: string): boolean
		write: function(name: string, data: string, size: number): boolean, string
		write: function(name: string, data: love.Data, size: number): boolean, string

	end
	type font = record
		type HintingMode = enum
			"normal"
			"light"
			"mono"
			"none"
		end

		type GlyphData = record
			getAdvance: function(self: GlyphData): number
			getBearing: function(self: GlyphData): number, number
			getBoundingBox: function(self: GlyphData): number, number, number, number
			getDimensions: function(self: GlyphData): number, number
			getFormat: function(self: GlyphData): image.PixelFormat
			getGlyph: function(self: GlyphData): number
			getGlyphString: function(self: GlyphData): string
			getHeight: function(self: GlyphData): number
			getWidth: function(self: GlyphData): number
		end

		type Rasterizer = record
			getAdvance: function(self: Rasterizer): number
			getAscent: function(self: Rasterizer): number
			getDescent: function(self: Rasterizer): number
			getGlyphCount: function(self: Rasterizer): number
			getGlyphData: function(self: Rasterizer, glyph: string): GlyphData
			getGlyphData: function(self: Rasterizer, glyphNumber: number): GlyphData
			getHeight: function(self: Rasterizer): number
			getLineHeight: function(self: Rasterizer): number
			hasGlyphs: function(self: Rasterizer, ...: number|string): boolean
		end

		newBMFontRasterizer: function(imageData: image.ImageData, glyphs: string, dpiscale: number): Rasterizer
		newBMFontRasterizer: function(fileName: string, glyphs: string, dpiscale: number): Rasterizer
		newGlyphData: function(rasterizer: Rasterizer, glyph: number)
		newImageRasterizer: function(imageData: image.ImageData, glyphs: string, extraSpacing: number, dpiscale: number): Rasterizer
		newRasterizer: function(filename: string): Rasterizer
		newRasterizer: function(data: filesystem.FileData): Rasterizer
		newRasterizer: function(size: number, hinting: HintingMode, dpiscale: number): Rasterizer
		newRasterizer: function(fileName: string, size: number, hinting: HintingMode, dpiscale: number): Rasterizer
		newRasterizer: function(fileData: filesystem.FileData, size: number, hinting: HintingMode, dpiscale: number): Rasterizer
		newRasterizer: function(imageData: image.ImageData, glyphs: string, dpiscale: number): Rasterizer
		newRasterizer: function(fileName: string, glyphs: string, dpiscale: number): Rasterizer
		newTrueTypeRasterizer: function(size: number, hinting: HintingMode, dpiscale: number): Rasterizer
		newTrueTypeRasterizer: function(fileName: string, size: number, hinting: HintingMode, dpiscale: number): Rasterizer
		newTrueTypeRasterizer: function(fileData: filesystem.FileData, size: number, hinting: HintingMode, dpiscale: number): Rasterizer

	end
	type graphics = record
		type AlignMode = enum
			"center"
			"left"
			"right"
			"justify"
		end

		type ArcType = enum
			"pie"
			"open"
			"closed"
		end

		type AreaSpreadDistribution = enum
			"uniform"
			"normal"
			"ellipse"
			"borderellipse"
			"borderrectangle"
			"none"
		end

		type BlendAlphaMode = enum
			"alphamultiply"
			"premultiplied"
		end

		type BlendMode = enum
			"alpha"
			"replace"
			"screen"
			"add"
			"subtract"
			"multiply"
			"lighten"
			"darken"
			"additive"
			"subtractive"
			"multiplicative"
			"premultiplied"
		end

		type CompareMode = enum
			"equal"
			"notequal"
			"less"
			"lequal"
			"gequal"
			"greater"
			"never"
			"always"
		end

		type CullMode = enum
			"back"
			"front"
			"none"
		end

		type DrawMode = enum
			"fill"
			"line"
		end

		type FilterMode = enum
			"linear"
			"nearest"
		end

		type GraphicsFeature = enum
			"clampzero"
			"lighten"
			"multicanvasformats"
			"glsl3"
			"instancing"
			"fullnpot"
			"pixelshaderhighp"
			"shaderderivatives"
		end

		type GraphicsLimit = enum
			"pointsize"
			"texturesize"
			"multicanvas"
			"canvasmsaa"
			"texturelayers"
			"volumetexturesize"
			"cubetexturesize"
			"anisotropy"
		end

		type IndexDataType = enum
			"uint16"
			"uint32"
		end

		type LineJoin = enum
			"miter"
			"none"
			"bevel"
		end

		type LineStyle = enum
			"rough"
			"smooth"
		end

		type MeshDrawMode = enum
			"fan"
			"strip"
			"triangles"
			"points"
		end

		type MipmapMode = enum
			"none"
			"auto"
			"manual"
		end

		type ParticleInsertMode = enum
			"top"
			"bottom"
			"random"
		end

		type SpriteBatchUsage = enum
			"dynamic"
			"static"
			"stream"
		end

		type StackType = enum
			"transform"
			"all"
		end

		type StencilAction = enum
			"replace"
			"increment"
			"decrement"
			"incrementwrap"
			"decrementwrap"
			"invert"
		end

		type TextureType = enum
			"2d"
			"array"
			"cube"
			"volume"
		end

		type VertexAttributeStep = enum
			"pervertex"
			"perinstance"
		end

		type VertexWinding = enum
			"cw"
			"ccw"
		end

		type WrapMode = enum
			"clamp"
			"repeat"
			"mirroredrepeat"
			"clampzero"
		end

		type ImageFlag = enum
			"linear"
			"mipmaps"
		end

		type Canvas = record
			generateMipmaps: function(self: Canvas)
			getMSAA: function(self: Canvas): number
			getMipmapMode: function(self: Canvas): MipmapMode
			newImageData: function(self: Canvas): image.ImageData
			newImageData: function(self: Canvas, slice: number, mipmap: number, x: number, y: number, width: number, height: number): image.ImageData
			renderTo: function(func: function())
		end

		type Drawable = record
		end

		type Font = record
			getAscent: function(self: Font): number
			getBaseline: function(self: Font): number
			getDPIScale: function(self: Font): number
			getDescent: function(self: Font): number
			getFilter: function(self: Font): FilterMode, FilterMode, number
			getHeight: function(self: Font): number
			getLineHeight: function(self: Font): number
			getWidth: function(self: Font, text: string): number
			getWrap: function(self: Font, text: string, wraplimit: number): number, {string}
			hasGlyphs: function(self: Font, text: string): boolean
			hasGlyphs: function(self: Font, character1: string, character2: string): boolean
			hasGlyphs: function(self: Font, codepoint1: number, codepoint2: number): boolean
			setFallbacks: function(self: Font, fallbackfont1: Font, ...: Font)
			setFilter: function(self: Font, min: FilterMode, mag: FilterMode, anisotropy: number)
			setLineHeight: function(self: Font, height: number)
		end

		type Image = record
			getFlags: function(self: Image): {ImageFlag}
			isCompressed: function(self: Image): boolean
			replacePixels: function(self: Image, data: image.ImageData, slice: number, mipmap: number, x: number, y: number, reloadmipmaps: boolean)
		end

		type Mesh = record
			attachAttribute: function(self: Mesh, name: string, mesh: Mesh)
			attachAttribute: function(self: Mesh, name: string, mesh: Mesh, step: VertexAttributeStep, attachname: string)
			attachAttribute: function(self: Mesh, name: string, mesh: Mesh)
			attachAttribute: function(self: Mesh, name: string, mesh: Mesh, step: VertexAttributeStep, attachname: string)
			detachAttribute: function(self: Mesh, name: string): boolean
			getDrawMode: function(self: Mesh): MeshDrawMode
			getDrawRange: function(self: Mesh): number, number
			getTexture: function(self: Mesh): Texture
			getVertex: function(self: Mesh, index: number): number, number...
			getVertex: function(self: Mesh, index: number): number, number, number, number, number, number, number, number
			getVertexAttribute: function(self: Mesh, vertexindex: number, attributeindex: number): number, number, number...
			getVertexCount: function(self: Mesh): number
			getVertexFormat: function(self: Mesh): {{number|string}}
			getVertexMap: function(self: Mesh): {number}
			isAttributeEnabled: function(self: Mesh, name: string): boolean
			setAttributeEnabled: function(self: Mesh, name: string, enable: boolean)
			setDrawMode: function(self: Mesh, mode: MeshDrawMode)
			setDrawRange: function(self: Mesh, start: number, count: number)
			setDrawRange: function(self: Mesh)
			setTexture: function(self: Mesh, texture: Texture)
			setTexture: function(self: Mesh)
			setVertex: function(self: Mesh, index: number, attributecomponent: number, ...: number)
			setVertex: function(self: Mesh, index: number, vertex: {number})
			setVertex: function(self: Mesh, index: number, x: number, y: number, u: number, v: number, r: number, g: number, b: number, a: number)
			setVertex: function(self: Mesh, index: number, vertex: {number})
			setVertexAttribute: function(self: Mesh, vertexindex: number, attributeindex: number, value1: number, value2: number, ...: number)
			setVertexMap: function(self: Mesh, map: {number})
			setVertexMap: function(self: Mesh, ...: number)
			setVertexMap: function(self: Mesh, data: love.Data, datatype: IndexDataType)
			setVertices: function(self: Mesh, vertices: {{number}}, startvertex: number)
			setVertices: function(self: Mesh, data: love.Data, startvertex: number)
		end

		type ParticleSystem = record
			clone: function(self: ParticleSystem): ParticleSystem
			emit: function(self: ParticleSystem, numparticles: number)
			getBufferSize: function(self: ParticleSystem): number
			getColors: function(self: ParticleSystem): number, number, number, number, number, number, number, number, number, number, number, number
			getCount: function(self: ParticleSystem): number
			getDirection: function(self: ParticleSystem): number
			getEmissionArea: function(self: ParticleSystem): AreaSpreadDistribution, number, number, number, boolean
			getEmissionRate: function(self: ParticleSystem): number
			getEmitterLifetime: function(self: ParticleSystem): number
			getInsertMode: function(self: ParticleSystem): ParticleInsertMode
			getLinearAcceleration: function(self: ParticleSystem): number, number, number, number
			getLinearDamping: function(self: ParticleSystem): number, number
			getOffset: function(self: ParticleSystem): number, number
			getParticleLifetime: function(self: ParticleSystem): number, number
			getPosition: function(self: ParticleSystem): number, number
			getQuads: function(self: ParticleSystem): {Quad}
			getRadialAcceleration: function(self: ParticleSystem): number, number
			getRotation: function(self: ParticleSystem): number, number
			getSizeVariation: function(self: ParticleSystem): number
			getSizes: function(self: ParticleSystem): number, number, number
			getSpeed: function(self: ParticleSystem): number, number
			getSpin: function(self: ParticleSystem): number, number, number
			getSpinVariation: function(self: ParticleSystem): number
			getSpread: function(self: ParticleSystem): number
			getTangentialAcceleration: function(self: ParticleSystem): number, number
			getTexture: function(self: ParticleSystem): Texture
			hasRelativeRotation: function(self: ParticleSystem): boolean
			isActive: function(self: ParticleSystem): boolean
			isPaused: function(self: ParticleSystem): boolean
			isStopped: function(self: ParticleSystem): boolean
			moveTo: function(self: ParticleSystem, x: number, y: number)
			pause: function(self: ParticleSystem)
			reset: function(self: ParticleSystem)
			setBufferSize: function(self: ParticleSystem, size: number)
			setColors: function(self: ParticleSystem, r1: number, g1: number, b1: number, a1: number, r2: number, g2: number, b2: number, a2: number, r8: number, g8: number, b8: number, a8: number)
			setDirection: function(self: ParticleSystem, direction: number)
			setEmissionArea: function(self: ParticleSystem, distribution: AreaSpreadDistribution, dx: number, dy: number, angle: number, directionRelativeToCenter: boolean)
			setEmissionRate: function(self: ParticleSystem, rate: number)
			setEmitterLifetime: function(self: ParticleSystem, life: number)
			setInsertMode: function(self: ParticleSystem, mode: ParticleInsertMode)
			setLinearAcceleration: function(self: ParticleSystem, xmin: number, ymin: number, xmax: number, ymax: number)
			setLinearDamping: function(self: ParticleSystem, min: number, max: number)
			setOffset: function(self: ParticleSystem, x: number, y: number)
			setParticleLifetime: function(self: ParticleSystem, min: number, max: number)
			setPosition: function(self: ParticleSystem, x: number, y: number)
			setQuads: function(self: ParticleSystem, ...: Quad)
			setQuads: function(self: ParticleSystem, quads: {Quad})
			setRadialAcceleration: function(self: ParticleSystem, min: number, max: number)
			setRelativeRotation: function(self: ParticleSystem, enable: boolean)
			setRotation: function(self: ParticleSystem, min: number, max: number)
			setSizeVariation: function(self: ParticleSystem, variation: number)
			setSizes: function(self: ParticleSystem, size1: number, size2: number, size8: number)
			setSpeed: function(self: ParticleSystem, min: number, max: number)
			setSpin: function(self: ParticleSystem, min: number, max: number)
			setSpinVariation: function(self: ParticleSystem, variation: number)
			setSpread: function(self: ParticleSystem, spread: number)
			setTangentialAcceleration: function(self: ParticleSystem, min: number, max: number)
			setTexture: function(self: ParticleSystem, texture: Texture)
			start: function(self: ParticleSystem)
			stop: function(self: ParticleSystem)
			update: function(self: ParticleSystem, dt: number)
		end

		type Quad = record
			getTextureDimensions: function(self: Quad): number, number
			getViewport: function(self: Quad): number, number, number, number
			setViewport: function(self: Quad, x: number, y: number, w: number, h: number, sw: number, sh: number)
		end

		type Shader = record
			getWarnings: function(self: Shader): string
			hasUniform: function(self: Shader, name: string): boolean
			send: function(self: Shader, name: string, ...: number)
			send: function(self: Shader, name: string, ...: table)
			send: function(self: Shader, name: string, ...: {{number}})
			send: function(self: Shader, name: string, texture: Texture)
			send: function(self: Shader, name: string, ...: boolean)
			send: function(self: Shader, name: string, matrixLayout: math.MatrixLayout, ...: {{number}})
			send: function(self: Shader, name: string, data: love.Data, offset: number, size: number)
			send: function(self: Shader, name: string, data: love.Data, matrixlayout: math.MatrixLayout, offset: number, size: number)
			sendColor: function(self: Shader, name: string, ...: table)
		end

		type SpriteBatch = record
			add: function(self: SpriteBatch, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			add: function(self: SpriteBatch, quad: Quad, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			addLayer: function(self: SpriteBatch, layerindex: number, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			addLayer: function(self: SpriteBatch, layerindex: number, quad: Quad, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			addLayer: function(self: SpriteBatch, layerindex: number, transform: math.Transform): number
			addLayer: function(self: SpriteBatch, layerindex: number, quad: Quad, transform: math.Transform): number
			attachAttribute: function(self: SpriteBatch, name: string, mesh: Mesh)
			clear: function(self: SpriteBatch)
			flush: function(self: SpriteBatch)
			getBufferSize: function(self: SpriteBatch): number
			getColor: function(self: SpriteBatch): number, number, number, number
			getCount: function(self: SpriteBatch): number
			getTexture: function(self: SpriteBatch): Texture
			set: function(self: SpriteBatch, spriteindex: number, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
			set: function(self: SpriteBatch, spriteindex: number, quad: Quad, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
			setColor: function(self: SpriteBatch, r: number, g: number, b: number, a: number)
			setColor: function(self: SpriteBatch)
			setDrawRange: function(self: SpriteBatch, start: number, count: number)
			setDrawRange: function(self: SpriteBatch)
			setLayer: function(self: SpriteBatch, spriteindex: number, layerindex: number, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
			setLayer: function(self: SpriteBatch, spriteindex: number, layerindex: number, quad: Quad, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
			setLayer: function(self: SpriteBatch, spriteindex: number, layerindex: number, transform: math.Transform)
			setLayer: function(self: SpriteBatch, spriteindex: number, layerindex: number, quad: Quad, transform: math.Transform)
			setTexture: function(self: SpriteBatch, texture: Texture)
		end

		type Text = record
			add: function(self: Text, textstring: string, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			add: function(self: Text, coloredtext: {table|string}, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			addf: function(self: Text, textstring: string, wraplimit: number, align: AlignMode, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			addf: function(self: Text, coloredtext: {table|string}, wraplimit: number, align: AlignMode, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): number
			clear: function(self: Text)
			getDimensions: function(self: Text): number, number
			getDimensions: function(self: Text, index: number): number, number
			getFont: function(self: Text): Font
			getHeight: function(self: Text): number
			getHeight: function(self: Text, index: number): number
			getWidth: function(self: Text): number
			getWidth: function(self: Text, index: number): number
			set: function(self: Text, textstring: string)
			set: function(self: Text, coloredtext: {table|string})
			setFont: function(self: Text, font: Font)
			setf: function(self: Text, textstring: string, wraplimit: number, align: AlignMode)
			setf: function(self: Text, coloredtext: {table|string}, wraplimit: number, alignmode: AlignMode)
		end

		type Texture = record
			getDPIScale: function(self: Texture): number
			getDepth: function(self: Texture): number
			getDepthSampleMode: function(self: Texture): CompareMode
			getDimensions: function(self: Texture): number, number
			getFilter: function(self: Texture): FilterMode, FilterMode, number
			getFormat: function(self: Texture): image.PixelFormat
			getHeight: function(self: Texture): number
			getLayerCount: function(self: Texture): number
			getMipmapCount: function(self: Texture): number
			getMipmapFilter: function(self: Texture): FilterMode, number
			getPixelDimensions: function(self: Texture): number, number
			getPixelHeight: function(self: Texture): number
			getPixelWidth: function(self: Texture): number
			getTextureType: function(self: Texture): TextureType
			getWidth: function(self: Texture): number
			getWrap: function(self: Texture): WrapMode, WrapMode, WrapMode
			isReadable: function(self: Texture): boolean
			setDepthSampleMode: function(self: Texture, compare: CompareMode)
			setFilter: function(self: Texture, min: FilterMode, mag: FilterMode, anisotropy: number)
			setMipmapFilter: function(self: Texture, filtermode: FilterMode, sharpness: number)
			setMipmapFilter: function(self: Texture)
			setWrap: function(self: Texture, horiz: WrapMode, vert: WrapMode, depth: WrapMode)
		end

		type Video = record
			getDimensions: function(self: Video): number, number
			getFilter: function(self: Video): FilterMode, FilterMode, number
			getHeight: function(self: Video): number
			getSource: function(self: Video): audio.Source
			getStream: function(self: Video): video.VideoStream
			getWidth: function(self: Video): number
			isPlaying: function(self: Video): boolean
			pause: function(self: Video)
			play: function(self: Video)
			rewind: function(self: Video)
			seek: function(self: Video, offset: number)
			setFilter: function(self: Video, min: FilterMode, mag: FilterMode, anisotropy: number)
			setSource: function(self: Video, source: audio.Source)
			tell: function(self: Video): number
		end

		type Stats = record
			drawcalls: number
			canvasswitches: number
			texturememory: number
			images: number
			canvases: number
			fonts: number
			shaderswitches: number
			drawcallsbatched: number
		end

		type ImageSetting = record
			mipmaps: boolean
			linear: boolean
			dpiscale: number
		end

		type CanvasSetting = record
			type: TextureType
			format: image.PixelFormat
			readable: boolean
			msaa: number
			dpiscale: number
			mipmaps: MipmapMode
		end

		type VideoSetting = record
			audio: boolean
			dpiscale: number
		end

		applyTransform: function(transform: math.Transform)
		arc: function(drawmode: DrawMode, x: number, y: number, radius: number, angle1: number, angle2: number, segments: number)
		arc: function(drawmode: DrawMode, arctype: ArcType, x: number, y: number, radius: number, angle1: number, angle2: number, segments: number)
		captureScreenshot: function(filename: string)
		captureScreenshot: function(callback: function(image: image.ImageData))
		captureScreenshot: function(channel: love.thread.Channel)
		circle: function(mode: DrawMode, x: number, y: number, radius: number)
		circle: function(mode: DrawMode, x: number, y: number, radius: number, segments: number)
		clear: function()
		clear: function(r: number, g: number, b: number, a: number, clearstencil: boolean, cleardepth: boolean)
		clear: function(...: {number}|boolean)
		clear: function(clearcolor: boolean, clearstencil: boolean, cleardepth: boolean)
		discard: function(discardcolor: boolean, discardstencil: boolean)
		discard: function(discardcolors: {boolean}, discardstencil: boolean)
		draw: function(drawable: Drawable, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		draw: function(texture: Texture, quad: Quad, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		draw: function(drawable: Drawable, transform: math.Transform)
		draw: function(texture: Texture, quad: Quad, transform: math.Transform)
		drawInstanced: function(mesh: Mesh, instancecount: number, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		drawInstanced: function(mesh: Mesh, instancecount: number, transform: math.Transform)
		drawLayer: function(texture: Texture, layerindex: number, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		drawLayer: function(texture: Texture, layerindex: number, quad: Quad, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		drawLayer: function(texture: Texture, layerindex: number, transform: math.Transform)
		drawLayer: function(texture: Texture, layerindex: number, quad: Quad, transform: math.Transform)
		ellipse: function(mode: DrawMode, x: number, y: number, radiusx: number, radiusy: number)
		ellipse: function(mode: DrawMode, x: number, y: number, radiusx: number, radiusy: number, segments: number)
		flushBatch: function()
		getBackgroundColor: function(): number, number, number, number
		getBlendMode: function(): BlendMode, BlendAlphaMode
		getCanvas: function(): Canvas
		getCanvasFormats: function(): {image.PixelFormat:boolean}
		getCanvasFormats: function(readable: boolean): {image.PixelFormat:boolean}
		getColor: function(): number, number, number, number
		getColorMask: function(): boolean, boolean, boolean, boolean
		getDPIScale: function(): number
		getDefaultFilter: function(): FilterMode, FilterMode, number
		getDepthMode: function(): CompareMode, boolean
		getDimensions: function(): number, number
		getFont: function(): Font
		getFrontFaceWinding: function(): VertexWinding
		getHeight: function(): number
		getImageFormats: function(): {image.PixelFormat:boolean}
		getLineJoin: function(): LineJoin
		getLineStyle: function(): LineStyle
		getLineWidth: function(): number
		getMeshCullMode: function(): CullMode
		getPixelHeight: function(): number
		getPixelWidth: function(): number
		getPointSize: function(): number
		getRendererInfo: function(): string, string, string, string
		getScissor: function(): number, number, number, number
		getShader: function(): Shader
		getStackDepth: function(): number
		getStats: function(): Stats
		getStats: function(stats: table): Stats
		getStencilTest: function(): CompareMode, number
		getSupported: function(): {GraphicsFeature:boolean}
		getSystemLimits: function(): {GraphicsLimit:boolean}
		getTextureTypes: function(): {TextureType:boolean}
		getWidth: function(): number
		intersectScissor: function(x: number, y: number, width: number, height: number)
		inverseTransformPoint: function(screenX: number, screenY: number): number, number
		isActive: function(): boolean
		isGammaCorrect: function(): boolean
		isWireframe: function(): boolean
		line: function(...: number)
		line: function(points: {number})
		newArrayImage: function(slices: table, settings: ImageSetting): Image
		newCanvas: function(): Canvas
		newCanvas: function(width: number, height: number): Canvas
		newCanvas: function(width: number, height: number, settings: CanvasSetting): Canvas
		newCanvas: function(width: number, height: number, layers: number, settings: CanvasSetting): Canvas
		newCubeImage: function(filename: string, settings: ImageSetting): Image
		newCubeImage: function(faces: table, settings: ImageSetting): Image
		newFont: function(filename: string): Font
		newFont: function(filename: string, size: number, hinting: font.HintingMode, dpiscale: number): Font
		newFont: function(filename: string, imagefilename: string): Font
		newFont: function(size: number, hinting: font.HintingMode, dpiscale: number): Font
		newImage: function(filename: string): Image
		newImage: function(imageData: image.ImageData): Image
		newImage: function(compressedImageData: image.CompressedImageData): Image
		newImage: function(filename: string, flags: ImageSetting): Image
		newImageFont: function(filename: string, glyphs: string): Font
		newImageFont: function(imageData: image.ImageData, glyphs: string): Font
		newImageFont: function(filename: string, glyphs: string, extraspacing: number): Font
		newMesh: function(vertices: {{number}}, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh
		newMesh: function(vertexcount: number, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh
		newMesh: function(vertexformat: {{number|string}}, vertices: {{number}}, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh
		newMesh: function(vertexformat: {{number|string}}, vertexcount: number, mode: MeshDrawMode, usage: SpriteBatchUsage): Mesh
		newMesh: function(vertexcount: number, texture: Texture, mode: MeshDrawMode): Mesh
		newParticleSystem: function(image: Image, buffer: number): ParticleSystem
		newParticleSystem: function(texture: Texture, buffer: number): ParticleSystem
		newQuad: function(x: number, y: number, width: number, height: number, sw: number, sh: number): Quad
		newShader: function(code: string): Shader
		newShader: function(pixelcode: string, vertexcode: string): Shader
		newSpriteBatch: function(image: Image, maxsprites: number): SpriteBatch
		newSpriteBatch: function(image: Image, maxsprites: number, usage: SpriteBatchUsage): SpriteBatch
		newSpriteBatch: function(texture: Texture, maxsprites: number, usage: SpriteBatchUsage): SpriteBatch
		newText: function(font: Font, textstring: string): Text
		newVideo: function(filename: string): Video
		newVideo: function(videostream: video.VideoStream): Video
		newVideo: function(filename: string, settings: VideoSetting): Video
		newVideo: function(filename: string, loadaudio: boolean): Video
		newVideo: function(videostream: video.VideoStream, loadaudio: boolean): Video
		newVolumeImage: function(layers: table, settings: ImageSetting): Image
		origin: function()
		points: function(x: number, y: number, ...: number)
		points: function(points: {number})
		points: function(points: {{number}})
		polygon: function(mode: DrawMode, ...: number)
		polygon: function(mode: DrawMode, vertices: {number})
		pop: function()
		present: function()
		print: function(text: string, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		print: function(coloredtext: {table|string}, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		print: function(text: string, transform: math.Transform)
		print: function(coloredtext: {table|string}, transform: math.Transform)
		print: function(text: string, font: Font, transform: math.Transform)
		print: function(coloredtext: {table|string}, font: Font, transform: math.Transform)
		print: function(text: string, font: Font, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		printf: function(text: string, x: number, y: number, limit: number, align: AlignMode, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		printf: function(text: string, font: Font, x: number, y: number, limit: number, align: AlignMode, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		printf: function(text: string, transform: math.Transform, limit: number, align: AlignMode)
		printf: function(text: string, font: Font, transform: math.Transform, limit: number, align: AlignMode)
		printf: function(coloredtext: {table|string}, x: number, y: number, limit: number, align: AlignMode, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		printf: function(coloredtext: {table|string}, font: Font, x: number, y: number, limit: number, align: AlignMode, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
		printf: function(coloredtext: {table|string}, transform: math.Transform, limit: number, align: AlignMode)
		printf: function(coloredtext: {table|string}, font: Font, transform: math.Transform, limit: number, align: AlignMode)
		push: function()
		push: function(stack: StackType)
		rectangle: function(mode: DrawMode, x: number, y: number, width: number, height: number)
		rectangle: function(mode: DrawMode, x: number, y: number, width: number, height: number, rx: number, ry: number, segments: number)
		replaceTransform: function(transform: math.Transform)
		reset: function()
		rotate: function(angle: number)
		scale: function(sx: number, sy: number)
		setBackgroundColor: function(red: number, green: number, blue: number, alpha: number)
		setBackgroundColor: function()
		setBackgroundColor: function()
		setBlendMode: function(mode: BlendMode)
		setBlendMode: function(mode: BlendMode, alphamode: BlendAlphaMode)
		setCanvas: function(canvas: Canvas, mipmap: number)
		setCanvas: function()
		setCanvas: function(canvas1: Canvas, canvas2: Canvas, ...: Canvas)
		setCanvas: function(canvas: Canvas, slice: number, mipmap: number)
		setColor: function(red: number, green: number, blue: number, alpha: number)
		setColor: function(rgba: {number})
		setColorMask: function(red: boolean, green: boolean, blue: boolean, alpha: boolean)
		setColorMask: function()
		setDefaultFilter: function(min: FilterMode, mag: FilterMode, anisotropy: number)
		setDepthMode: function(comparemode: CompareMode, write: boolean)
		setDepthMode: function()
		setFont: function(font: Font)
		setFrontFaceWinding: function(winding: VertexWinding)
		setLineJoin: function(join: LineJoin)
		setLineStyle: function(style: LineStyle)
		setLineWidth: function(width: number)
		setMeshCullMode: function(mode: CullMode)
		setNewFont: function(size: number): Font
		setNewFont: function(filename: string, size: number): Font
		setNewFont: function(file: filesystem.File, size: number): Font
		setNewFont: function(data: love.Data, size: number): Font
		setNewFont: function(rasterizer: font.Rasterizer): Font
		setPointSize: function(size: number)
		setScissor: function(x: number, y: number, width: number, height: number)
		setScissor: function()
		setShader: function(shader: Shader)
		setShader: function()
		setStencilTest: function(comparemode: CompareMode, comparevalue: number)
		setStencilTest: function()
		setWireframe: function(enable: boolean)
		shear: function(kx: number, ky: number)
		stencil: function(stencilfunction: function(), action: StencilAction, value: number, keepvalues: boolean)
		transformPoint: function(globalX: number, globalY: number): number, number
		translate: function(dx: number, dy: number)
		validateShader: function(gles: boolean, code: string): boolean, string
		validateShader: function(gles: boolean, pixelcode: string, vertexcode: string): boolean, string

	end
	type image = record
		type CompressedImageFormat = enum
			"DXT1"
			"DXT3"
			"DXT5"
			"BC4"
			"BC4s"
			"BC5"
			"BC5s"
			"BC6h"
			"BC6hs"
			"BC7"
			"ETC1"
			"ETC2rgb"
			"ETC2rgba"
			"ETC2rgba1"
			"EACr"
			"EACrs"
			"EACrg"
			"EACrgs"
			"PVR1rgb2"
			"PVR1rgb4"
			"PVR1rgba2"
			"PVR1rgba4"
			"ASTC4x4"
			"ASTC5x4"
			"ASTC5x5"
			"ASTC6x5"
			"ASTC6x6"
			"ASTC8x5"
			"ASTC8x6"
			"ASTC8x8"
			"ASTC10x5"
			"ASTC10x6"
			"ASTC10x8"
			"ASTC10x10"
			"ASTC12x10"
			"ASTC12x12"
		end

		type ImageFormat = enum
			"tga"
			"png"
			"jpg"
			"bmp"
		end

		type PixelFormat = enum
			"unknown"
			"normal"
			"hdr"
			"r8"
			"rg8"
			"rgba8"
			"srgba8"
			"r16"
			"rg16"
			"rgba16"
			"r16f"
			"rg16f"
			"rgba16f"
			"r32f"
			"rg32f"
			"rgba32f"
			"la8"
			"rgba4"
			"rgb5a1"
			"rgb565"
			"rgb10a2"
			"rg11b10f"
			"stencil8"
			"depth16"
			"depth24"
			"depth32f"
			"depth24stencil8"
			"depth32fstencil8"
			"DXT1"
			"DXT3"
			"DXT5"
			"BC4"
			"BC4s"
			"BC5"
			"BC5s"
			"BC6h"
			"BC6hs"
			"BC7"
			"ETC1"
			"ETC2rgb"
			"ETC2rgba"
			"ETC2rgba1"
			"EACr"
			"EACrs"
			"EACrg"
			"EACrgs"
			"PVR1rgb2"
			"PVR1rgb4"
			"PVR1rgba2"
			"PVR1rgba4"
			"ASTC4x4"
			"ASTC5x4"
			"ASTC5x5"
			"ASTC6x5"
			"ASTC6x6"
			"ASTC8x5"
			"ASTC8x6"
			"ASTC8x8"
			"ASTC10x5"
			"ASTC10x6"
			"ASTC10x8"
			"ASTC10x10"
			"ASTC12x10"
			"ASTC12x12"
		end

		type CompressedImageData = record
			getDimensions: function(self: CompressedImageData): number, number
			getDimensions: function(self: CompressedImageData, level: number): number, number
			getFormat: function(self: CompressedImageData): CompressedImageFormat
			getHeight: function(self: CompressedImageData): number
			getHeight: function(self: CompressedImageData, level: number): number
			getMipmapCount: function(self: CompressedImageData): number
			getWidth: function(self: CompressedImageData): number
			getWidth: function(self: CompressedImageData, level: number): number
		end

		type ImageData = record
			encode: function(self: ImageData, format: ImageFormat, filename: string): filesystem.FileData
			encode: function(self: ImageData, outFile: string)
			encode: function(self: ImageData, outFile: string, format: ImageFormat)
			getDimensions: function(self: ImageData): number, number
			getHeight: function(self: ImageData): number
			getPixel: function(self: ImageData, x: number, y: number): number, number, number, number
			getWidth: function(self: ImageData): number
			mapPixel: function(self: ImageData, pixelFunction: function(x: number, y: number, r: number, g: number, b: number, a: number): (number, number, number, number), x: number, y: number, width: number, height: number)
			paste: function(self: ImageData, source: ImageData, dx: number, dy: number, sx: number, sy: number, sw: number, sh: number)
			setPixel: function(self: ImageData, x: number, y: number, r: number, g: number, b: number, a: number)
		end

		isCompressed: function(filename: string): boolean
		isCompressed: function(fileData: filesystem.FileData): boolean
		newCompressedData: function(filename: string): CompressedImageData
		newCompressedData: function(fileData: filesystem.FileData): CompressedImageData
		newImageData: function(width: number, height: number): ImageData
		newImageData: function(width: number, height: number, format: PixelFormat, data: string): ImageData
		newImageData: function(width: number, height: number, data: string): ImageData
		newImageData: function(filename: string): ImageData
		newImageData: function(filedata: filesystem.FileData): ImageData

	end
	type joystick = record
		type GamepadAxis = enum
			"leftx"
			"lefty"
			"rightx"
			"righty"
			"triggerleft"
			"triggerright"
		end

		type GamepadButton = enum
			"a"
			"b"
			"x"
			"y"
			"back"
			"guide"
			"start"
			"leftstick"
			"rightstick"
			"leftshoulder"
			"rightshoulder"
			"dpup"
			"dpdown"
			"dpleft"
			"dpright"
		end

		type JoystickHat = enum
			"c"
			"d"
			"l"
			"ld"
			"lu"
			"r"
			"rd"
			"ru"
			"u"
		end

		type JoystickInputType = enum
			"axis"
			"button"
			"hat"
		end

		type Joystick = record
			getAxes: function(self: Joystick): number, number, number
			getAxis: function(self: Joystick, axis: number): number
			getAxisCount: function(self: Joystick): number
			getButtonCount: function(self: Joystick): number
			getDeviceInfo: function(self: Joystick): number, number, number
			getGUID: function(self: Joystick): string
			getGamepadAxis: function(self: Joystick, axis: GamepadAxis): number
			getGamepadMapping: function(self: Joystick, axis: GamepadAxis): JoystickInputType, number, JoystickHat
			getGamepadMapping: function(self: Joystick, button: GamepadButton): JoystickInputType, number, JoystickHat
			getGamepadMappingString: function(self: Joystick): string
			getHat: function(self: Joystick, hat: number): JoystickHat
			getHatCount: function(self: Joystick): number
			getID: function(self: Joystick): number, number
			getName: function(self: Joystick): string
			getVibration: function(self: Joystick): number, number
			isConnected: function(self: Joystick): boolean
			isDown: function(self: Joystick, buttonN: number): boolean
			isGamepad: function(self: Joystick): boolean
			isGamepadDown: function(self: Joystick, buttonN: GamepadButton): boolean
			isVibrationSupported: function(self: Joystick): boolean
			setVibration: function(self: Joystick, left: number, right: number): boolean
			setVibration: function(self: Joystick): boolean
			setVibration: function(self: Joystick, left: number, right: number, duration: number): boolean
		end

		getGamepadMappingString: function(guid: string): string
		getJoystickCount: function(): number
		getJoysticks: function(): {Joystick}
		loadGamepadMappings: function(filename: string)
		loadGamepadMappings: function(mappings: string)
		saveGamepadMappings: function(filename: string): string
		saveGamepadMappings: function(): string
		setGamepadMapping: function(guid: string, button: GamepadButton, inputtype: JoystickInputType, inputindex: number, hatdir: JoystickHat): boolean
		setGamepadMapping: function(guid: string, axis: GamepadAxis, inputtype: JoystickInputType, inputindex: number, hatdir: JoystickHat): boolean

	end
	type keyboard = record
		type KeyConstant = enum
			"a"
			"b"
			"c"
			"d"
			"e"
			"f"
			"g"
			"h"
			"i"
			"j"
			"k"
			"l"
			"m"
			"n"
			"o"
			"p"
			"q"
			"r"
			"s"
			"t"
			"u"
			"v"
			"w"
			"x"
			"y"
			"z"
			"0"
			"1"
			"2"
			"3"
			"4"
			"5"
			"6"
			"7"
			"8"
			"9"
			"space"
			"!"
			"\""
			"#"
			"$"
			"&"
			"'"
			"("
			")"
			"*"
			"+"
			","
			"-"
			"."
			"/"
			":"
			";"
			"<"
			"="
			">"
			"?"
			"@"
			"["
			"\\"
			"]"
			"^"
			"_"
			"`"
			"kp0"
			"kp1"
			"kp2"
			"kp3"
			"kp4"
			"kp5"
			"kp6"
			"kp7"
			"kp8"
			"kp9"
			"kp."
			"kp/"
			"kp*"
			"kp-"
			"kp+"
			"kpenter"
			"kp="
			"up"
			"down"
			"right"
			"left"
			"home"
			"end"
			"pageup"
			"pagedown"
			"insert"
			"backspace"
			"tab"
			"clear"
			"return"
			"delete"
			"f1"
			"f2"
			"f3"
			"f4"
			"f5"
			"f6"
			"f7"
			"f8"
			"f9"
			"f10"
			"f11"
			"f12"
			"f13"
			"f14"
			"f15"
			"numlock"
			"capslock"
			"scrollock"
			"rshift"
			"lshift"
			"rctrl"
			"lctrl"
			"ralt"
			"lalt"
			"rmeta"
			"lmeta"
			"lsuper"
			"rsuper"
			"mode"
			"compose"
			"pause"
			"escape"
			"help"
			"print"
			"sysreq"
			"break"
			"menu"
			"power"
			"euro"
			"undo"
			"www"
			"mail"
			"calculator"
			"appsearch"
			"apphome"
			"appback"
			"appforward"
			"apprefresh"
			"appbookmarks"
		end

		type Scancode = enum
			"a"
			"b"
			"c"
			"d"
			"e"
			"f"
			"g"
			"h"
			"i"
			"j"
			"k"
			"l"
			"m"
			"n"
			"o"
			"p"
			"q"
			"r"
			"s"
			"t"
			"u"
			"v"
			"w"
			"x"
			"y"
			"z"
			"1"
			"2"
			"3"
			"4"
			"5"
			"6"
			"7"
			"8"
			"9"
			"0"
			"return"
			"escape"
			"backspace"
			"tab"
			"space"
			"-"
			"="
			"["
			"]"
			"\\"
			"nonus#"
			";"
			"'"
			"`"
			","
			"."
			"/"
			"capslock"
			"f1"
			"f2"
			"f3"
			"f4"
			"f5"
			"f6"
			"f7"
			"f8"
			"f9"
			"f10"
			"f11"
			"f12"
			"f13"
			"f14"
			"f15"
			"f16"
			"f17"
			"f18"
			"f19"
			"f20"
			"f21"
			"f22"
			"f23"
			"f24"
			"lctrl"
			"lshift"
			"lalt"
			"lgui"
			"rctrl"
			"rshift"
			"ralt"
			"rgui"
			"printscreen"
			"scrolllock"
			"pause"
			"insert"
			"home"
			"numlock"
			"pageup"
			"delete"
			"end"
			"pagedown"
			"right"
			"left"
			"down"
			"up"
			"nonusbackslash"
			"application"
			"execute"
			"help"
			"menu"
			"select"
			"stop"
			"again"
			"undo"
			"cut"
			"copy"
			"paste"
			"find"
			"kp/"
			"kp*"
			"kp-"
			"kp+"
			"kp="
			"kpenter"
			"kp1"
			"kp2"
			"kp3"
			"kp4"
			"kp5"
			"kp6"
			"kp7"
			"kp8"
			"kp9"
			"kp0"
			"kp."
			"international1"
			"international2"
			"international3"
			"international4"
			"international5"
			"international6"
			"international7"
			"international8"
			"international9"
			"lang1"
			"lang2"
			"lang3"
			"lang4"
			"lang5"
			"mute"
			"volumeup"
			"volumedown"
			"audionext"
			"audioprev"
			"audiostop"
			"audioplay"
			"audiomute"
			"mediaselect"
			"www"
			"mail"
			"calculator"
			"computer"
			"acsearch"
			"achome"
			"acback"
			"acforward"
			"acstop"
			"acrefresh"
			"acbookmarks"
			"power"
			"brightnessdown"
			"brightnessup"
			"displayswitch"
			"kbdillumtoggle"
			"kbdillumdown"
			"kbdillumup"
			"eject"
			"sleep"
			"alterase"
			"sysreq"
			"cancel"
			"clear"
			"prior"
			"return2"
			"separator"
			"out"
			"oper"
			"clearagain"
			"crsel"
			"exsel"
			"kp00"
			"kp000"
			"thsousandsseparator"
			"decimalseparator"
			"currencyunit"
			"currencysubunit"
			"app1"
			"app2"
			"unknown"
		end

		getKeyFromScancode: function(scancode: Scancode): KeyConstant
		getScancodeFromKey: function(key: KeyConstant): Scancode
		hasKeyRepeat: function(): boolean
		hasTextInput: function(): boolean
		isDown: function(key: KeyConstant): boolean
		isDown: function(key: KeyConstant, ...: KeyConstant): boolean
		isScancodeDown: function(scancode: Scancode, ...: Scancode): boolean
		setKeyRepeat: function(enable: boolean)
		setTextInput: function(enable: boolean)
		setTextInput: function(enable: boolean, x: number, y: number, w: number, h: number)

	end
	type math = record
		type MatrixLayout = enum
			"row"
			"column"
		end

		type BezierCurve = record
			evaluate: function(self: BezierCurve, t: number): number, number
			getControlPoint: function(self: BezierCurve, i: number): number, number
			getControlPointCount: function(self: BezierCurve): number
			getDegree: function(self: BezierCurve): number
			getDerivative: function(self: BezierCurve): BezierCurve
			getSegment: function(self: BezierCurve, startpoint: number, endpoint: number): BezierCurve
			insertControlPoint: function(self: BezierCurve, x: number, y: number, i: number)
			removeControlPoint: function(self: BezierCurve, index: number)
			render: function(self: BezierCurve, depth: number): {number}
			renderSegment: function(self: BezierCurve, startpoint: number, endpoint: number, depth: number): {number}
			rotate: function(self: BezierCurve, angle: number, ox: number, oy: number)
			scale: function(self: BezierCurve, s: number, ox: number, oy: number)
			setControlPoint: function(self: BezierCurve, i: number, x: number, y: number)
			translate: function(self: BezierCurve, dx: number, dy: number)
		end

		type RandomGenerator = record
			getSeed: function(self: RandomGenerator): number, number
			getState: function(self: RandomGenerator): string
			random: function(self: RandomGenerator): number
			random: function(self: RandomGenerator, max: number): number
			random: function(self: RandomGenerator, min: number, max: number): number
			randomNormal: function(self: RandomGenerator, stddev: number, mean: number): number
			setSeed: function(self: RandomGenerator, seed: number)
			setSeed: function(self: RandomGenerator, low: number, high: number)
			setState: function(self: RandomGenerator, state: string)
		end

		type Transform = record
			apply: function(self: Transform, other: Transform): Transform
			clone: function(self: Transform): Transform
			getMatrix: function(self: Transform): number, number, number...
			inverse: function(self: Transform): Transform
			inverseTransformPoint: function(self: Transform, localX: number, localY: number): number, number
			isAffine2DTransform: function(self: Transform): boolean
			reset: function(self: Transform): Transform
			rotate: function(self: Transform, angle: number): Transform
			scale: function(self: Transform, sx: number, sy: number): Transform
			setMatrix: function(self: Transform, ...: number): Transform
			setMatrix: function(self: Transform, layout: MatrixLayout, ...: number): Transform
			setMatrix: function(self: Transform, layout: MatrixLayout, matrix: {number}): Transform
			setMatrix: function(self: Transform, layout: MatrixLayout, matrix: {{number}}): Transform
			setTransformation: function(self: Transform, x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): Transform
			shear: function(self: Transform, kx: number, ky: number): Transform
			transformPoint: function(self: Transform, globalX: number, globalY: number): number, number
			translate: function(self: Transform, dx: number, dy: number): Transform
		end

		colorFromBytes: function(rb: number, gb: number, bb: number, ab: number): number, number, number, number
		colorToBytes: function(r: number, g: number, b: number, a: number): number, number, number, number
		compress: function(rawstring: string, format: data.CompressedDataFormat, level: number): data.CompressedData
		compress: function(data: love.Data, format: data.CompressedDataFormat, level: number): data.CompressedData
		decompress: function(compressedData: data.CompressedData): string
		decompress: function(compressedstring: string, format: data.CompressedDataFormat): string
		decompress: function(data: love.Data, format: data.CompressedDataFormat): string
		gammaToLinear: function(r: number, g: number, b: number): number, number, number
		gammaToLinear: function(color: {number}): number, number, number
		gammaToLinear: function(c: number): number
		getRandomSeed: function(): number, number
		getRandomState: function(): string
		isConvex: function(vertices: {number}): boolean
		isConvex: function(...: number): boolean
		linearToGamma: function(lr: number, lg: number, lb: number): number, number, number
		linearToGamma: function(color: {number}): number, number, number
		linearToGamma: function(lc: number): number
		newBezierCurve: function(vertices: {number}): BezierCurve
		newBezierCurve: function(...: number): BezierCurve
		newRandomGenerator: function(): RandomGenerator
		newRandomGenerator: function(seed: number): RandomGenerator
		newRandomGenerator: function(low: number, high: number): RandomGenerator
		newTransform: function(): Transform
		newTransform: function(x: number, y: number, angle: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number): Transform
		noise: function(x: number): number
		noise: function(x: number, y: number): number
		noise: function(x: number, y: number, z: number): number
		noise: function(x: number, y: number, z: number, w: number): number
		random: function(): number
		random: function(max: number): number
		random: function(min: number, max: number): number
		randomNormal: function(stddev: number, mean: number): number
		setRandomSeed: function(seed: number)
		setRandomSeed: function(low: number, high: number)
		setRandomState: function(state: string)
		triangulate: function(polygon: {number}): {number}
		triangulate: function(...: number): {number}

	end
	type mouse = record
		type CursorType = enum
			"image"
			"arrow"
			"ibeam"
			"wait"
			"waitarrow"
			"crosshair"
			"sizenwse"
			"sizenesw"
			"sizewe"
			"sizens"
			"sizeall"
			"no"
			"hand"
		end

		type Cursor = record
			getType: function(self: Cursor): CursorType
		end

		getCursor: function(): Cursor
		getPosition: function(): number, number
		getRelativeMode: function(): boolean
		getSystemCursor: function(ctype: CursorType): Cursor
		getX: function(): number
		getY: function(): number
		hasCursor: function(): boolean
		isCursorSupported: function(): boolean
		isDown: function(...: number): boolean
		isGrabbed: function(): boolean
		isVisible: function(): boolean
		newCursor: function(imageData: image.ImageData, hotx: number, hoty: number): Cursor
		newCursor: function(filename: string, hotx: number, hoty: number): Cursor
		newCursor: function(fileData: filesystem.FileData, hotx: number, hoty: number): Cursor
		setCursor: function(cursor: Cursor)
		setCursor: function()
		setGrabbed: function(grab: boolean)
		setPosition: function(x: number, y: number)
		setRelativeMode: function(enable: boolean)
		setVisible: function(visible: boolean)
		setX: function(x: number)
		setY: function(y: number)

	end
	type physics = record
		type BodyType = enum
			"static"
			"dynamic"
			"kinematic"
		end

		type JointType = enum
			"distance"
			"friction"
			"gear"
			"mouse"
			"prismatic"
			"pulley"
			"revolute"
			"rope"
			"weld"
		end

		type ShapeType = enum
			"circle"
			"polygon"
			"edge"
			"chain"
		end

		type Body = record
			applyAngularImpulse: function(self: Body, impulse: number)
			applyForce: function(self: Body, fx: number, fy: number)
			applyForce: function(self: Body, fx: number, fy: number, x: number, y: number)
			applyLinearImpulse: function(self: Body, ix: number, iy: number)
			applyLinearImpulse: function(self: Body, ix: number, iy: number, x: number, y: number)
			applyTorque: function(self: Body, torque: number)
			destroy: function(self: Body)
			getAngle: function(self: Body): number
			getAngularDamping: function(self: Body): number
			getAngularVelocity: function(self: Body): number
			getContacts: function(self: Body): {Contact}
			getFixtures: function(self: Body): {Fixture}
			getGravityScale: function(self: Body): number
			getInertia: function(self: Body): number
			getJoints: function(self: Body): {Joint}
			getLinearDamping: function(self: Body): number
			getLinearVelocity: function(self: Body): number, number
			getLinearVelocityFromLocalPoint: function(self: Body, x: number, y: number): number, number
			getLinearVelocityFromWorldPoint: function(self: Body, x: number, y: number): number, number
			getLocalCenter: function(self: Body): number, number
			getLocalPoint: function(self: Body, worldX: number, worldY: number): number, number
			getLocalVector: function(self: Body, worldX: number, worldY: number): number, number
			getMass: function(self: Body): number
			getMassData: function(self: Body): number, number, number, number
			getPosition: function(self: Body): number, number
			getTransform: function(self: Body): number, number, number
			getType: function(self: Body): BodyType
			getUserData: function(self: Body): any
			getWorld: function(self: Body): World
			getWorldCenter: function(self: Body): number, number
			getWorldPoint: function(self: Body, localX: number, localY: number): number, number
			getWorldPoints: function(self: Body, x1: number, y1: number, x2: number, y2: number): number, number, number, number
			getWorldVector: function(self: Body, localX: number, localY: number): number, number
			getX: function(self: Body): number
			getY: function(self: Body): number
			isActive: function(self: Body): boolean
			isAwake: function(self: Body): boolean
			isBullet: function(self: Body): boolean
			isDestroyed: function(self: Body): boolean
			isFixedRotation: function(self: Body): boolean
			isSleepingAllowed: function(self: Body): boolean
			isTouching: function(self: Body, otherbody: Body): boolean
			resetMassData: function(self: Body)
			setActive: function(self: Body, active: boolean)
			setAngle: function(self: Body, angle: number)
			setAngularDamping: function(self: Body, damping: number)
			setAngularVelocity: function(self: Body, w: number)
			setAwake: function(self: Body, awake: boolean)
			setBullet: function(self: Body, status: boolean)
			setFixedRotation: function(self: Body, isFixed: boolean)
			setGravityScale: function(self: Body, scale: number)
			setInertia: function(self: Body, inertia: number)
			setLinearDamping: function(self: Body, ld: number)
			setLinearVelocity: function(self: Body, x: number, y: number)
			setMass: function(self: Body, mass: number)
			setMassData: function(self: Body, x: number, y: number, mass: number, inertia: number)
			setPosition: function(self: Body, x: number, y: number)
			setSleepingAllowed: function(self: Body, allowed: boolean)
			setTransform: function(self: Body, x: number, y: number, angle: number)
			setType: function(self: Body, type: BodyType)
			setUserData: function(self: Body, value: any)
			setX: function(self: Body, x: number)
			setY: function(self: Body, y: number)
		end

		type ChainShape = record
			getChildEdge: function(self: ChainShape, index: number): EdgeShape
			getNextVertex: function(self: ChainShape): number, number
			getPoint: function(self: ChainShape, index: number): number, number
			getPoints: function(self: ChainShape): number, number, number, number
			getPreviousVertex: function(self: ChainShape): number, number
			getVertexCount: function(self: ChainShape): number
			setNextVertex: function(self: ChainShape, x: number, y: number)
			setPreviousVertex: function(self: ChainShape, x: number, y: number)
		end

		type CircleShape = record
			getPoint: function(self: CircleShape): number, number
			getRadius: function(self: CircleShape): number
			setPoint: function(self: CircleShape, x: number, y: number)
			setRadius: function(self: CircleShape, radius: number)
		end

		type Contact = record
			getFixtures: function(self: Contact): Fixture, Fixture
			getFriction: function(self: Contact): number
			getNormal: function(self: Contact): number, number
			getPositions: function(self: Contact): number, number, number, number
			getRestitution: function(self: Contact): number
			isEnabled: function(self: Contact): boolean
			isTouching: function(self: Contact): boolean
			resetFriction: function(self: Contact)
			resetRestitution: function(self: Contact)
			setEnabled: function(self: Contact, enabled: boolean)
			setFriction: function(self: Contact, friction: number)
			setRestitution: function(self: Contact, restitution: number)
		end

		type DistanceJoint = record
			getDampingRatio: function(self: DistanceJoint): number
			getFrequency: function(self: DistanceJoint): number
			getLength: function(self: DistanceJoint): number
			setDampingRatio: function(self: DistanceJoint, ratio: number)
			setFrequency: function(self: DistanceJoint, Hz: number)
			setLength: function(self: DistanceJoint, l: number)
		end

		type EdgeShape = record
			getNextVertex: function(self: EdgeShape): number, number
			getPoints: function(self: EdgeShape): number, number, number, number
			getPreviousVertex: function(self: EdgeShape): number, number
			setNextVertex: function(self: EdgeShape, x: number, y: number)
			setPreviousVertex: function(self: EdgeShape, x: number, y: number)
		end

		type Fixture = record
			destroy: function(self: Fixture)
			getBody: function(self: Fixture): Body
			getBoundingBox: function(self: Fixture, index: number): number, number, number, number
			getCategory: function(self: Fixture): number, number
			getDensity: function(self: Fixture): number
			getFilterData: function(self: Fixture): number, number, number
			getFriction: function(self: Fixture): number
			getGroupIndex: function(self: Fixture): number
			getMask: function(self: Fixture): number, number
			getMassData: function(self: Fixture): number, number, number, number
			getRestitution: function(self: Fixture): number
			getShape: function(self: Fixture): Shape
			getUserData: function(self: Fixture): any
			isDestroyed: function(self: Fixture): boolean
			isSensor: function(self: Fixture): boolean
			rayCast: function(self: Fixture, x1: number, y1: number, x2: number, y2: number, maxFraction: number, childIndex: number): number, number, number
			setCategory: function(self: Fixture, category1: number, category2: number)
			setDensity: function(self: Fixture, density: number)
			setFilterData: function(self: Fixture, categories: number, mask: number, group: number)
			setFriction: function(self: Fixture, friction: number)
			setGroupIndex: function(self: Fixture, group: number)
			setMask: function(self: Fixture, mask1: number, mask2: number)
			setRestitution: function(self: Fixture, restitution: number)
			setSensor: function(self: Fixture, sensor: boolean)
			setUserData: function(self: Fixture, value: any)
			testPoint: function(self: Fixture, x: number, y: number): boolean
		end

		type FrictionJoint = record
			getMaxForce: function(self: FrictionJoint): number
			getMaxTorque: function(self: FrictionJoint): number
			setMaxForce: function(self: FrictionJoint, maxForce: number)
			setMaxTorque: function(self: FrictionJoint, torque: number)
		end

		type GearJoint = record
			getJoints: function(self: GearJoint): Joint, Joint
			getRatio: function(self: GearJoint): number
			setRatio: function(self: GearJoint, ratio: number)
		end

		type Joint = record
			destroy: function(self: Joint)
			getAnchors: function(self: Joint): number, number, number, number
			getBodies: function(self: Joint): Body, Body
			getCollideConnected: function(self: Joint): boolean
			getReactionForce: function(self: Joint, x: number): number, number
			getReactionTorque: function(self: Joint, invdt: number): number
			getType: function(self: Joint): JointType
			getUserData: function(self: Joint): any
			isDestroyed: function(self: Joint): boolean
			setUserData: function(self: Joint, value: any)
		end

		type MotorJoint = record
			getAngularOffset: function(self: MotorJoint): number
			getLinearOffset: function(self: MotorJoint): number, number
			setAngularOffset: function(self: MotorJoint, angleoffset: number)
			setLinearOffset: function(self: MotorJoint, x: number, y: number)
		end

		type MouseJoint = record
			getDampingRatio: function(self: MouseJoint): number
			getFrequency: function(self: MouseJoint): number
			getMaxForce: function(self: MouseJoint): number
			getTarget: function(self: MouseJoint): number, number
			setDampingRatio: function(self: MouseJoint, ratio: number)
			setFrequency: function(self: MouseJoint, freq: number)
			setMaxForce: function(self: MouseJoint, f: number)
			setTarget: function(self: MouseJoint, x: number, y: number)
		end

		type PolygonShape = record
			getPoints: function(self: PolygonShape): number, number, number, number
		end

		type PrismaticJoint = record
			areLimitsEnabled: function(self: PrismaticJoint): boolean
			getAxis: function(self: PrismaticJoint): number, number
			getJointSpeed: function(self: PrismaticJoint): number
			getJointTranslation: function(self: PrismaticJoint): number
			getLimits: function(self: PrismaticJoint): number, number
			getLowerLimit: function(self: PrismaticJoint): number
			getMaxMotorForce: function(self: PrismaticJoint): number
			getMotorForce: function(self: PrismaticJoint, invdt: number): number
			getMotorSpeed: function(self: PrismaticJoint): number
			getUpperLimit: function(self: PrismaticJoint): number
			isMotorEnabled: function(self: PrismaticJoint): boolean
			setLimits: function(self: PrismaticJoint, lower: number, upper: number)
			setLimitsEnabled: function(self: PrismaticJoint): boolean
			setLowerLimit: function(self: PrismaticJoint, lower: number)
			setMaxMotorForce: function(self: PrismaticJoint, f: number)
			setMotorEnabled: function(self: PrismaticJoint, enable: boolean)
			setMotorSpeed: function(self: PrismaticJoint, s: number)
			setUpperLimit: function(self: PrismaticJoint, upper: number)
		end

		type PulleyJoint = record
			getConstant: function(self: PulleyJoint): number
			getGroundAnchors: function(self: PulleyJoint): number, number, number, number
			getLengthA: function(self: PulleyJoint): number
			getLengthB: function(self: PulleyJoint): number
			getMaxLengths: function(self: PulleyJoint): number, number
			getRatio: function(self: PulleyJoint): number
			setConstant: function(self: PulleyJoint, length: number)
			setMaxLengths: function(self: PulleyJoint, max1: number, max2: number)
			setRatio: function(self: PulleyJoint, ratio: number)
		end

		type RevoluteJoint = record
			areLimitsEnabled: function(self: RevoluteJoint): boolean
			getJointAngle: function(self: RevoluteJoint): number
			getJointSpeed: function(self: RevoluteJoint): number
			getLimits: function(self: RevoluteJoint): number, number
			getLowerLimit: function(self: RevoluteJoint): number
			getMaxMotorTorque: function(self: RevoluteJoint): number
			getMotorSpeed: function(self: RevoluteJoint): number
			getMotorTorque: function(self: RevoluteJoint): number
			getUpperLimit: function(self: RevoluteJoint): number
			hasLimitsEnabled: function(self: RevoluteJoint): boolean
			isMotorEnabled: function(self: RevoluteJoint): boolean
			setLimits: function(self: RevoluteJoint, lower: number, upper: number)
			setLimitsEnabled: function(self: RevoluteJoint, enable: boolean)
			setLowerLimit: function(self: RevoluteJoint, lower: number)
			setMaxMotorTorque: function(self: RevoluteJoint, f: number)
			setMotorEnabled: function(self: RevoluteJoint, enable: boolean)
			setMotorSpeed: function(self: RevoluteJoint, s: number)
			setUpperLimit: function(self: RevoluteJoint, upper: number)
		end

		type RopeJoint = record
			getMaxLength: function(self: RopeJoint): number
			setMaxLength: function(self: RopeJoint, maxLength: number)
		end

		type Shape = record
			computeAABB: function(self: Shape, tx: number, ty: number, tr: number, childIndex: number): number, number, number, number
			computeMass: function(self: Shape, density: number): number, number, number, number
			getChildCount: function(self: Shape): number
			getRadius: function(self: Shape): number
			getType: function(self: Shape): ShapeType
			rayCast: function(self: Shape, x1: number, y1: number, x2: number, y2: number, maxFraction: number, tx: number, ty: number, tr: number, childIndex: number): number, number, number
			testPoint: function(self: Shape, tx: number, ty: number, tr: number, x: number, y: number): boolean
		end

		type WeldJoint = record
			getDampingRatio: function(self: WeldJoint): number
			getFrequency: function(self: WeldJoint): number
			setDampingRatio: function(self: WeldJoint, ratio: number)
			setFrequency: function(self: WeldJoint, freq: number)
		end

		type WheelJoint = record
			getAxis: function(self: WheelJoint): number, number
			getJointSpeed: function(self: WheelJoint): number
			getJointTranslation: function(self: WheelJoint): number
			getMaxMotorTorque: function(self: WheelJoint): number
			getMotorSpeed: function(self: WheelJoint): number
			getMotorTorque: function(self: WheelJoint, invdt: number): number
			getSpringDampingRatio: function(self: WheelJoint): number
			getSpringFrequency: function(self: WheelJoint): number
			setMaxMotorTorque: function(self: WheelJoint, maxTorque: number)
			setMotorEnabled: function(self: WheelJoint, enable: boolean)
			setMotorSpeed: function(self: WheelJoint, speed: number)
			setSpringDampingRatio: function(self: WheelJoint, ratio: number)
			setSpringFrequency: function(self: WheelJoint, freq: number)
		end

		type World = record
			destroy: function(self: World)
			getBodies: function(self: World): {Body}
			getBodyCount: function(self: World): number
			getContactCount: function(self: World): number
			getContacts: function(self: World): {Contact}
			getGravity: function(self: World): number, number
			getJointCount: function(self: World): number
			getJoints: function(self: World): {Joint}
			isDestroyed: function(self: World): boolean
			isLocked: function(self: World): boolean
			isSleepingAllowed: function(self: World): boolean
			queryBoundingBox: function(self: World, topLeftX: number, topLeftY: number, bottomRightX: number, bottomRightY: number, callback: function(fixture: Fixture): boolean)
			rayCast: function(self: World, fixture: Fixture, x: number, y: number, xn: number, yn: number, fraction: number): number
			setGravity: function(self: World, x: number, y: number)
			setSleepingAllowed: function(self: World, allow: boolean)
			translateOrigin: function(self: World, x: number, y: number)
			update: function(self: World, dt: number, velocityiterations: number, positioniterations: number)
		end

		getDistance: function(fixture1: Fixture, fixture2: Fixture): number, number, number, number, number
		getMeter: function(): number
		newBody: function(world: World, x: number, y: number, type: BodyType): Body
		newChainShape: function(loop: boolean, ...: number): ChainShape
		newChainShape: function(loop: boolean, points: {number}): ChainShape
		newCircleShape: function(radius: number): CircleShape
		newCircleShape: function(x: number, y: number, radius: number): CircleShape
		newDistanceJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, collideConnected: boolean): DistanceJoint
		newEdgeShape: function(x1: number, y1: number, x2: number, y2: number): EdgeShape
		newFixture: function(body: Body, shape: Shape, density: number): Fixture
		newFrictionJoint: function(body1: Body, body2: Body, x: number, y: number, collideConnected: boolean): FrictionJoint
		newFrictionJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, collideConnected: boolean): FrictionJoint
		newGearJoint: function(joint1: Joint, joint2: Joint, ratio: number, collideConnected: boolean): GearJoint
		newMotorJoint: function(body1: Body, body2: Body, correctionFactor: number): MotorJoint
		newMotorJoint: function(body1: Body, body2: Body, correctionFactor: number, collideConnected: boolean): MotorJoint
		newMouseJoint: function(body: Body, x: number, y: number): MouseJoint
		newPolygonShape: function(...: number): PolygonShape
		newPolygonShape: function(vertices: {number}): PolygonShape
		newPrismaticJoint: function(body1: Body, body2: Body, x: number, y: number, ax: number, ay: number, collideConnected: boolean): PrismaticJoint
		newPrismaticJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, ax: number, ay: number, collideConnected: boolean): PrismaticJoint
		newPrismaticJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, ax: number, ay: number, collideConnected: boolean, referenceAngle: number): PrismaticJoint
		newPulleyJoint: function(body1: Body, body2: Body, gx1: number, gy1: number, gx2: number, gy2: number, x1: number, y1: number, x2: number, y2: number, ratio: number, collideConnected: boolean): PulleyJoint
		newRectangleShape: function(width: number, height: number): PolygonShape
		newRectangleShape: function(x: number, y: number, width: number, height: number, angle: number): PolygonShape
		newRevoluteJoint: function(body1: Body, body2: Body, x: number, y: number, collideConnected: boolean): RevoluteJoint
		newRevoluteJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, collideConnected: boolean, referenceAngle: number): RevoluteJoint
		newRopeJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, maxLength: number, collideConnected: boolean): RopeJoint
		newWeldJoint: function(body1: Body, body2: Body, x: number, y: number, collideConnected: boolean): WeldJoint
		newWeldJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, collideConnected: boolean): WeldJoint
		newWeldJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, collideConnected: boolean, referenceAngle: number): WeldJoint
		newWheelJoint: function(body1: Body, body2: Body, x: number, y: number, ax: number, ay: number, collideConnected: boolean): WheelJoint
		newWheelJoint: function(body1: Body, body2: Body, x1: number, y1: number, x2: number, y2: number, ax: number, ay: number, collideConnected: boolean): WheelJoint
		newWorld: function(xg: number, yg: number, sleep: boolean): World
		setMeter: function(scale: number)

	end
	type sound = record
		type Decoder = record
			clone: function(self: Decoder): Decoder
			getBitDepth: function(self: Decoder): number
			getChannelCount: function(self: Decoder): number
			getDuration: function(self: Decoder): number
			getSampleRate: function(self: Decoder): number
		end

		type SoundData = record
			getBitDepth: function(self: SoundData): number
			getChannelCount: function(self: SoundData): number
			getDuration: function(self: SoundData): number
			getSample: function(self: SoundData, i: number): number
			getSample: function(self: SoundData, i: number, channel: number): number
			getSampleCount: function(self: SoundData): number
			getSampleRate: function(self: SoundData): number
			setSample: function(self: SoundData, i: number, sample: number)
			setSample: function(self: SoundData, i: number, channel: number, sample: number)
		end

		newDecoder: function(file: filesystem.File, buffer: number): Decoder
		newDecoder: function(filename: string, buffer: number): Decoder
		newSoundData: function(filename: string): SoundData
		newSoundData: function(file: filesystem.File): SoundData
		newSoundData: function(decoder: Decoder): SoundData
		newSoundData: function(samples: number, rate: number, bits: number, channels: number): SoundData

	end
	type system = record
		type PowerState = enum
			"unknown"
			"battery"
			"nobattery"
			"charging"
			"charged"
		end

		getClipboardText: function(): string
		getOS: function(): string
		getPowerInfo: function(): PowerState, number, number
		getProcessorCount: function(): number
		hasBackgroundMusic: function(): boolean
		openURL: function(url: string): boolean
		setClipboardText: function(text: string)
		vibrate: function(seconds: number)

	end
	type thread = record
		type Channel = record
			clear: function(self: Channel)
			demand: function(self: Channel, timeout: number): any
			getCount: function(self: Channel): number
			hasRead: function(self: Channel, id: number): boolean
			peek: function(self: Channel): any
			performAtomic: function(self: Channel, func: function(...: any): any..., ...: any): any...
			pop: function(self: Channel): any
			push: function(self: Channel, value: any): number
			supply: function(self: Channel, value: any): boolean
			supply: function(self: Channel, value: any, timeout: number): boolean
		end

		type Thread = record
			getError: function(self: Thread): string
			isRunning: function(self: Thread): boolean
			start: function(self: Thread)
			start: function(self: Thread, arg1: any, arg2: any, ...: any)
			wait: function(self: Thread)
		end

		getChannel: function(name: string): Channel
		newChannel: function(): Channel
		newThread: function(filename: string): Thread
		newThread: function(fileData: filesystem.FileData): Thread
		newThread: function(codestring: string): Thread

	end
	type timer = record
		getAverageDelta: function(): number
		getDelta: function(): number
		getFPS: function(): number
		getTime: function(): number
		sleep: function(s: number)
		step: function(): number

	end
	type touch = record
		getPosition: function(id: any): number, number
		getPressure: function(id: any): number
		getTouches: function(): {any}

	end
	type video = record
		type VideoStream = record
		end

		newVideoStream: function(filename: string): VideoStream
		newVideoStream: function(file: filesystem.File): VideoStream

	end
	type window = record
		type DisplayOrientation = enum
			"unknown"
			"landscape"
			"landscapeflipped"
			"portrait"
			"portraitflipped"
		end

		type FullscreenType = enum
			"desktop"
			"exclusive"
			"normal"
		end

		type MessageBoxType = enum
			"info"
			"warning"
			"error"
		end

		type FullscreenMode = record
			width: number
			height: number
		end

		type WindowSetting = record
			fullscreen: boolean
			fullscreentype: FullscreenType
			vsync: boolean
			msaa: number
			resizable: boolean
			borderless: boolean
			centered: boolean
			display: number
			minwidth: number
			minheight: number
			highdpi: boolean
			refreshrate: number
			x: number
			y: number
			srgb: boolean
		end

		close: function()
		fromPixels: function(pixelvalue: number): number
		fromPixels: function(px: number, py: number): number, number
		getDPIScale: function(): number
		getDisplayName: function(displayindex: number): string
		getDisplayOrientation: function(index: number): DisplayOrientation
		getFullscreen: function(): boolean, FullscreenType
		getFullscreenModes: function(display: number): {FullscreenMode}
		getIcon: function(): image.ImageData
		getMode: function(): number, number, WindowSetting
		getPosition: function(): number, number, number
		getSafeArea: function(): number, number, number, number
		getTitle: function(): string
		getVSync: function(): number
		hasFocus: function(): boolean
		hasMouseFocus: function(): boolean
		isDisplaySleepEnabled: function(): boolean
		isMaximized: function(): boolean
		isMinimized: function(): boolean
		isOpen: function(): boolean
		isVisible: function(): boolean
		maximize: function()
		minimize: function()
		requestAttention: function(continuous: boolean)
		restore: function()
		setDisplaySleepEnabled: function(enable: boolean)
		setFullscreen: function(fullscreen: boolean): boolean
		setFullscreen: function(fullscreen: boolean, fstype: FullscreenType): boolean
		setIcon: function(imagedata: image.ImageData): boolean
		setMode: function(width: number, height: number, flags: WindowSetting): boolean
		setPosition: function(x: number, y: number, display: number)
		setTitle: function(title: string)
		setVSync: function(vsync: number)
		showMessageBox: function(title: string, message: string, type: MessageBoxType, attachtowindow: boolean): boolean
		toPixels: function(value: number): number
		toPixels: function(x: number, y: number): number, number
		updateMode: function(width: number, height: number, settings: WindowSetting): boolean

	end
end

return love
