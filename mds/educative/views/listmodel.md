# ListModel

A ListModel contains a set of ListElements each with defined data roles. These data roles can be used in a delegate as you would any defined property. It is the best option for models for all view type that require a model.

## Basic use

A ListModel is found in the QtQuick package. Below is an example of a simple declaration of a ListModel with two ListElements each has two defined data roles.

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

When there is just one ListElement, there will be a modelData, but whe there is more there wouldn't be a dataModel defined.

`code1.txt`

`code1_listmodel.txt`

We can change the model to include two data roles to see the effect it has on the modelData.

We can put the model in a file. In the case, where we have a lot of ListElements this would keep things tidy, generally it is pragmatic to write the ListModel in a seperate file.

`code2.txt`

`code2_listmodel.txt`

`code2_model.txt`

Like we have be saying you can write as many ListElements as you want and you can have as many data roles as you would want in a ListElement. But the data_roles must not be unique for every ListElement.

`code3.txt`

`code3_model.txt`

`code3_delegate.txt`

## listview.sections

A ListView can group entries into sections. We can set which data role it should use for the grouping of the items.

The name of the data role will be set to the property `section.property`. The `section.criteria` will tell QML how the value of the `section.property` should be used for the group. `ViewSection.FirstCharacter` means only the first character should be matched for the grouping. This way if the data role used was `name`, all the ListElements that begins with A, will be grouped under a section named A, those that begin with B, under a section name B, and so on.  `ViewSection.FullString` means the entire string should be used for the grouping.

- using section.criteria: ViewSection.FullString

`code4.txt`

`code4_header.txt`

`code4.delegate.txt`

`code4_model.txt`

`code4.section_delegate.txt`

If you want all entries under one section to be grouped under that section, then you should arranged them next to each other.

## updating the model

The whole concept of a model is to be just that - a model that the data will imitate. So it is really easy and efficient to append to a model. ListModel offers several options to update a model, append to add an entry at the bottom of the existing entries, insert to insert and entry at a specified index, set to change the data at a particular index and the setProperty to change the property of an entry.

Let's take a look at the append method.

`code5.txt`

`code5_delegate.txt`

Lets also take a look at the insert method

`code6.txt`

`code6_delegate.txt`

In most cases, what you would want is a completely blank ListModel that offers all the update methods. Because most of the time, all of your data would be coming from a data source like a database or from files.

`code7.txt`

`code7_delegate.txt`

Listmodel has a `clear` method to delete everything you have in a model.
