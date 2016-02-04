# ComposeExample
This project contains a very immature replicate of twitter and facebook's compose page that should give you an idea of how to go about designing the compose page for your app. 

The project also contains a drop in replacement for  `UITextview` that resizes its height based on the content inside, for now, it is only autolayout enabled.It also holds a placeholder text. 

##### Here's how it looks

![](example1.gif)

## Using the VCGrowingTextView in XIB

* Drag and drop an UITextView and set the class as `VCGrowingTextView`
* Make sure to **Disable** scroll in the Textview
* Optionally Set properties `minHeight`,`maxHeight`,`placeHolder`
