# Listview

`ListView` is not only the most popular view type in QML, it is also the most popular view type in UI designing. You will be amazed at what you can do with it.

## Basic use

A `ListView` is found in the `QtQuick` package, not in the `QtQuick.Controls` package. Let’s see how you use it in a simple way.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ListView {
        anchors.fill: parent
        model: 5
        delegate: dele
    }

    Component {
        id: dele
        Rectangle {
            width: 800
            height: 40
            border.width: 2

            Text {  
                anchors.verticalCenter: parent.verticalCenter
                text: "C:/filename"
                font.pixelSize: 14
            }
        }
    }

}
```

A basic implementation of a ListView with a model and a delegate

In the above code from **lines 11** to **15**, we have declared a `ListView` which fills the dimensions of its parent. In **line 13**, we have a very simple integer model `5`, and a `delegate` on **line 14**, which is a `Rectangle` with a text that says “C:/filename”. The `delegate` repeats itself 5 times to match the total of the `ListView`'s `model`, which for our simple integer model `5`, is also 5.

## Delegate

A `delegate` has access to a `model`'s properties. We are using a simple model, and so we don’t have any property defined. But there is a default property for every type of model that there is, that property is `index`.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ListView {
        anchors.fill: parent
        model: 5
        delegate: dele
    }

    Component {
        id: dele
        Rectangle {
            width: 800
            height: 40
            color: index % 2 == 0 ? "lightgrey" : "white"

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "C:/filename " + index
                font.pixelSize: 14
            }
        }
    }

}
```

A ListView's delegate that changes color based on the model's index property

From the above code in **line 22**, you can see that the `index` property has been used in the `delegate` to choose between two colors for the `delegate`'s `Rectangle`.

The `delegate` can be declared inline. That way, we would have no need to wrap it in a `Component` object. Take a look at the code below from lines 14 to 25, we have declared a delegate inline without the use of a `Component`.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ListView {
        anchors.fill: parent
        model: 5
        delegate:
            Rectangle {
                width: 800
                height: 40
                color: index % 2 == 0 ? "lightgrey" : "white"

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "C:/filename " + index
                    font.pixelSize: 14
                }
            }
    }



}
```

A delegate declared inline without the use of Component

To fill the full width of a `ListView`, do not use the `width` property of the `ListView` directly, it isn’t available, use `ListView.view.width` instead (see line 55 of the code below).

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "lightgrey"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true

                    Rectangle {
                        anchors.right: parent.right
                        width: 1
                        height: parent.height
                        color: "lightgrey"
                    }

                }


                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: 5
                    delegate: Rectangle {
                        width: ListView.view.width
                        height: 40
                        color: index % 2 == 0 ? "lightgrey" : "white"

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "C:/filename " + index
                            font.pixelSize: 14
                        }
                    }
                }

            }

        }

    }

}
```

A ListView's delegate with width set to an attached property

To also keep things tidy, we can put the `delegate` in a custom type.

Lets put it a file called `FilenameDelegate.qml`. This way we can call it as we would any other object.

FilenameDelegate.qml

```qml
import QtQuick


Component {
    Rectangle {
        width: ListView.view.width
        height: 40
        color: index % 2 == 0 ? "lightgrey" : "white"

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "C:/filename " + index
            font.pixelSize: 14
        }
    }
}
```

main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as MyCust

ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "lightgrey"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true

                    Rectangle {
                        anchors.right: parent.right
                        width: 1
                        height: parent.height
                        color: "lightgrey"
                    }

                }


                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: 5
                    delegate: MyCust.FilenameDelegate {}
                }

            }

        }

    }

}
```

A ListView's delegate placed in a custom type

In the above code in **line 54**, you can see that we’ve put the `delegate` in a custom type, **FilenameDelegate** and we have used it. You can see this file in the code playground. In **line 4**, We have imported the current folder and namespaced it as `MyCust`. So we call the `FilenameDelegate` through the `MyCust` namespace.

## Highlight

To highlight the currently selected item inside a `ListView`, a `highlight` property is used. You can set it to an item or a `Component`.

FilenameDelegate.qml

```qml
import QtQuick


Component {
    Rectangle {
        width: ListView.view.width
        height: 40
        color: "transparent"

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 12
            text: "Downloads " + index
            font.pixelSize: 14
        }
    }
}
```

main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as MyCust

ApplicationWindow {
    visible: true
    width: 280
    height: 500

    ListView {
        anchors.fill: parent
        anchors.topMargin: 4
        model: 7
        delegate: MyCust.FilenameDelegate {}
        highlight: Rectangle {
            color: "#33f4a3"
            radius: 8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 6
            anchors.rightMargin: 6
        }
        focus: true
    }


}
```

A highlight item added to a ListView

From lines 16-23 of the code, for the main.qml file, you can see that we have set the highlight property to a Rectangle.

