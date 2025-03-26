# Connect Python and Qml

[text]

## Basic connection

[text]

`code_py.txt`

`code_qml.txt`

[text]

With this we can even modify QML properties from within Python.

`code_py1.txt`

If we attempt to update the value constantly the UI is going to freeze. The reason why most UI freeze when you click a button or try to interact with it is because threading hasn't been implemented for that function. If we implemented threading for this function we would then be able to update the value as and when we want.

## Whole object connection

This method is used mostly.

`code_py2.txt`

`code_qml2.txt`

[text]

According to pragmatics, we place the object in a new file.

`code_py4.txt`

`code_pyfunc4.txt`

`code_qml4.txt`

[text]
