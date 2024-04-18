#!/bin/bash
set -e
if [ ! -f postcodes-nl-geo.7z ]; then
  if [ ! -f pcodes-geo.zip ]; then
    wget berthub.eu/bagconv/pcodes-geo.zip 
  fi
  zcat pcodes-geo.zip | php minimize.php | 7z a postcodes-nl-geo.7z -sipostcodes-nl-geo.csv
fi
newTag=$(date '+v%y.%m')
#gh release delete $newTag
gh release create $newTag postcodes-nl-geo.php postcodes-nl-geo.7z postcodes-nl-geo.sh
rm pcodes-geo.zip