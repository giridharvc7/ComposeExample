# VCGrowingTextView
This is a drop in replacement for a textview that resizes its height based on the content inside, for now, it is only autolayout enabled. 

![](example1.gif)

## XIB Usage

* Drag and drop an UITextView and set the class as `VCGrowingTextView`
* Make sure to **Disable** scroll in the Textview
* Optionally Set properties `minHeight`,`maxHeight`,`placeHolder`
Check example project for more info
---
The example project is similar to Facebook & Twitter's Compose page