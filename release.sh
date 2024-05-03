#!/bin/bash
set -e
if [ ! -f postcodes-nl-geo.7z ]; then
  if [ -f ../bagconv/dist/postcodes-nl-geo.7z ]; then
    cp ../bagconv/dist/postcodes-nl-geo.7z .
  else
    if [ ! -f pcodes-geo.zip ]; then
      wget berthub.eu/bagconv/pcodes-geo.zip 
    fi
    zcat pcodes-geo.zip | php minimize.php | 7z a postcodes-nl-geo.7z -sipostcodes-nl-geo.csv
    #rm pcodes-geo.zip
  fi
fi
newTag=$(date '+v%y.%m')
#gh release delete $newTag
gh release create $newTag postcodes-nl-geo.php postcodes-nl-geo.7z postcodes-nl-geo.sh

