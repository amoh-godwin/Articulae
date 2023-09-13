# Checkbox

A `CheckBox` is a checkable button or box that can be toggled as checked or unchecked. In modern day `CheckBox`es, there is a third state which is a partial check. It happens if a check means a set of tasks has been done or added, if part of task has been done or added the `CheckBox` assumes a partial checked state.

## Basic use

A `CheckBox` is found in the `QtQuick.Controls.Basic` package. You will need to specify a `text` which will render as the text for the choice you want the user to read and make the selection on.

// code

## Partial checked state

To illustrate the partial checked state. Lets add a `CheckBox` that will be checked when all the other `CheckoBx`es are checked. We will be using a `ButtonGroup`. A `ButtonGroup` groups a set of buttons, mostly checkboxes and radio buttons. With that you can control their state by controlling the `ButtonGroup`. We will discuss more of a `ButtonGroup` later when we discuss `RadioButton`s.

Lets use a `ButtonGroup`. We need to set the `exclusive` property to `false`, other than that, only one child of the `ButtonGroup` can be selected at a time, since that is not what we want, we set it to exclusive.

// code

In the code above, in **lines 16 - 20**, we have declared a `ButtonGroup`. In **line 18** its buttons has been set to `check_rows.children`. `check_rows` is the id of the `ColummLayout` that the `CheckBox`es are in. In **lines 28 - 31**, we have a `CheckBox`, which `checkState` has been set to the `checkState` of the `ButtonGroup`. A `ButtonGroup` supplies all three check states by default.

## Setting tristate

A `CheckBox`'s `checkState` can be set to `Qt.Checked`, `Qt.Unchecked` and `Qt.PartiallyChecked`. But by default you can only toggle it for two states, the checked and the unchecked. To make it to be checkable for all three states, you have to set the `tristate` property to true.

// code

From the above code, you can see that the “I know a lot about Python” `CheckBox` can be selected partially to show that you are not so sure of your Python knowledge or that you are an intermediate user of the language.
