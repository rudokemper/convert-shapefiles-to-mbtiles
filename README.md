# convert-shapefiles-to-mbtiles

A quick bash script to convert a directory of shapefiles into one composite mbtiles file.

The script converts your shapefiles to GeoJSON and then compiles them into one (vector)
 mbtiles.
## Run

Place your shapefiles in `shapefiles/` dir.

Run:

```
./convert.sh
```

## Requirements

Install:

* jq
* ogr2ogr
* tippecanoe
