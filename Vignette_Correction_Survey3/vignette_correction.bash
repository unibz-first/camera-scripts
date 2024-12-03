# vignette_correction.bash
#!/bin/bash
python Vignette_Correction.py "$1" "$2" "$3"
read -n 1 -s -r -p "Press any key to continue"

# ExifUtils.py updates
import exifread
import piexif
from PIL import Image

class ExifUtils:
    @staticmethod
    def copy_simple(inphoto, outphoto):
        # Open image file for reading (binary mode)
        with open(inphoto, 'rb') as f:
            # Return Exif tags
            tags = exifread.process_file(f)
        
        # Convert exifread tags to piexif format
        exif_dict = {"0th": {}, "Exif": {}, "GPS": {}, "1st": {}}
        for tag, value in tags.items():
            if tag != 'JPEGThumbnail':
                try:
                    if "EXIF" in tag:
                        exif_dict["Exif"][piexif.ExifIFD.UserComment] = str(value).encode()
                    else:
                        exif_dict["0th"][piexif.ImageIFD.Software] = str(value).encode()
                except:
                    continue

        exif_bytes = piexif.dump(exif_dict)

        # Apply EXIF to output image
        with Image.open(outphoto) as im:
            im.save(outphoto, exif=exif_bytes)

# Vignette_Correction.py updates
# Add this at top:
if sys.platform == "win32":
    si = subprocess.STARTUPINFO()
    si.dwFlags |= subprocess.STARTF_USESHOWWINDOW
else:
    si = None

# Replace ExifUtils call with:
ExifUtils.copy_simple(inputfilename, outputfilename)
