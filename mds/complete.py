import os


ART_EDUCATIVE = './educative'
COMPLETE = './complete'
EDUCATIVE = "C:/Users/amohgyebi/Documents/GitHub/educative"

# scan contents of art_educative folder
# open each md
# find those that contain code and replace it with the
# contents of code from educative


def scan_art_edu() -> list:
    conts = os.path.listdir(ART_EDUCATIVE)
    return conts


art_edus = scan_art_edu()
