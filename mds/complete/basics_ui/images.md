# Images

We will be using this Image for our study of images. You can use any image you choose. But to understand the concepts try and use and image with the width greater than the height.

![](D:\Tutsandbox\educative\stadium.jpg)

Its dimensions are: *2048x1216*

With images, you can just provide `width` and `height` and then set the `source`. The `source` is the url of the image file and your file image will just show up.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Images"

    Image {
        width: parent.width
        height: parent.height
        source: "./stadium.jpg"
    }

}
```

There are two things wrong with this approach.

* All of the image gets loaded into the RAM, even though the dimensions specified with `width` and `height` might be smaller than the images' dimensions.

* You can not preserve the Images' aspect ratio. By this I mean the image will strecth if the specified `width` and `height` are not the actual dimensions of the image.

### SourceSize

You can add a  `sourceSize`. `sourceSize` controls just how much of the image is loaded into the RAM. It thus controls the maximum dimensions of an Image.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Images"


    Image {
        sourceSize.width: 400
        sourceSize.height: 600
        source: "./stadium.jpg"
    }


}
```

Source size actually takes Qt.size

```qml
...

    Image {
        sourceSize: Qt.size(400, 600)
        source: "./stadium.jpg"
    }

...
```

 With this the image is display with the aspect ratio preserved.

### fillMode

You can preserve the apsect ratio yourself, using fillMode.

with `PreserveAspectFit`

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Images"


    Image {
        width: parent.width
        height: parent.height
        sourceSize.width: 400
        sourceSize.height: 600
        source: "./stadium.jpg"
        fillMode: Image.PreserveAspectFit
    }


}
```

With `PreserveAspectCrop`.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Images"


    Image {
        width: parent.width
        height: parent.height
        sourceSize.width: 400
        sourceSize.height: 600
        source: "./stadium.jpg"
        fillMode: Image.PreserveAspectCrop
    }


}
```

### sourceclip

We can clip a portion of the image using `sourceClipRect`

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Images"


    Image {
        width: parent.width
        height: parent.height
        source: "./stadium.jpg"
        sourceClipRect: Qt.rect(300, 150, 400, 600)
    }


}
```
