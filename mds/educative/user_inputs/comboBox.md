# Combo Box

A ComboBox gives you sort of a dropdown of options that the user can select from.

## Basic use

To use a comboBox, you import the QtQuick.Controls.Basic package and then you call the ComboBox object.

`code.txt`



## Data roles

If the model that propagates a comboBox's is a list, the property that draws the text data is always the modelData property, or the ever present index property. But in some cases if you want what a use select in a combobox to be a representative of a code or id which will later be put in a database or be used for further computation, then you can use a Listmodel. If you use a Listmodel, a ComboBox will work with two properties, textRole and the valueRole. The textRole will draw the text that will be shown in the popup of a combobox, its correspondence will be the valueRole. You have to set which of the attributes in your Listmodel you want to use as the textRole, and which of them you want as the valueRole.

`code1.txt`

## currenttext and currentvalue

When a user selects an entry from the options in the popup of the comboBox, the selected entry will now become the current entry showing in the comboBox, this event is known as activated. The comboBox also sets two properties, currentText and currentValue to correspond to the valueRole data and the textRole data that is currently showing in the comboBox. You can use the corresponding signal handler to respond to the activated signal.

`code2.txt`

## contentwidth policy

There is a contentWidth policy that controls how the width of the comboBox should be drawn.

`code3.txt`

## displaytext

There is a displayText property which sets what text is shown in the comboBox. If you are not satified with the textRole and/or you want to modify the textRole, you can set the displayText property directly.

`code4.txt`

## Editable

ComboBox can be used as if it is a text field and comboBox combination. You can make the display editable and the model data of the combo will be used as some of sort suggestions as the user types. To do this you set the editable property to true.

The editText property holds the text currently in the editable field, you can do whatever you want with it.

`code5.txt`

## Signals

There are several signals that are emitted for a ComboBox

* accepted
  
  That accepted signal is emitted when the user clicks the enter or return button.

* Find
  
  Find searches if a text is in the model of the comboBox. It returns the index of the entry if found, if nothing is found it returns -1.

* activated
  
  The activated signal is emitted when the user clicks on an entry in the comboBox's popup which causes the popup to close.

`code6.txt`

[text]
