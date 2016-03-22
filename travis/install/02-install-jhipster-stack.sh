#!/bin/bash
set -ev
#-------------------------------------------------------------------------------
# Maybe speed up the build
#-------------------------------------------------------------------------------
npm set progress=false
#-------------------------------------------------------------------------------
# Install yeoman, bower and gulp
#-------------------------------------------------------------------------------
npm install -g yo
npm install -g bower
npm install -g gulp-cli
#-------------------------------------------------------------------------------
# Install the latest version of JHipster
#-------------------------------------------------------------------------------
cd "$TRAVIS_BUILD_DIR"/
npm install
npm link
npm test
#-------------------------------------------------------------------------------
# Force no insight
#-------------------------------------------------------------------------------
mkdir -p "$HOME"/.config/configstore/
mv "$JHIPSTER_TRAVIS"/configstore/*.json "$HOME"/.config/configstore/
