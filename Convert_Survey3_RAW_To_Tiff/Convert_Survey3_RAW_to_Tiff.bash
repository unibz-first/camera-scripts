#!/bin/bash
# source ~/anaconda3/bin/activate # just run it with your conda env active...
# bash conda activate endvi
# python Convert_Survey3_RAW_to_Tiff.py "$(dirname "$0")/inFolder" "$(dirname "$0")/outFolder"
python Convert_Survey3_RAW_to_Tiff.py "$1" "$2"
read -n 1 -s -r -p "Press any key to continue"