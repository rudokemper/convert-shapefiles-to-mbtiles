mkdir -p /tmp/geo
mkdir -p /tmp/line

rm -rf /tmp/geo/*
rm -rf /tmp/line/*

find ./shapefiles | grep ".shp$" | while read filepath; do
  file=$(echo "$filepath" | sed -E 's@.*/([0-9a-zA-Z_-]+)\.[a-z]+@\1@')
  ogr2ogr -f "GeoJSON" /tmp/geo/$file.json $filepath
  jq -rc '.features[]' /tmp/geo/$file.json > /tmp/line/$file.geojson
done

tippecanoe --read-parallel -z 13 -o ./composite.mbtiles $(find /tmp/line -type f | grep .json$)

# Clear directories
rm -rf /tmp/geo/*
rm -rf /tmp/line/*