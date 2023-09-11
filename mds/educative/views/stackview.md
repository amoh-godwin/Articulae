# StackView

Learn one of the most used view types in all of QML.

`Stackview` is one of the most used view types. It provides stack-based navigation for the items, that is the pages are implemented as if they are in a stack. Items are pushed on or popped off the `Stackview`. The item at the top of the stack will be the one that will be shown. If we would like to show an item that is below another item in the stack, we would pop the item on top of it -- off, so the one we want to show will be on top.

## Basic use

A `StackView` is found in the `QtQuick.Controls.Basic` package. You can use it by calling the `StackView` object as can be seen in the code below  from **lines 11 to 15**. The items that will be in the `StackView` are not declared or written directly in it but are rather pushed onto the stack. The `StackView` however allows an initial item to be set, this item will become the first item in the stack.

Lets see this in action in the code playground below, an initialItem has been set in **line 14**.

`code.txt`

`An implementation of a StackView with an initialItem set`

You do not use `anchors` on the item that will be display by the `StackView`, the `StackView` will set its dimension, as you can see from the code above. You can also see that the items have been wrapped in a `Component` type, this way they do not draw. Normally, just declaring a Rectangle will make it to draw, but when it has been wrapped in a `Component` type it will not draw.

## The push and pop methods

The `push` and `pop` methods perform their namesake functions. The `push` method add items to the stack whereas the `pop` method removes items from the stack. They each take an item as a parameter. The `pop` method however can be used without passing an item as a parameter. In the code below you can see that the push method has been  used on line 21. The parameter that was passed to it is the id, second. This means we will be pushing the Component with id second on to the stack.

`code1.txt`

`A StackView with two Components that gets pushed onto the stack`

When you run the code above you can see that the item with `id` as `second` was pushed onto the stack immediately after it started while the item width `id` as `first` was set as the stack's `initialItem`.

An item just being declared doesn't make it a part of the stack, it has to be explicitly pushed on the stack.

`StackView` stacks the items one on top of the other, any new item pushed on to the stack will be the topmost item and that will become the item that will be shown.

Pop will remove the most recently added item from the stack.

`code2.txt`

`A StackView with a Component that gets popped off the stack`

When you use the `pop` method, you remove the most recently added item off the stack which is the one on top. However you can also pop off an item which isn’t at the top of the stack. With this, all the items lying on top of the item you want to pop will also get poped off the stack.

Which means you can pop back all the way to an item. The `pop` method does not accept a component, so we have to do away with our `Component` wrappers. We can use the `StackView.index` to prevent the item or `Rectangle` in this case from showing until they have been added to the stack. There is also `StackView.visible`. It is buggy so prefer `StackView.index` instead. We have used `StackView.index` in **lines 20, 32, 44, and 55** of the code below.

`code3.txt`

`A StackView with four Rectangles that toggle based on their visibility in the stack.`

From the code above, `Rectangle`s which have not been placed in a `Component` have still been prevented from displaying because we have used `StackView.index` on them to control their visibility.

## Communicating with items in a stack

One of the most important things you would want to know is how to communicate with items declared inside another item that has been pushed onto a stack. It is not uncommon for you to want to populate a `ListView` or a `ComboBox` which is deeply nested within an item that has been pushed unto a `StackView`.

Even though you can't make direct reference to items defined inside of a `StackView`, you can call methods defined in them, and the methods can call the `id`s. So with this indirect call you can interact with items defined in a `StackView`.

Let's see this in action

`code4.txt`

`An implementation that updates the color of an inner item`

From the code above, we have a `Timer` that gets triggered after 5 seconds. When its triggered, it calls an `updateColor` method of the item `first`. The `updateColor` method will update the color of a `Rectangle` with `id` `first_child` with a new color. Accessing the id `first_child` outside of `first` is impossible, so the `Timer`'s `triggered` method can not set it directly, but it can call a method of the `first` item.

Knowing that you can communicate with items this way, will make working with the most popular view type really easy.
