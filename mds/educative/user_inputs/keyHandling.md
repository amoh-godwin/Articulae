# Key Handling

With key handling you can get any key the user presses on the keyboard. But on the keyboards are different types of keys the alphanumerals, the modifiers and the function keys. Lets go on with a basic handling of the keys.

# Basic use

`code.txt`

This just shows you the character code representing the unicode of each keyboard characters. Mostly this is not what you want. You can use `event.text` instead of `event.key` to get the actual text of the key.

# Real world use of the event

In the real world you don't just want one word printed whenever you press a new key, but rather you want the new key to be appended to the one you previously type. This is easy actually. Instead of assigning the key we always append.

`code1.txt`

# Getting access to Function keys

We have access to all the function keys. We might not have access to them as f1 and f2 or del key or volume key but we have it all.

Lets see how to implement a real world deletion, whether the backspace was pressed or the del key was pressed.

`code2.txt`

[text]

# Getting access to the modifiers

Shift key, alt key, ctrl key.

`code3.txt`

[text]
