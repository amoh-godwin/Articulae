# StackView

Stackview is one of the most used

## Basic Use

[text]

`code.txt`

You do not use anchors on children of a stackview

[text]

## Push and Pop

[text]

`code1.txt`

[text]

An item just being declared doesn't make it a part of the stack, it has to be pushed on the stack.

StackView stacks the item one on top of the other, any new item pushed on to the stack will be the topmost item.

Pop will pop the most recently added item off the stack

`code2.txt`

 When you pop you pop the most recently added item off the stack. However you can also pop and item which isn't at the top of the stack. With that, all the items lying on top of the item you want to pop will also get popup off the stack.

Which means you can pop back all the way to an item. The pop method does nto accept a component, so you can use the stackview.index to prevent the item form showing until they have been added to the stack. There is StackView.visible, it is buggy so use StackView.index instead.

`code3.txt`

[text]

## Communicating with items in a stack

One of the most important things you would want to know is how to communicate with  items declared inside an item that has been pushed on to a stack.

Even though you can make reference to items defined inside of a stackview, you can call methods defined in them, and athe methods can call the ids. So with this indirect call you can interact with items defined in a stackview.

`code4.txt`

[text]
