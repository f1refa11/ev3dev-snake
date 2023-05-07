#!/bin/bash
echo "Starting setup script, the device will beep when the installation is finished..."
python3 setup.py build_ext --inplace
# beep -f 587 -l 150 && beep -f 783 -l 150