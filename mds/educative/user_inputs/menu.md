# Menu

A menu provide a set of option referred to as actions or menuitems that can be clicked to perform certain functions.

## Basic use

A menu is found in the QtQuick.Controls.Basic package. You can use it by calling the Menu object.

`code.txt`

The title of the menu is not drawn yet, because the title of the menu is displayed as an entry in a menuBar. We will discuss a menubar is the next lesson.

## Nested Menu

A menu can be nested inside another menu to create a deep menu.

`code1.txt`

We could have used Action instead of menuItem.

`code2.txt`

## Shortcuts in Action

[text]

## Handling Events

You can respond using the trigerred events.

An Action's ontriggered signal includes the object that triggered the action as a source

`code3.txt`
