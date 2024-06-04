#!/bin/bash
set -e
if [ ! -f postcodes-nl-geo.7z ]; then
  cp ../bagconv-docker/dist/postcodes-nl-geo.7z .
fi
newTag=$(date '+v%y.%m')
#gh release delete $newTag
gh release create $newTag postcodes-nl-geo.php postcodes-nl-geo.7z postcodes-nl-geo.sh

