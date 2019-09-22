# BadgeSegments

[![CI Status](https://img.shields.io/travis/morteza.ghrdi@gmail.com/BadgeSegments.svg?style=flat)](https://travis-ci.org/morteza.ghrdi@gmail.com/BadgeSegments)
[![Version](https://img.shields.io/cocoapods/v/BadgeSegments.svg?style=flat)](https://cocoapods.org/pods/BadgeSegments)
[![License](https://img.shields.io/cocoapods/l/BadgeSegments.svg?style=flat)](https://cocoapods.org/pods/BadgeSegments)
[![Platform](https://img.shields.io/cocoapods/p/BadgeSegments.svg?style=flat)](https://cocoapods.org/pods/BadgeSegments)

## ScreenShots

**standard**

![alt text](https://raw.githubusercontent.com/Mor4eza/BadgeSegments/master/screenshot1.png)



**Underlined**

![alt text](https://raw.githubusercontent.com/Mor4eza/BadgeSegments/master/screenshot2.png)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- Swift => 5
- iOS => 10

## Installation
**Cocoapods**

BadgeSegments is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BadgeSegments'
```
**Manual**

simply copy classes folder to your project directory

# How to Use

  add a UIView to your view Controller and sub class it from BadgeSegments class
  ```swift
  @IBOutlet weak var badgeSegment: BadgeSegments!
    override func viewDidLoad() {
        super.viewDidLoad()


          let items = [SegmentItem(title: "first",isSelected: false,badgeNumber: 20),
                     SegmentItem(title: "second",isSelected: true),
                     SegmentItem(title: "third",isSelected: false,badgeNumber: 12)]
        badgeSegment.appearence = .standard
        badgeSegment.delegate = self
        badgeSegment.setUpSegments(with: items)
    }
  ```
  **Delegate**
  ```swift
  class ViewController: UIViewController, BadgeSegmentDelegate {
  
     func didSelectSegment(with index: Int) {
        print(index)
     }
    
  
  }
  ```
  **Change Values**
  ```swift
   badgeSegment.setTitle(inIndex: 0, title: "changed")
        badgeSegment.setSelected(inIndex: 2)
        badgeSegment.setBadgeNumber(inIndex: 1, badgeNum: 12)
  
  ```

# TO Do
- [ ] add animation
- [ ] more default appearences
- [ ] support images
- [ ] customize badge view
- [ ] add UITest and UnitTest


# Made with Love in 🇮🇷
Morteza Gharedaghi: Morteza.ghrdi@gmail.com

feel free to create issue or open a pull request ☺️


# Used in
send your application name to me,if you used this library 

- Wink App

## License

BadgeSegments is available under the MIT license. See the LICENSE file for more info.
