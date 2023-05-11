# Slots

[text]

## Defining slots

`code_py.txt`

`code_pyfunc.txt`

`code_qml.txt`

If we choose to pass in values to the slot we can.

`code_py1.txt`

`code_pyfunc1.txt`

`code_qml1.txt`

You can see that PyQt handled the type conversion. If you however send in a value that cannot be converted to an integer, you see that you get zero instead.

The type of the values must be of a python type or a string representing a c++ type. However know accepted python types are: int, str, list. `dict` is not accepted, to use a `dict` rather use the Qt type in c++ `QVariant`.

You can pass in as many parameters and of different types as you would like because of the slot's heterogenous nature. Other values you can pass are `list` and `'QVariant'`(written as a string-with the quotes)

## Returning values from slots

You can return values from slots as well.

[text]

`code_py2.txt`

`code_pyfunc2.txt`

`code_qml2.txt`

The result type can be of any python type or a string of a c++ type.



## Calling multiple slots by the same name

The name parameter of the slot is the name that QML will call it by.

[text]

`code_py3.txt`

`code_pyfunc3.txt`

`code_qml3.txt`

[text]
