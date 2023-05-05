# Customizing A Slider

[text]

## Bacis customization

If you set direct width and height for the slider it will disable the default movements of the handle. So we use the implicit dimension like we have been using.

`code.txt`

Cleary you don't need the border, I added it so you can see.

### Customizing the handle

The visualPosition returns a value from 0 to 1. We can use visualPosition * slider.width, but that will set the x of the handle at the very edge of the slider and the handle will overflow the slider's containter. So we instead substract the width of the handle itself before multiplying it by the visualPositon. 

`code1.txt`

### Modifying the background

But the background itself is usually used to as the progress. With this approach you have to set a direct width and height for the background item and also use the padding properties to set it to the center. You must set the width to the slider's available Width or else the width of the background will overflow the slider boundary.

`code2.txt`

[text]


