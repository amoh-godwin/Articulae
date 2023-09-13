# Combo Box

A `ComboBox` gives you sort of a dropdown of options that a user can select from.

## Basic use[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6630856455356416#Basic-use)

To use a `ComboBox`, you import the `QtQuick.Controls.Basic` package and then you call the `ComboBox` object.

`code.txt`

#### Data roles[#](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6630856455356416#Data-roles)

If the model that propagates a `ComboBox`'s is a list, the property that draws the text data is always the `modelData` property, or the ever present `index` property. But in some cases if you want what a user selects in a `ComboBox` to be a representative of a code or id which will later be put in a database or be used for further computation, then you can use a `Listmodel`. If you use a `Listmodel`, a `ComboBox` will work with two properties, `textRole` and the `valueRole`. The `textRole` will draw the text that will be shown in the popup of a `ComboBox`, its correspondence will be the `valueRole`. You have to set which of the properties or attributes in your `ListModel` you want to use as the `textRole`, and which of them you want as the `valueRole`.

`code1.txt`

From the code above, from **lines 15 to 28** we have defined a model. In lines **12 and 13** we have set the `textRole` and `valueRole` of the `ComoboBox` to the properties `course` and `course_id` respectively.

## Getting selected values[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6630856455356416#Getting-selected-values)

When a user selects an entry from the options in the popup of the `ComboBox`, the selected entry will now become the current entry showing in the `ComboBox`, this event is known as `activated`. The `ComboBox` also sets two properties, `currentText` and `currentValue` to correspond to the `textRole` data and the `valueRole` data that is currently showing in the `ComboBox`. You can use the corresponding signal handler to respond to the `activated` signal.

`code2.txt`

## 

- Handling the width of the ComboBox

To change the width of the `ComboBox` there is a content width policy that controls how the width of the `ComboBox` should be drawn.

`code3.txt`

## 

- The displaytext property

There is a `displayText` property which sets what text is shown in the `ComboBox`. If you are not satified with the `textRole` and/or you want to modify the `textRole`, you can set the `displayText` property directly.

`code4.txt`

#### Making a ComboBox editable[#](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6630856455356416#Making-a-ComboBox-editable)

`ComboBox` can be used as if it is a `TextInput` and `ComboBox` combination. You can make the display editable and the model data of the combo will be used as some of sort suggestions as the user types. To do this you set the `editable` property to `true`.

The `editText` property holds the text currently in the editable field, you can do whatever you want with it, you can save it or add to the model.

Lets see how we can make a `ComboBox` editable and so get access to its edited text.

`code5.txt`

#### Signals[#](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6630856455356416#Signals)

There are several signals that are emitted for a `ComboBox`

- `accepted`
  
  This signal is emitted when the user clicks the enter or return button on the keyboard.

- `find`
  
  `find` searches if a text is in the `model` of the `ComboBox`. It returns the `index` of the entry if found. If nothing is found it returns `-1`.

- `activated`
  
  This signal is emitted when the user clicks on an entry in the `ComboBox`'s `popup`, which will then cause the popup to close.

`code6.txt`

A `ComboBox` is without replacement in the world of UI programming.
