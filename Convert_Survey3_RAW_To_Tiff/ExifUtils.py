# -*- coding: utf-8 -*-
"""
@author: MAPIR, Inc
"""

import subprocess
import os

# class ExifUtils:

#     @staticmethod
#     def copy_simple(inphoto, outphoto, startup_info):
#         mod_path = os.path.dirname(os.path.realpath(__file__))
#         exifout = subprocess.run(
#             [mod_path + os.sep + r'exiftool.exe',
#             r'-overwrite_original_in_place', r'-tagsFromFile',
#             os.path.abspath(inphoto),
#             r'-all:all<all:all',
#             os.path.abspath(outphoto)], stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin=subprocess.PIPE,
#             startupinfo=startup_info).stderr.decode("utf-8")

#         data = subprocess.run(
#                     args=[mod_path + os.sep + r'exiftool.exe', '-m', r'-ifd0:imagewidth', r'-ifd0:imageheight', os.path.abspath(inphoto)],
#                     stdout=subprocess.PIPE, stderr=subprocess.PIPE,
#                     stdin=subprocess.PIPE, startupinfo=startup_info).stderr.decode("utf-8")
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

        exif_dict = {tag: value.values for tag, value in tags.items() if tag != 'JPEGThumbnail'}
        exif_bytes = piexif.dump(exif_dict)

        with open(outphoto, 'rb') as f:
            im = Image.open(f)
            im.save(outphoto, exif=exif_bytes)