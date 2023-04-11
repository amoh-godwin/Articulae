# Popup

A popup provides a controls that is drawn with a higher z-index that almost all other controls.

## Basic use

A Popup can be found in the QtQuick.Controls.Basic package. It can be used by calling the Popup object

`code.txt`

Its modal can be turned on of off by setting the modal property

`code1.txt`

## Z-index

The z-index of a Popup is very high, probably the highest in QML. If you set it manualy you might run into problems like the z-index a ComboBox's popup might fall through.

`code2.txt`

If you insist on setting the z-index of a Popup, you can fix this problem by also setting the popup of the comboBox to a +1 of whatever the index of the ComboBox itself is.

## Close Policy

There is a closePolicy property, which controls how a popup closes. It is already set to close when there is a press outside of the bounding area of the popup. You can change this behaviour, so that the popup will close when a user clicks outside of the parent of the popup. This way if someone is on settings pane, he/she cannot request a new change in the settings whiles he hasn't accepted or cancelled the current setting he is trying to make, but if he/she chooses to click outside of the settings, then we know that he/she doesn't intend to change any settings so we cancel out and close the popup.

`code3.txt`

From the popup above the code will only close if you press outside of its parent.

## Positioning

[text]

`code4.txt`

[text]

## Tooltip

[text]

`code5.txt`

[text]
