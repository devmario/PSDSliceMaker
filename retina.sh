#!/bin/bash
# Downsamples all retina ...@2x.png images.

echo "Downsampling retina images..."

dir=$(pwd)
find "$dir" -name "*@2x.png" | while read image; do

	outfile=$(basename "$image" @2x.png).png

	width=$(sips -g "pixelWidth" "$image" | awk 'FNR>1 {print $2}')
	height=$(sips -g "pixelHeight" "$image" | awk 'FNR>1 {print $2}')
	sips -z $(($height / 2)) $(($width / 2)) "$image" --out "$outfile"

done

