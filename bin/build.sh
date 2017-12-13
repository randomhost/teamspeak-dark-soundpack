#!/usr/bin/env bash

DIR_SOUNDPACK='soundpack/'
DIR_DIST='dist/'
ARCHIVE_SOUNDPACK='dark.ts3_soundpack'
ZIP_PATH='/usr/bin/zip'

# Switch to bin dir
DIR="$( pushd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ------------------------------------
#  Cleanup
# ------------------------------------

echo
echo 'Running cleanup tasks'
echo

cd ..
cd ${DIR_DIST}

echo ' - Removing old sound pack archive...'
if [[ -d ${ARCHIVE_SOUNDPACK} ]]; then
    rm ${ARCHIVE_SOUNDPACK}
fi

# ------------------------------------
#  Build Packages
# ------------------------------------

echo
echo 'Building packages'
echo

echo ' - Building sound pack archive...'
cd ..
cd ${DIR_SOUNDPACK}
${ZIP_PATH} ../dist/${ARCHIVE_SOUNDPACK} package.ini gfx
echo

# Return to previous dir
popd
