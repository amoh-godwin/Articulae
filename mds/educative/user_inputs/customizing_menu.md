# Customizing Menu

Customizing a menu could be one of the most satisfying things to know. You will almost always desire and appreciate a unique menu. It could be the color scheme, it could be the hover style or even the popup that draws beneath the menu bar.

## Customizing the MenuBar

[text]

`code.txt`



The menuBar itself has a background property. But the menu entries will draw on top of it. The menu entries are handled by a delegate which uses MenuItem, so we should customize the menuItem. The MenuItem has a background and contentItem properties that can be modified.

`code1.txt`

In the above code, you can see that we have modified both the contentItem and the background of the menuItem.



## Customizing the Menu

We can also customize the Menu itself the same way we customize the menuBar. We can customize the background of the Menu, but the entries are drawn as delegates.  MenuItems are used as the delegates. A MenuItem has a background, contentItem, indicator and an arrow to show in if a Menu contains another menu.

`code2.txt`

In the above code, you can see that the width of the Menu has been set to the width of the application window.



We should put the custom menu in a custom type so we can reuse it easily.

`code3.txt`

`code3_custom_menu.txt`

We can modify the arrow if there are submenus.

`code4.txt`

`code4_custom_menu.txt`

[text]
