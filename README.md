# swift-action-sheet
A sample with different types of action sheets for iOS in Swift.

We are using the popular library [SwiftEntryKit](https://github.com/huri000/SwiftEntryKit), as it already covers different types of sheets.


## How to get it work ##

#### 1. Install pod
````
pod 'SwiftEntryKit', '1.2.3'
````

#### 2. Drag the ````Utils```` folder to your app.

#### 3. ````ViewController```` class has examples on how to configure few action sheets, toasts and alert boxes.

## Show a custom View in action sheet

#### In your CustomView.swift
````
 required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    private func setup() {
        fromNib()
        clipsToBounds = true
        layer.cornerRadius = 5
        
        // Do any setups for this class here..
     }
 ````
 
 #### On the ViewController.swift
 
 ````
     func showCustomListViewAsSheet() {
        
        // Create a sheet that appears from bottom
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = .infinity
        attributes.screenInteraction = .absorbTouches
        attributes.entryInteraction = .forward

        // Set its background to white
        attributes.entryBackground = .color(color: .white)

        // Animate in and out using default translation
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        SwiftEntryKit.display(entry: CustomView(), using: attributes)

    }
````
