# Dialogs

A Dialog is a popup take requires you to perform some action before resuming with whatever that you want to do. There are several dialogs in QML, a normal dialog, a file dialog and a folder dialog. A basic dialog is found in the QtQuick.Controls.Basic package, but a FileDialog and a FolderDialog are both found in the QtQuick.Dialogs package.

## Basic Dialog

A basic Dialog gives you a popup that insists the user selects an option by clicking a button before continuing with whatever the user wants to do.

`code.txt`

The standard button could have been just one. That one the Dialog is to provide a information to the user.

## File Dialog

A FileDialog provides a popup that allows the user to select a file available on the computer or to create a new path to a file. We can get the file the user selected or created using the selectedFile property.

`code1.txt`

- Setting location for current folder
  
  You can set a folder which will be opened when the FileDialog first opens. The current folder must use the file protocol and hence should be a full path.

`code2.txt`

[text]

`code3.txt`

For FileDialog.ReadFiles the `selectedFiles` property should be used to get the files, it is a list of urls.

- nameFilters - You can restrict the files that can be selected by using the nameFilters property

`code4.txt`

This time the user will get a drop down to select either text files, image files or all files.

## Folder Dialog

A FolderDialog is just like a FileDialog, the only difference is that allows a user to select directories instead of a file

`code5.txt`

![](E:\GitHub\Articulae\mds\educative\user_inputs\dialog6.png)

A user can also create new directories and select them.
