# NSStructMapper


[![Version](https://img.shields.io/cocoapods/v/NSStructMapper.svg?style=flat)](https://cocoapods.org/pods/NSStructMapper)
[![License](https://img.shields.io/cocoapods/l/NSStructMapper.svg?style=flat)](https://cocoapods.org/pods/NSStructMapper)
[![Platform](https://img.shields.io/cocoapods/p/NSStructMapper.svg?style=flat)](https://cocoapods.org/pods/NSStructMapper)
![Swift 5](https://img.shields.io/badge/Swift-5-orange.svg?style=flat)
![Country](https://img.shields.io/badge/Made%20with%20%E2%9D%A4-pakistan-green.svg)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

**Step 1:** Create identical classes
```swift
  // Same property names along with interchangeable data types between swift and objc

  // MARK: - Swift Address
  struct Address {
      var city: String?
      var zipCode: String?
  }

  // MARK: - Swift Equivalent ObjC Address
  @objc class NSAddress: NSObject {
      var city: String?
      var zipCode: String?
  }
```
**Step 2:** Conform your data models
```swift
  // Conform your swift structs with Mappable
  struct Contact: Mappable

  // Conform your NSObjects with NSMappable
  @objc class NSContact: NSObject, NSMappable
``` 

**Step 3:** Implement Methods
```swift
  // Conform your swift structs with Mappable
  struct Contact: Mappable {
    // Your properties
    
    // Write the following code in Mappable, result should be type of NSObject you want to convert in
    func nsObject() throws -> Storable {
        let result: NSContact = try conversionLogic()
        return result
    }
  }

  // Conform your NSObjects with NSMappable
  @objc class NSContact: NSObject, NSMappable {
    // Your properties
    
    // Write the following code in NSMappable, result should be type of SwiftObject you want to convert in
    func swiftObject() throws -> Mappable {
        let result: Contact = try conversionLogic()
        return result
    }
  }
```

**Step 4:** Enjoy
```swift
  // Convert your SwiftObject to NSObject
  let nsContact: NSContact = try! contact.nsObject() as! NSContact
  
  // Convert your NSObject to SwiftObject
  let sob: Contact = try! nsContact.swiftObject() as! Contact
``` 

## Installation

NSStructMapper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NSStructMapper'
```

## Author

salmaan.ahmed@hotmail.com

## License

NSStructMapper is available under the MIT license. See the LICENSE file for more info.
