# camera-scripts
Python scripts to process images and control MAPIR cameras.

# dependencies 
circumventing `exiftools.exe` use...
```bash
conda $(your_env) activate
pip3 install exifread
pip3 install piexif
```
if there's other conda deps I forgot, open an issue.
#TODO: add `requirements.txt` for quick install

# *****works for ubuntu*****
ubuntu 20.04 usage identical to dos : 
```bash
conda $(your_env) activate
cd repos/camera-scripts/Convert_Survey3_RAW_To_Tiff
./Convert_Survey3_RAW_to_Tiff.bash ~/Downloads/dir_with_RAW_JPG_pairs ~/Downloads/same_dir
```
