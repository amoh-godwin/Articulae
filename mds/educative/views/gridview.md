# GridView

A `GridView` places items in a grid. It uses a `model` the same way a `ListView` does. The only difference is a `ListView` places items in a list whereas a `GridView` places items in a grid.

## Basic Use

A `GridView` is found in the `QtQuick` package. It uses a `model` like a `ListView`, but it needs `cellWidth` and `cellHeight` set.

`code.txt`

From the above code, you can see that the `delegate`'s `width` and `height` are set to the `cellWidth` and `cellHeight`. If you set it anything else, you might get undesirable effects.

`GridView` also doesn't have a spacing property, so you have to make up for that. You can use the direct child of the delegate as the parent container for whatever you want to place in the delegate.

## Highlight

Using the `currentItem` property we can show which item is the current item.

[text]

`code1.txt`

We are yet to respond to mouse event, so for now we navigate to an item in the grid using the keyboard navigation controls

You can also use the highlight property to set a highlight item

`code2.txt`

[text]

## Direction and Flow

Using layoutDirect: Qt.RightToLeft, the items have now been laid out from right first then left.

`code4.txt`

[text]

Using flowTopToBottom - the items now scroll horizontally.

`code3.txt`

[text]

## Dynamic sizing

Creating a view with cells of different or proportional sizes is complex and beyound the scope of this lesson. In certain cases, you can use a GridLayout to achieve that effect. So a GridView should only be used for cells of the same size.
