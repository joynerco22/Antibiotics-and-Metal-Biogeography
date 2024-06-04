#!/bin/bash


## list the names of the project IDs to be downloaded


## run API server and download to ~/MG-RAST_RAW_DATA directory 

## sanity check to make sure the first command line argument is correct 
echo "$1"
## initiate while loop, which takes the ID of a library from the MG-RAST database that you provide for it in a text file. This script is compatible with all of the IDs listed in the various environmental ID files in the "Data" folder.
while IFS= read -r id || [ -n "$id" ]; do
id=$(echo "$id" | tr -d '\r')
if [ -n "$id" ]; then
mg-download.py --project "$id" --dir ~/MG-RAST_RAW_DATA
fi

done < "$1"
