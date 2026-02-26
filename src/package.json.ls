name       : \meToChrist
version    : \3.10.0
description: 'meToChrist.com source code'
private    : true
homepage   : \https://github.com/RisenCodeLab/meToChrist
bugs       : \https://github.com/RisenCodeLab/meToChrist/issues
license:   : \MIT
author     : \andrew
repository:
  type: \git
  url : \https://github.com/RisenCodeLab/meToChrist
scripts:
  build: 'bun -e "global.log = console.log; require(\'./task/build\').all()"'
  start: 'bun ./task/supervisor.js'
dependencies:
  chalk      : \~0.4.0
  livescript : \~1.6.0
  pug        : \~3.0.3
# css generation
  postcss               : \~8.4.49
  'postcss-calc'        : \~10.1.0
  'postcss-each'        : \~1.1.0
  'postcss-import-sync2': \~1.2.0
  'postcss-mixins'      : \~11.0.3
  'postcss-nested'      : \~7.0.2
  'postcss-preset-env'  : \~10.1.3
  'postcss-short-color' : \~4.0.0
  'postcss-short-size'  : \~4.0.0
  sugarss               : \~5.0.0
# html generation
  posthtml                     : \~0.16.6
  'posthtml-boolean-attributes': \~0.3.1
  'posthtml-img-autosize'      : \~0.1.6
# svg generation
  'mini-svg-data-uri'          : \~1.4.4
  svgo                         : \~3.3.2
# minification for production
  cssnano : \~7.0.6
  htmlnano: \~2.1.1
  terser  : \~5.37.0
devDependencies:
  eslint                            : \~8.57.1  # ~9.18.0 yields issue #19118
  favicons                          : \~7.2.0
  'html-validate'                   : \~9.1.3
  'ls-lint'                         : \~0.1.2
  stylelint                         : \~16.12.0
  'stylelint-config-standard'       : \~36.0.1
  'stylelint-config-sass-guidelines': \~12.1.0
  ws                                : \~8.18.0
