local Settings = {}


Settings.DEFAULT = {
    pixel_size = 5.0,
    feed = 1000,
    smax = 1000,
    threshold = 128,
    invert = false,
    offx = 0.0,
    offy = 0.0,
    weight = 130.0,
    height = 130.0,
    path = "result.gcode"
}

function Settings.default(raw)
    local settings = {}
    
    settings.pixel_size  = tonumber(raw.pixel_size) or Settings.DEFAULT.pixel_size
    settings.feed        = math.floor(tonumber(raw.feed)) or Settings.DEFAULT.feed
    settings.smax        = math.floor(tonumber(raw.smax) or Settings.DEFAULTS.smax)
    settings.threshold   = math.floor(tonumber(raw.threshold) or Settings.DEFAULTS.threshold)
    settings.invert      = raw.invert and true or false
    settings.offx        = tonumber(raw.offx) or Settings.DEFAULTS.offx
    settings.offy        = tonumber(raw.offy) or Settings.DEFAULTS.offy
    settings.weight      = tonumber(raw.weight) or Settings.DEFAULTS.weight
    settings.height      = tonumber(raw.height) or Settings.DEFAULTS.height
    settings.path        = raw.path or Settings.DEFAULTS.path
    settings.flipY       = true

    -- check settings values
    if (settings.threshold < 0 or settings.threshold > 255) then error("Threshold must be >= 0 and <= 255") end
    if settings.pixel_size <= 0 then error("Pixel size must be > 0") end
    if settings.feed <= 0 then error("Feed must be > 0") end
    if settings.smax < 0 then error("Smax must be >= 0") end

    return settings
end

