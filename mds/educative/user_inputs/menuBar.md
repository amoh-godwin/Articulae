# MenuBar

A menuBar draws a bar to hold a set of menu's

## Basic use

A menuBar is found in the QtQuick.Controls.Basic import. You can use it by calling the MenuBar object.

The menu's title will be displayed as buttons on the bar.

`code.txt`

## Reacting to key presses

You can use the ampersand (&) character to denote shortcut character.

This way by pressing Alt+the letter right after the ampersand the corresponding menu will open

`code1.txt`

## Adding menu dynamically

Menu's can added to the MenuBar dynamically using any of addMenu or insertMenu methods. Lets see the addMenu in action.

`code2.txt`

You can practice in the playground how to insert a menu using the insertMenu. insertMenu takes the index as the first parameter and a Menu as the second parameter