`highlight` draws behind the `delegate`. It has an `z` index of `0`, so its either you change the z-index to be higher than the `delegate`, which has a z-index of `1` or you set the `background` of the `delegate` to be `transparent`, so important things like texts and icons show.

If you prefer to you can set its z-index to `2` and then play with the `opacity` values to your preference.d We have done that in line 17 of the code below.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as MyCust

ApplicationWindow {
    visible: true
    width: 280
    height: 500

    ListView {
        anchors.fill: parent
        anchors.topMargin: 4
        model: 7
        delegate: MyCust.FilenameDelegate {}
        highlight: Rectangle {
            z: 2
            opacity: 0.5
            color: "#33f4a3"
            radius: 8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 6
            anchors.rightMargin: 6
        }
        focus: true
    }


}
```

A highlight of a ListView with a z-index set to 2

In the code above, in **line 26** we have `focus: true`, this is what enables us to receive key input in the `Listview`. It should preferably be the last property to be set for the `Listview`. The key input the `Listview` is reacting to is just the key navigations. You can disable this by setting `keyNavigation: false`, you can disable both key and mouse input for the `ListView` by setting `interactive: false`. For now the only mouse event we respond to is the flicking of the `ListView` itself. Whiles key navigation is enabled, we can move the highlight from the first list entry at the top to the last entry at the bottom, but it doesn’t warp back up when we reach the bottom and continue to press the down bottom. It also doesn’t do the vice-versa. We can make it warp back by setting the property, `keyNavigationWraps`. This will make sure the current item selection moves past the end of the list to the start.

`code3.txt`

`code3_filename.txt`

A ListView with Navigation wrapping

From the code above, in **line 15** you can see that we have set the `keyNavigationWraps` property to true.

We can handle mouse inputs better using the `MouseArea` object which we will study in the User Inputs chapter.

You can indicate which item is the current item without using a highlight component. The `ListView` provides the `ListView.isCurrentItem` attached property which will let you know if an item is the currently selected item. We often use this property to style the item to indicate that it is the current item.

`code4.txt`

`code4_filename.txt`

Using ListView.isCurrentItem to indicate if a delegate is selected

From the playground above, form the `FilenameDelegate.qml` file, in **lines 10, 19, 25 and 30** you can see that we have used the `ListView.isCurrentItem` attached property to change the color of several elements. Because the `ListView.isCurrentItem` to items that were nested within the delegate, we referred to the delegate itself

## Header

You can display a header for the `ListView` by using the `header` property.

`code5.txt`

`code5_delegate.txt`

`code5_header.txt`

`code5_footer.txt`

A ListView with a header set

In the code above:

- In **line 35**, we have the `clip` set to `true`. If you set it to `false`, the `ListView` will overflow its container and the `footer` will misbehave. You can change it in the code playground to see the effect.

## Orientation

A `ListView`'s default orientation is to scrolls upwards which is from bottom to top, you can change the `orientation` so it scrolls horizontally from right to left.

`code6.txt`

`code6_horizontal.txt`

A ListView with a horizontal orientation

## ListView as scrollview's alternative

There is an implementation of a photo viewer, where only one image is viewed at a time and the user can swipe to view the next image. This implementation will be expensive to implement in a `SwipeView` so it is discouraged to use a `SwipeView` for that. But a `ListView` can make up for that, it can be used to implement that kind of swiping effect by setting the `snapMode` to only one item at a time. This means that whenever a user scrolls, the view will be snapping to the next single item, and not as previously, when it stopped anywhere in the view according to how much you flicked or scrolled the view.

`code7.txt`

`code7.snapmode.txt`

A ListView used to implement a sort of a swipe view

In the above code, in **line 19**, you can see that we have set the `snapMode` to `ListView.SnapOneItem`. We have also made the `delegate` to fill the entire width of the `ListView` since only one item will be available at a time.

## Model

So far we have only seen only the integer model.

At this time you are feeling the limitation of our simple model.

There are other types of models as well; a list, a `ListModel`, an object model, and an `XmlListModel`.

We won’t be studying the object model and the `XmlListModel` because they are the two least used model types in QML.

Models have attributes or properties that we can access from inside a delegate. We have already looked at one, the `index` property. This is available for all model types, even for our integer model. Then there is also a `modelData`, which is available for a list or a `ListModel` with a single property set.

Lets see an example of using a list as a model (not a `ListModel`)

`code8.txt`

`code8_modeldata.txt`

A ListView with a list as a model

Lets discuss ListModels in the next lessonIn the above code, in **line 15** of the **main.qml** we have set a list to be the model. Then in **line 17** of the **ModelDataDelegate.qml**, we have used the `modelData` property to set the `text` property of our `Text.` Now when you run, you can see that the `delegate` repeats four times according to the length of the list we have as the `model` and that the text of each represents each element that was in the list.
