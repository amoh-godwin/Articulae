# Drawer

A Drawer provides a side-pane that can be dragged into the window.

## Basic use

A Drawer is found in the QtQuick.Controls.Basic package. To use it, just call the Drawer object.

`code.txt`

## Dynamic width

The width of the Drawer can be set dynamically or modified on the fly.

`code1.txt`

## Customization

A drawer can be customised according to the look and feel you want. You probably customize it to remove the border.

`code2.txt`

## Drawer position

The Drawer provides a position property which ranges from 0.0 which is when the drawer is not open to 1.0, which is when the drawer is fully opened.

`code3.txt`

## Interactivity

The ability for a user to drag to open and close a drawer can be disabled. The interactive property does that, when it is set to false will disables the ability to drag to open and close the drawer, to opposite is also true.

`code4.txt`

You can open and close the drawer however by using the methods, open and close.

## Edges

You can choose which side of the window the drawer will open from.

`code5.txt`

The code above pulls the drawer from the top edge, you can also edit the code in the playground to make the drawer open from any of the other edges. Qt.BottomEdge for the bottom edge, Qt.RightEdge and Qt.LeftEdge for the right and left edges respectively.
