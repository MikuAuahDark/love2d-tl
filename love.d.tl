-- LÖVE is an *awesome* framework you can use to make 2D games in Lua
-- https://love2d.org/

local love = record
	Config = record
		-- The name of the save directory (string)
		identity: string
		-- Search files in source directory before save directory (boolean)
		appendidentity: boolean
		-- The LÖVE version this game was made for (string)
		version: string
		-- Attach a console (boolean, Windows only)
		console: boolean
		-- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
		accelerometerjoystick: boolean
		-- True to save files (and read from the save directory) in external storage on Android (boolean)
		externalstorage: boolean
		-- Enable gamma-correct rendering, when supported by the system (boolean)
		gammacorrect: boolean

		audio = record
			-- Request and use microphone capabilities in Android (boolean)
			mic: boolean
			-- Keep background music playing when opening LOVE (boolean, iOS and Android only)
			mixwithsystem: boolean
		end

		window = record
			-- The window title (string)
			title: string
			-- Filepath to an image to use as the window's icon (string)
			icon: string
			-- The window width (number)
			width: number
			-- The window height (number)
			height: number
			-- Remove all border visuals from the window (boolean)
			borderless: boolean
			-- Let the window be user-resizable (boolean)
			resizable: boolean
			-- Minimum window width if the window is resizable (number)
			minwidth: number
			-- Minimum window height if the window is resizable (number)
			minheight: number
			-- Enable fullscreen (boolean)
			fullscreen: boolean
			-- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
			fullscreentype: love.window.FullscreenType
			-- Vertical sync mode (number)
			vsync: number
			-- The number of samples to use with multi-sampled antialiasing (number)
			msaa: number
			-- The number of bits per sample in the depth buffer
			depth: number
			-- The number of bits per sample in the stencil buffer
			stencil: number
			-- Index of the monitor to show the window in (number)
			display: number
			-- Enable high-dpi mode for the window on a Retina display (boolean)
			highdpi: boolean
			-- Enable automatic DPI scaling when highdpi is set to true as well (boolean)
			usedpiscale: boolean
			-- The x-coordinate of the window's position in the specified display (number)
			x: number
			-- The y-coordinate of the window's position in the specified display (number)
			y: number
		end

		modules = record
			-- Enable the audio module (boolean)
			audio: boolean
			-- Enable the event module (boolean)
			event: boolean
			-- Enable the font module (boolean)
			font: boolean
			-- Enable the graphics module (boolean)
			graphics: boolean
			-- Enable the image module (boolean)
			image: boolean
			-- Enable the joystick module (boolean)
			joystick: boolean
			-- Enable the keyboard module (boolean)
			keyboard: boolean
			-- Enable the math module (boolean)
			math: boolean
			-- Enable the mouse module (boolean)
			mouse: boolean
			-- Enable the physics module (boolean)
			physics: boolean
			-- Enable the sound module (boolean)
			sound: boolean
			-- Enable the system module (boolean)
			system: boolean
			-- Enable the thread module (boolean)
			thread: boolean
			-- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
			timer: boolean
			-- Enable the touch module (boolean)
			touch: boolean
			-- Enable the video module (boolean)
			video: boolean
			-- Enable the window module (boolean)
			window: boolean
		end
	end

	-- The superclass of all data.
	Data = record
		-- Creates a new copy of the Data object.
		clone: function(self: Data): Data
		-- Gets an FFI pointer to the Data.
		getFFIPointer: function(self: Data): any
		-- Gets a pointer to the Data.
		getPointer: function(self: Data): any
		-- Gets the Data's size in bytes.
		getSize: function(self: Data): number
		-- Gets the full Data as a string.
		getString: function(self: Data): string
	end

	-- The superclass of all LÖVE types.
	Object = record
		-- Immediately destroys the object's Lua reference.
		release: function(self: Object): boolean
		-- Gets the type of the object as a string.
		type: function(self: Object): string
		-- Checks whether an object is of a certain type.
		typeOf: function(self: Object, name: string): boolean
	end

	-- The types supported by love.thread and love.event.
	Variant: boolean | string | number | Object

	---------------
	-- Callbacks --
	---------------

	-- The love.conf function takes one argument:
	-- a table filled with all the default values which you can overwrite to your liking.
	conf: function(t: Config)

	-- Callback function used to draw on the screen every frame.
	draw: function()

	-- Gets the current running version of LÖVE.
	getVersion: function(): number, number, number, string
	hasDeprecationOutput: function(): boolean
	isVersionCompatible: function(version: string): boolean
	isVersionCompatible: function(major: number, minor: number, revision: number): boolean
	-- Sets whether LÖVE displays warnings when using deprecated functionality.
	-- It is disabled by default in fused mode, and enabled by default otherwise.
	setDeprecationOutput: function(enable: boolean)

	-- Variables
	handlers: {string:function(...: any)}

	-- Version
	_version: string
	_version_major: number
	_version_minor: number
	_version_revision: number

	-------------
	-- Modules --
	-------------

	-- Provides of audio interface for playback/recording sound.
	audio = record
		-- The different distance models.
		DistanceModel = enum
			-- Sources do not get attenuated.
			"none"
			-- Inverse distance attenuation.
			"inverse"
			-- Inverse distance attenuation. Gain is clamped. In version 0.9.2 and older this is named inverse clamped.
			"inverseclamped"
			-- Linear attenuation.
			"linear"
			-- Linear attenuation. Gain is clamped. In version 0.9.2 and older this is named linear clamped.
			"linearclamped"
			-- Exponential attenuation.
			"exponent"
			-- Exponential attenuation. Gain is clamped. In version 0.9.2 and older this is named exponent clamped.
			"exponentclamped"
		end

		-- Types of audio sources.
		SourceType = enum
			-- The whole audio is decoded.
			"static"
			-- The audio is decoded in chunks when needed.
			"stream"
			-- The audio must be manually queued by the user.
			"queue"
		end

		-- Units that represent time.
		TimeUnit = enum
			-- Regular seconds.
			"seconds"
			-- Audio samples.
			"samples"
		end

		-- Represents an audio input device capable of recording sounds.
		RecordingDevice = record
			-- Gets the number of bits per sample in the data currently being recorded.
			getBitDepth: function(self: RecordingDevice): number
			-- Gets the number of channels currently being recorded (mono or stereo). 	Added since
			getChannelCount: function(self: RecordingDevice): number
			-- Gets all recorded audio SoundData stored in the device's internal ring buffer.
			getData: function(self: RecordingDevice): sound.SoundData
			-- Gets the name of the recording device.
			getName: function(self: RecordingDevice): string
			-- Gets the number of currently recorded samples.
			getSampleCount: function(self: RecordingDevice): number
			-- Gets the number of samples per second currently being recorded.
			getSampleRate: function(self: RecordingDevice): number
			-- Gets whether the device is currently recording.
			isRecording: function(self: RecordingDevice): boolean
			-- Begins recording audio using this device.
			start: function(self: RecordingDevice, samplecount: number, samplerate: number, bitdepth: number, channels: number): boolean
			-- Stops recording audio from this device.
			stop: function(self: RecordingDevice): sound.SoundData
		end

		-- Source represents audio you can play back.
		Source = record
			-- Creates an identical copy of the Source in the stopped state.
			clone: function(self: Source): Source
			-- Gets a list of the Source's active effect names.
			getActiveEffects: function(self: Source): {string}
			-- Gets the amount of air absorption applied to the Source.
			getAirAbsorption: function(self: Source): number
			-- Gets the duration of the Source.
			getDuration: function(self: Source, unit: TimeUnit): number
			-- Gets the type of the Source.
			getType: function(self: Source): SourceType
			-- Gets the current volume of the Source.
			getVolume: function(self: Source): number
			-- Returns whether the Source will loop.
			isLooping: function(self: Source): boolean
			-- Returns whether the Source is playing.
			isPlaying: function(self: Source): boolean
			-- Pauses a source.
			pause: function(self: Source)
			-- Plays a source.
			play: function(self: Source)
			-- Queues SoundData for playback in a queueable Source.
			queue: function(self: Source, sounddata: sound.SoundData, length: number): boolean
			queue: function(self: Source, sounddata: sound.SoundData, offset: number, length: number): boolean
			-- Sets the currently playing position of the Source.
			seek: function(self: Source, offset: number, unit: TimeUnit)
			-- Sets the amount of air absorption applied to the Source.
			setAirAbsorption: function(self: Source, amount: number)
			-- Sets whether the Source should loop.
			setLooping: function(self: Source, loop: boolean)
			-- Sets the current volume of the Source.
			setVolume: function(self: Source, volume: number)
			-- Stops a source.
			stop: function(self: Source)
			-- Gets the currently playing position of the Source.
			tell: function(self: Source, unit: TimeUnit): number
		end

		-- Gets whether audio effects are supported in the system.
		isEffectsSupported: function(): boolean
		-- Creates a new Source usable for real-time generated sound playback with Source:queue.
		newQueueableSource: function(samplerate: number, bitdepth: number, channels: number, buffercount: number): Source
		-- Creates a new Source from a file, SoundData, or Decoder.
		newSource: function(file: string|filesystem.File, type: SourceType): Source
		newSource: function(file: filesystem.FileData, type: SourceType): Source
		newSource: function(data: sound.SoundData): Source
	end

	-- Provides functionality for creating and transforming data.
	data = record
		-- Compressed data formats.
		CompressedDataFormat = enum
			-- The LZ4 compression format.
			-- Compresses and decompresses very quickly, but the compression ratio is not the best.
			-- LZ4-HC is used when compression level 9 is specified.
			"lz4"
			-- The zlib format is DEFLATE-compressed data with a small bit of header data.
			-- Compresses relatively slowly and decompresses moderately quickly, and has a decent compression ratio.
			"zlib"
			-- The gzip format is DEFLATE-compressed data with a slightly larger header than zlib.
			-- Since it uses DEFLATE it has the same compression characteristics as the zlib format.
			"gzip"
			-- Raw DEFLATE-compressed data (no header).
			"deflate"
		end

		-- Return type of various data-returning functions.
		ContainerType = enum
			-- Return type is Data
			"data"
			-- Return type is string
			"string"
		end

		-- Encoding format used to encode or decode data.
		EncodeFormat = enum
			-- Encode/decode data as base64 binary-to-text encoding.
			"base64"
			-- Encode/decode data as hexadecimal string.
			"hex"
		end

		-- Hash algorithm of love.data.hash.
		HashFunction = enum
			-- MD5 hash algorithm (16 bytes).
			"md5"
			-- SHA1 hash algorithm (20 bytes).
			"sha1"
			-- SHA2 hash algorithm with message digest size of 224 bits (28 bytes).
			"sha224"
			-- SHA2 hash algorithm with message digest size of 256 bits (32 bytes).
			"sha256"
			-- SHA2 hash algorithm with message digest size of 384 bits (48 bytes).
			"sha384"
			-- SHA2 hash algorithm with message digest size of 512 bits (64 bytes).
			"sha512"
		end

		-- Byte data compressed using a specific algorithm.
		CompressedData = record
			-- Gets the compression format of the CompressedData.
			getFormat: function(self: CompressedData): CompressedDataFormat
		end

		-- Compresses a string or data using a specific compression algorithm.
		compress: function(container: ContainerType, format: CompressedDataFormat, data: Data|string, level: number): CompressedData|string
		-- Decode Data or a string from any of the EncodeFormats to Data or string.
		decode: function(container: ContainerType, format: EncodeFormat, source: Data|string): Data|string
		-- Decompresses a CompressedData or previously compressed string or Data object.
		decompress: function(container: ContainerType, data: CompressedData): Data|string
		decompress: function(container: ContainerType, format: CompressedDataFormat, data: Data|string): Data|string
		-- Encode Data or a string to a Data or string in one of the EncodeFormats.
		encode: function(container: ContainerType, format: EncodeFormat, source: Data|string, linelength: number): Data|string
		-- Gets the size in bytes that a given format used with love.data.pack will use.
		getPackedSize: function(format: string): number
		-- Compute the message digest of a string using a specified hash algorithm.
		hash: function(func: HashFunction, data: Data|string): string
		-- Creates a new ByteData by copying the contents of the specified string.
		newByteData: function(datastring: string): Data
		-- Creates a new ByteData by copying from an existing Data object.
		newByteData: function(data: Data, offset: number, size: number): Data
		-- Creates a new empty ByteData with the specific size.
		newByteData: function(size: number): Data
		-- Creates a new Data referencing a subsection of an existing Data object.
		newDataView: function(data: Data, offset: number, size: number): Data
		-- Packs (serializes) simple Lua values.
		pack: function(container: ContainerType, format: string, ...: any): Data|string
		-- Unpacks (deserializes) a byte-string or Data into simple Lua values.
		unpack: function(format: string, data: Data|string, pos: number): any...
	end

	-- Provides an interface to the user's filesystem.
	filesystem = record
		-- Represents a file on the filesystem.
		File = record
		end

		-- Data representing the contents of a file.
		FileData = record
		end
	end

	-- Responsible of drawing of lines, shapes, text, Images and other Drawable objects onto the screen.
	graphics = record
		-- Draws text on screen.
		print: function(text: string, x: number, y: number, r: number, sx: number, sy: number, ox: number, oy: number, kx: number, ky: number)
	end

	-- This module is responsible for decoding sound files.
	sound = record
		-- An object which can gradually decode a sound file.
		Decoder = record
			-- Create new copy of existing decoder.
			clone: function(self: Decoder): Decoder
			-- Decodes a chunk of audio data to a SoundData.
			decode: function(self: Decoder): SoundData
			-- Returns the number of bits per sample.
			getBitDepth: function(self: Decoder): number
			-- Returns the number of channels in the stream.
			getChannelCount: function(self: Decoder): number
			-- Gets the duration of the sound file.
			getDuration: function(self: Decoder): number
			-- Returns the sample rate of the Decoder.
			getSampleRate: function(self: Decoder): number
			-- Sets the currently playing position of the Decoder.
			seek: function(self: Decoder, offset: number)
		end

		-- Contains raw audio samples.
		SoundData = record
			-- Returns the number of bits per sample.
			getBitDepth: function(self: SoundData): number
			-- Returns the number of channels in the SoundData.
			getChannelCount: function(self: SoundData): number
			-- Gets the duration of the sound data.
			getDuration: function(self: SoundData): number
			-- Gets the value of the samplepoint at the specified position.
			getSample: function(self: SoundData, i: number): number
			-- Gets the value of a sample using an explicit sample index instead of
			-- interleaving them in the sample position parameter.
			getSample: function(self: SoundData, i: number, channel: number): number
			-- Returns the sample count of the SoundData.
			getSampleCount: function(self: SoundData): number
			-- Returns the sample rate of the SoundData.
			getSampleRate: function(self: SoundData): number
			-- Sets the sample at the specified position.
			setSample: function(self: SoundData, i: number, sample: number)
			-- Sets the value of a sample using an explicit sample index instead of
			-- interleaving them in the sample position parameter.
			setSample: function(self: SoundData, i: number, channel: number, sample: number)
		end
	end

	window = record
		FullscreenType = enum
			-- Sometimes known as borderless fullscreen windowed mode.
			-- A borderless screen-sized window is created which sits on top of all desktop UI elements.
			-- The window is automatically resized to match the dimensions of the desktop, and its size cannot be changed.
			"desktop"
			-- Standard exclusive-fullscreen mode. Changes the display mode (actual resolution) of the monitor.
			"exclusive"
		end
	end
end

return love
