import os
import re


ART_EDUCATIVE = '.\\educative'
COMPLETE = '.\\complete'
EDUCATIVE = "C:/Users/amohgyebi/Documents/GitHub/educative"

# scan contents of art_educative folder
# open each md
# find those that contain code and replace it with the
# contents of code from educative


def is_dir(path: str):
    pass


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
    with open(os.path.join(ART_EDUCATIVE, md_path), 'r') as md_file:
        md_conts = md_file.read()
        code_tags = re.findall(r"`code[0-9]?.txt`", md_conts)

    md_path_r = md_path.replace('.md', '')
    com_md_path = os.path.join(COMPLETE, md_path)
    o_md_path, _ = os.path.split(com_md_path)
    if not os.path.exists(o_md_path):
        os.makedirs(o_md_path)

    for tag in code_tags:
        # find file in educative
        r_tag = tag.replace("`", "")
        code_path = '/'.join([EDUCATIVE, md_path_r, r_tag])

        with open(code_path, 'r') as code_file:
            code_conts = code_file.read()
            if 'QtQuick' in code_conts:
                code_mark = "```qml\n"
            else:
                code_mark = "```python\n"

        md_conts = md_conts.replace(tag, code_mark+code_conts+"\n```")

    # replace file
    with open(com_md_path, 'w') as completed_file:
        completed_file.write(md_conts)
    return ''


def folder_handler(path):
    if not is_dir(path):
        code_tag(path)


def complete_code():
    art_edus = scan_art_edu()
    for item in art_edus:
        folder_handler(item)

#art_edus = scan_art_edu()
#print(art_edus)
cont = code_tag('win_props/custom_resizing.md')
print(cont)
