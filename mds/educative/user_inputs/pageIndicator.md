# Page Indicator

A PageIndicator provides a way to visualize the page you are currently when using a container that handles multiple pages.

## Basic use

A PageIndicator is in the QtQuick.Controls.Basic package. It can be used by calling the PageIndicator object

`code.txt`

[text]

## Interactiveness

You can make a PageIndicator clickable. Then the clicked entry will become the current Index. If for instance the currentIndex of the PageIndicator is bound to the currentIndex of a SwipeView, it will control which page is the current page.

`code1.txt`

## Customization

You can cusomize the look and feel of a PageIndicator.

`code2.txt`

From the code above you can see that the PageIndictor's circle indicators have been made Rectangular and then they change in size when they become the current entry.
