# GridView

A GridView places items in a grid base a model.

## Basic Use

A GridView is found in the QtQuick page. It uses a model like a ListView, but it needs cellWidth and cellHeight set.

`code.txt`

From the above code, you can see that the delegate's width and height are set to the cellWidth and cellHeight. If you set it anything else, you might get undesirable effects.

Gridview also doesn't have a spacing property, so you have to make up for that. You can use the direct child of the delegate as the parent container for whatever you want to place in the delegate. 

## Drag'n'Drop

Gridview supports drag and drop.

## Dynamic sizing

Creating a view with cells of different or proportional sizes is complex and beyound the scope of this lesson. In certain cases, you can use a GridLayout to achieve that effect. So a GridView should be used for cells of the same size.
