# Text Input

A `TextInput` is an editable one-liner of text. It is used to get text data from the user.

## Basic use

It is found in the `QtQuick.Controls.Basic` package. It can be declared without any parameters at all, but its `text` property holds the actual text of the `TextInput`.

`code.txt`

The `TextInput` has a transparent background. So you can see from the code above, that we have put the item in a `Rectangle` to sort of draw a background for it.

The `text` property contains the actual text the user put in. You can also set it, like we did in the code above.

If you want the text to scroll to where the user is whiles he is typing, you should set the `width` of the `TextInput`.

In the code below, the `TextInput` has its `clip` property set to `True`, because whiles scrolling the text does move beyond the boundaries, so we prevent this with clipping.

    `code1.txt`

# Font properties

The `font` properties can be set to better serve your customization needs. The `font` properties are set like the `font` properties of the `Text` object.

`code2.txt`

## Inputting passwords

The `TextInput` can be set to receive sensitive text also. This way the text that will be displayed will not be the actual text the user typed but will be masked characters, to hide the sensitive text. We use the `echoMode` property to choose how text is displayed. Lets see how this is done.

`code3.txt`

In the code above in **line 33**, we have set the `echoMode` to `TextInput.Password`. This way the text that the user inputs is treated as a password and then mask characters are shown instead. The actual text the user inputted is still in the `text` property, but that wasn’t displayed. The default `echoMode` is `TextInput.Normal` which display what you have in the `text` property, and then there is `TextInput.NoEcho` which displays nothing to the user.

## Selecting text

Normally you can select text in a `TextInput` by using shift and the arrow keys. But you can also activate a selection by mouse by setting the `selectByMouse` property to `true` (see line 34 of the code below). You can even control the color of the selected text and its background (See line 35 and 36 of the code below).

`code4.txt`

To get the selected text, use the `selectedText` property. It contains only the text that the use has selected. In the code below in line 50, we use the selectedText property to print the text to the output when the print button is clicked.

* `code5.txt`
- Modifying the cursor - The blinking cursor’s rectangle can also be modified. In the code below from lines 33 to 37 we have done this by modifying the cursorDelegate.

`code6.txt`

## Customization

We can create customization so that when the user clicks in the `TextInput` to start editing we change out styling. The `cursorVisible` shows when the cursor is visible and is blinking, this is when the user has clicked inside the `TextInput` to begin editing the `text` property. Lets see how this can be achieved in the code below.

`code7.txt`

In the code above, in **lines 38 and 39**, we have used the `cursorVisible` property to change the `color` and `height` or the `Rectangle` we are using as a border. This way the border brightens up when the user clicks to edit the text.

## Restricted input

We can restrict what kind of input a user can input into the `TextInput`. With this we use a `Validator` and set it to the `validator` property. In the code below in line 38 we have modified the validator property so the user must first type in the “+” character or two zeros, before continuing with numbers only.

`code8.txt`

You can see from the code above in line 38 that we used a `RegularExpressionValidator`. We could have also used a `IntValidator` to accept only integers.

## TextInput vs TextField

The `TextField` is another visual item that has a border and a background. You can customize it just as we have customized the `TextInput`.
