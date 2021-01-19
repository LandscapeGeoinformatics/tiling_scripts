#!/bin/bash

# gsutil -m cp -r soil_12c_lxtype1_rgba_8-16 gs://geo-assets/pub-tiles/

# soil_12c_wrbmain_rgba_8-16
# soil_12c_varv_rgba_8-16

gsutil -m cp -r soil_12c_wrbmain_rgba_8-16 soil_12c_varv_rgba_8-16 gs://geo-assets/pub-tiles/
