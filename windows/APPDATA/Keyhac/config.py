import string

from keyhac import *

def configure(keymap):
    keymap.replaceKey("LWin", 124) # F13
    keymap.defineModifier(124, "User0")


    keymap_global = keymap.defineWindowKeymap()

    keymap_global["User0-Space"] = "LWin"
    keymap_global["User0-v"] = "Win-v"

    keymap_global["F7"] = "(177)" # VK_MEDIA_PREV_TRACK
    keymap_global["F8"] = "(179)" # VK_MEDIA_PLAY_PAUSE
    keymap_global["F9"] = "(176)" # VK_MEDIA_NEXT_TRACK
    keymap_global["F10"] = "(173)" # VK_VOLUME_MUTE
    keymap_global["F11"] = "(174)" # VK_VOLUME_DOWN
    keymap_global["F12"] = "(175)" # VK_VOLUME_UP

    # Monosnap
    keymap_global["LAlt-User0-5"] = "Ctrl-Alt-5"


    keymap_mintty = keymap.defineWindowKeymap(exe_name="mintty.exe")

    keymap_mintty["LAlt-c"] = "Ctrl-Insert"
    keymap_mintty["LAlt-v"] = "Shift-Insert"
    keymap_mintty["LAlt-Minus"] = "Ctrl-Minus"
    keymap_mintty["LAlt-Plus"] = "Ctrl-Plus"


    def remapable(window):
        if window.getProcessName() in ["mintty.exe", "ubuntu2004.exe"]:
            return False
        return True

    keymap_general = keymap.defineWindowKeymap(check_func=remapable)

    # Readline
    ignore = "(131)" # F20

    keymap_general["LCtrl-a"] = "Home"
    keymap_general["LCtrl-b"] = "Left"
    keymap_general["LCtrl-c"] = ignore
    keymap_general["LCtrl-d"] = "Delete"
    keymap_general["LCtrl-e"] = "End"
    keymap_general["LCtrl-f"] = "Right"
    keymap_general["LCtrl-g"] = ignore
    keymap_general["LCtrl-h"] = "Back"
    keymap_general["LCtrl-i"] = ignore
    keymap_general["LCtrl-j"] = ignore
    keymap_general["LCtrl-k"] = "Shift-End", "Ctrl-c", "Delete"
    keymap_general["LCtrl-l"] = ignore
    keymap_general["LCtrl-m"] = ignore
    keymap_general["LCtrl-n"] = "Down"
    keymap_general["LCtrl-o"] = ignore
    keymap_general["LCtrl-p"] = "Up"
    keymap_general["LCtrl-q"] = ignore
    keymap_general["LCtrl-r"] = ignore
    keymap_general["LCtrl-s"] = ignore
    keymap_general["LCtrl-t"] = ignore
    keymap_general["LCtrl-u"] = ignore
    keymap_general["LCtrl-v"] = ignore
    keymap_general["LCtrl-w"] = ignore
    keymap_general["LCtrl-x"] = ignore
    keymap_general["LCtrl-y"] = "Ctrl-v"
    keymap_general["LCtrl-z"] = ignore

    # Ctrl binding
    for key in (string.ascii_lowercase + string.digits).translate(str.maketrans('', '', 'qv')):
        keymap_general[f"LAlt-{key}"] = f"Ctrl-{key}"
        keymap_general[f"LShift-LAlt-{key}"] = f"Shift-Ctrl-{key}"

    keymap_general["LAlt-q"] = "Alt-F4"
    keymap_general["LAlt-v"] = "Ctrl-v"
    keymap_general["LShift-LAlt-w"] = "Shift-Ctrl-w"

    # Chromium
    keymap_general["LAlt-Minus"] = "Ctrl-Minus"
    keymap_general["LAlt-Plus"] = "Ctrl-Plus"

    keymap_general["LAlt-User0-Right"] = "Ctrl-Tab"
    keymap_general["LAlt-User0-Left"] = "Shift-Ctrl-Tab"
