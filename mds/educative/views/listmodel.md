# ListModel

A `ListModel` contains a set of `ListElement`s each with user-defined properties known as data roles. These data roles can be used in a delegate as you would use any defined property. It is the best option for models of all view types that require a model.

## Basic use

A `ListModel` is found in the `QtQuick` package. Below is an example of a simple declaration of a `ListModel` with two `ListElement`s each with two defined data roles, `folder_name` and `total_files`.

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

When using ListModels and there is just one property defined in a `ListElement`, there will be a `modelData` for use by a view type, but where there is more there wouldn't be a `modelData` defined.

`code1.txt`

`code1_listmodel.txt`

A ListView that accesses a ListModel's attributes using the mdelData property



You can see from the code above that, we have only one property `folder_name` defined in **line 15** and **line 18**. This means that a delegate can access the value of these properties by just using the `modelData` property, as you can see it has been used in the file **ListModelDelegate.qml** in **line 17**.

We can change the model to include two data roles to see the effect it has on the `modelData` property.

We can put the model in a file. In the case, where we have a lot of `ListElement`s this would keep things tidy, generally it is pragmatic to write the `ListModel` in a separate file. Lets see this in the code playground below.

`code2.txt`

`code2_listmodel.txt`

`code2_model.txt`

A Listview's delegate unsuccessfully attempts to access data from the ListModel using the modelData attribute.





From the code above, we have placed our model in the separate file **FileListModel.qml** and simultaneously created a custom type. In **line 15**, we have set this new custom type `FileListModel` to the `model` attribute

Like we have be saying you can write as many `ListElement`s as you want and you can have as many data roles as you would want in a `ListElement`. But the data roles must be the same for all the elements and must not all be unique for every `ListElement`.

`code3.txt`

`code3_model.txt`

`code3_delegate.txt`

A ListView that uses a ListModel with many data roles. A header and a footer has been added to give the data more clarity





#### Working with sections

A `ListView` can group entries into sections. We can set which data role it should use for the grouping of the items.

The name of the data role will be set to the property `section.property`. The `section.criteria` will tell QML how the value of the `section.property` should be interpreted. `ViewSection.FirstCharacter` means only the first character should be matched for the grouping. This way if the data role used was `name`, all the `ListElement`s whose `name` property begins with A will be grouped under a section named A, those that begin with B under a section name B, and so on. `ViewSection.FullString` means the entire string should be used for the grouping.

- using `section.criteria: ViewSection.FullString`

`code4.txt`

`code4_header.txt`

`code4.delegate.txt`

`code4_model.txt`

`code4.section_delegate.txt`

A ListModel that has been used to implement a ListView with sections





If you want all entries under one section to be grouped under that section, then you should arranged them next to each other.

## Updating the model

The whole concept of a model is to be just that - a **model** (*imagine a real-life model*), that the data will imitate. So it is really easy and efficient to append to a model.

`ListModel` offers several options to update a model:

- `append` to add an entry at the bottom of the existing entries.
- `insert` to insert an entry at a specified `index`
- `set` to change the data at a particular `index` and
- `setProperty` to change a single property of an entry.

Let’s take a look at the `append` method.

`code5.txt`

`code5_delegate.txt`

A ListView model that gets updated using the ListModel's append method

Lets also take a look at the `insert` method

`code6.txt`

`code6_delegate.txt`

In most cases, what you would want is a completely blank `ListModel` which you would later update with data, because most of the time, all of your data would be coming from a data source like a database or from files.

`code7.txt`

`code7_delegate.txt`

An empty ListModel that get more all of its data added with the append method



From the code above, we have a completely blank model like we have in **line 17** which we later append data to as you can see in **line 32**.

`Listmodel` also has a `clear` method to delete everything you have in a model.
