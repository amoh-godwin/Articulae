# Images

With images, you can just provide `width` and `height` and then set the `source`. The `source` is the url of the image file and your file image will just show up.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Images"

    Image {
        width: parent.width
        height: parent.height
        source: "./pexels-paul-ijsendoorn-33041.jpg"
    }


}

```

There are two things wrong with this approach.

* All of the image gets loaded into the RAM, even though the dimensions specified with `width` and `height` might be smaller than the images' dimensions.

* You can not preserve the Images' aspect ratio. By this I mean the image will strecth if the specified `width` and `height` are not the actual dimensions of the image.

The best way is to add a `sourceSize`. `sourceSize` controls just how much of the image is loaded into the RAM. And the `sourceSize`'s dimensions will be used for aspect ratio preservation.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Images"


    Image {
        width: parent.width
        height: parent.height
        sourceSize.width: 250
        sourceSize.height: 250
        source: "./pexels-paul-ijsendoorn-33041.jpg"
        fillMode: Image.PreserveAspectFit
    }


}

```

Apart from `PreserveAspectFit`, you can also have `PreserveAspectCrop`.
