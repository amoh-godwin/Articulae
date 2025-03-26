import os
import re


ART_EDUCATIVE = './educative'
COMPLETE = '.\\complete'
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
    with open(os.path.join(ART_EDUCATIVE, md_path), 'r') as md_file:
        md_conts = md_file.read()
        code_tags = re.findall(r"`code[0-9]?.txt`", md_conts)

    md_path_r = md_path.replace('.md', '')
    com_md_path = '/'.join([COMPLETE, md_path])
    os.makedirs(com_md_path)

    for tag in code_tags:
        # find file in educative
        r_tag = tag.replace("`", "")
        code_path = '/'.join([EDUCATIVE, md_path_r, r_tag])

        with open(code_path, 'r') as code_file:
            code_conts = code_file.read()

        md_conts = md_conts.replace(tag, "`"+code_conts+"`")

        # replace file
        with open(com_md_path, 'w') as t_wri:
            t_wri.write(md_conts)
    return ''


#art_edus = scan_art_edu()
#print(art_edus)
cont = code_tag('win_props/custom_resizing.md')
print(cont)
