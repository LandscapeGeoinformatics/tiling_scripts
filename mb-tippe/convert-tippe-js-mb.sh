#!/bin/bash

# already done needs WGS84
# ogr2ogr -f GeoJSON geojson_out/soil_all.geojson  -t_srs EPSG:4326 PG:"host=localhost user=$DBUSER dbname=$DBNAME password=$DBPASS" "geoworkspace.estsoil_eh_v10"
# ogr2ogr -dim 2 -f GeoJSON -t_srs EPSG:4326 geojson_out/soil_12c_all.geojson /media/gis/estsoil-eh_soilmap/estsoil_12c_refactored.gpkg

# export still in folder, 12.1.2021
ogr2ogr -dim 2 -f GeoJSON -s_srs EPSG:3301 -t_srs EPSG:4326 geojson_out/soil_12c_all.geojson PG:"host=localhost user=$DBUSER dbname=$DBNAME password=$DBPASS" "geoworkspace.estsoil_eh_v12c"

# didn't work, couldn't guess max zoom
# tippecanoe --maximum-zoom=g -o mbtiles/soil_all.mbtiles --drop-densest-as-needed --extend-zooms-if-still-dropping --no-tile-compression geojson_out/*.geojson

# original first export to mearchenland
# tippecanoe --maximum-zoom=12 --minimum-zoom=1 -o mbtiles/soil_all.mbtiles --drop-densest-as-needed --drop-fraction-as-needed --drop-smallest-as-needed --cluster-densest-as-needed --simplify-only-low-zooms --extend-zooms-if-still-dropping --no-tile-compression geojson_out/*.geojson

# export test with no dropping stuff 8-14
tippecanoe --no-feature-limit --drop-densest-as-needed --no-tile-size-limit --simplify-only-low-zooms --extend-zooms-if-still-dropping --minimum-zoom=8 --maximum-zoom=14 --no-tile-compression --output-to-directory  soil_12c_nodrop-8-14 geojson_out/soil_12c_all.geojson

# new estsoil 1.2c with drop stuff from orig
tippecanoe --drop-densest-as-needed  --minimum-zoom=8 --maximum-zoom=16 --drop-fraction-as-needed --drop-smallest-as-needed --cluster-densest-as-needed --simplify-only-low-zooms --extend-zooms-if-still-dropping --no-tile-compression --output-to-directory soil_12c_drop_denser-8-16 geojson_out/soil_12c_all.geojson

