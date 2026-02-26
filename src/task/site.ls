# see https://developer.mozilla.org/en-US/docs/Learn/Server-side/Node_server_without_framework
Http = require \http
Fs   = require \fs
Path = require \path
Zlib = require \zlib
Dir  = require \./constants .DIR

const MIME_TYPES =
  default: "application/octet-stream"
  html: "text/html; charset=UTF-8"
  ico: "image/x-icon"
  png: "image/png"
  svg: "image/svg+xml"

const PORT=7777

module.exports =
  start: (cb) ->
    s = Http.createServer (req, res) ->>
      file = await prepareFile req.url
      statusCode = if file.found then 200 else 404
      mimeType = MIME_TYPES[file.ext] || MIME_TYPES.default
      acceptEnc = (req.headers['accept-encoding'] || '').toLowerCase!
      if acceptEnc.indexOf 'gzip' isnt -1
        # log 'client accepts gzip — compress on the fly and advertise Vary'
        res.writeHead statusCode, {'Content-Encoding': \gzip, 'Content-Type': mimeType, 'Vary': 'Accept-Encoding'}
        file.stream.pipe(Zlib.createGzip!).pipe res
      else
        # log 'client does not accept gzip — send raw bytes'
        res.writeHead statusCode, {'Content-Type': mimeType}
        file.stream.pipe res
      # log req.method, req.url, statusCode
    s.listen PORT, ->
      log "Http server listening on port #PORT"
      cb!

async function prepare-file url
  paths = [Dir.BUILD_SITE, url]
  if url.endsWith '/' then paths.push \index.html
  filePath = Path.join ...paths
  pathTraversal = !filePath.startsWith Dir.BUILD_SITE
  exists = await Fs.promises.access(filePath).then(-> true, -> false)
  found = !pathTraversal && exists
  streamPath = if found then filePath else Dir.BUILD_SITE + '/404.html'
  ext = Path.extname(streamPath).substring(1).toLowerCase!
  stream = Fs.createReadStream streamPath
  {found, ext, stream}
