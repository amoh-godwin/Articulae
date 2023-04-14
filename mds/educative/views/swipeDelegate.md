# Swipe Delegate

A SwipeDelegate provides a delegate with swipe functionality for a ListView or any other view that will require it.

## Basic use

A SwipeDelegate is found in the QtQuick.Controls. It is used in place of a delegate. The code below places a Rectangle at the left side of a ListView delegate. You can swipe from left to right or any of the entries of the ListView to see it.

`code.txt`

In the code above, the swipe item was placed at the left side of the ListView delegates. If you want it to show up on the right side, you should use `swipe.right` instead. But in doing so, do not forget to use anchors to bring the item itself to the right side of the delegate.

`code1.txt`

From the code above, you can see that the Item which is set to the swipe.right property has been anchored to its parent, which is the SwipeDelegate.

The swipe item can be clicked and provides a `SwipeDelegate.clicked` attached signal.

`code2.txt`

For the model remove function to work as we have in the above code example, you have to be using a data model as the ListModel which provide a remove method.
