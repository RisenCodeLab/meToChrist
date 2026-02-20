A  = require \assert
Fs = require \fs
P  = require \path

const DIRNAME = BUILD:\build SITE:\site TASK:\task
const DIR = ROOT: P.resolve (cwd = process.cwd!), \..

A.equal (P.basename cwd), DIRNAME.BUILD

DIR.BUILD = cwd
DIR.BUILD_SITE = P.resolve DIR.BUILD, DIRNAME.SITE
DIR.BUILD_TASK = P.resolve DIR.BUILD, DIRNAME.TASK
DIR.SRC = P.resolve DIR.ROOT, \src
DIR.SRC_SITE = P.resolve DIR.SRC, DIRNAME.SITE
DIR.SRC_SITE_ASSET = P.resolve DIR.SRC_SITE, \asset
DIR.SRC_SITE_ASSET_FAVICON = P.resolve DIR.SRC_SITE_ASSET, \favicon
DIR.SRC_SITE_ASSET_TRACT = P.resolve DIR.SRC_SITE_ASSET, \tract
DIR.SRC_SITE_ASSET_TRACT_DECEPTION = P.resolve DIR.SRC_SITE_ASSET_TRACT, \deception
DIR.SRC_SITE_ASSET_TRACT_MINISTRY = P.resolve DIR.SRC_SITE_ASSET_TRACT, \ministry
DIR.SRC_SITE_RESOURCE = P.resolve DIR.SRC_SITE, \resource
DIR.SRC_TASK = P.resolve DIR.SRC, DIRNAME.TASK

module.exports =
  APPNAME: \meToChrist
  DIR    : DIR
  KJVPATH: P.resolve DIR.SRC_SITE_RESOURCE, \verses-1769.json

A Fs.existsSync DIR.BUILD
A Fs.existsSync DIR.SRC
