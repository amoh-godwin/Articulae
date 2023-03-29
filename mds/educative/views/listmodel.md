# ListModel

[text]

```qml
ListModel {
    ListElement {
        folder_name: "Picture"
        total_files: 50
    }
    ListElement {
        folder_name: "Desktop"
        total_files: 55
    }
}
```

[text]

When there is just one ListElement, there will be a modelData, but whe there is more there wouldn't be any.

`code1.txt`

`code1_listmodel.txt`

[text]

We can put this into a file

`code2.txt`

`code2_listmodel.txt`

`code2_model.txt`

We can write as many as we want both for the list view and the attributes

`code3.txt`

`code3_model.txt`

`code3_delegate.txt`

[text]

## listview.sections

[text]

- using criteria: fullstring

`code4.txt`

`code4_header.txt`

`code4.delegate.txt`

`code4_model.txt`

`code4.section_delegate.txt`

[text]

## updating the model

[text]
