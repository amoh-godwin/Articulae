import os


ART_EDUCATIVE = './educative'
COMPLETE = './complete'
EDUCATIVE = "C:/Users/amohgyebi/Documents/GitHub/educative"

# scan contents of art_educative folder
# open each md
# find those that contain code and replace it with the
# contents of code from educative


def scan_art_edu() -> list:
    conts = os.listdir(ART_EDUCATIVE)
    for a in ('quiz.txt', 'undone.txt'):
        try:
            conts.remove(a)
        except ValueError:
            pass
    return conts


def code_tag(md_path: str) -> str:
    # open md
    # find code tag
    # if code tag find the actual file in educative
    # replace content in educative with code tag
    replaced_content = ""
    return replaced_content


art_edus = scan_art_edu()
print(art_edus)
