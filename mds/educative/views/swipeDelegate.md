# Swipe Delegate

A `SwipeDelegate` provides a delegate with swipe functionality for a `ListView` or any other view that will require it.

## Basic use

A `SwipeDelegate` is found in the `QtQuick.Controls`. It can be used, where you would place a delegate. The code below places a `Rectangle` at the left side of a `ListView` `delegate`. You can swipe from left to right on any of the entries of the `ListView` to see it.

`code.txt`

In the code above, from **lines 19 to 28** the swipe item was placed at the left side of the `ListView` delegates. If you want it to show up on the right side, you should use `swipe.right` instead. But in doing so, do not forget to use `anchors` to bring the item itself to the right side of the delegate.

`code1.txt`

From the code above, you can see that the item which is set to the `swipe.right` property has been anchored to its `parent`, which is the `SwipeDelegate`.

## Responding to a click event

The swipe item can be clicked and provides a `SwipeDelegate.clicked` attached signal. Lets see this in action.

`code2.txt`

For the model’s `remove` function to work as we have in the above code example in **line 38**, you have to be using a data model as the `ListModel` which provides a `remove` method.
